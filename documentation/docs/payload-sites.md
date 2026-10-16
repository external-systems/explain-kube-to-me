# 8. Example: Payload CMS sites as a product

This chapter puts everything together into one real product: **a Payload
CMS website for a customer, ordered with one request, running on whichever
cloud they choose.** The customer never sees Kubernetes; our platform does
all the work.

## The order form: a PayloadSite route

With KRO ([chapter 3](extending.md)) we add our own route to the API,
`payloadsites`. One record is one customer's Payload CMS site, and it reads
like a short form:

```yaml
apiVersion: kro.run/v1alpha1
kind: PayloadSite
metadata:
  name: bakery-site
  namespace: tenant-smith-bakery    # the customer's folder
spec:
  domain: smithbakery.com
  target: azure-container-apps      # aks | azure-container-apps | gke | cloud-run
  size: small                       # small | medium | large
```

Creating it is one request:
`POST /apis/kro.run/v1alpha1/namespaces/tenant-smith-bakery/payloadsites`.
(`kro.run` is KRO's default group; it can carry our company's name instead.)

## What one POST builds

Payload CMS needs somewhere to run, a database, and a place for uploaded
media. The same form builds all three, on the cloud the customer picked:

| | AKS | Azure Container Apps | GKE | Cloud Run |
| --- | --- | --- | --- | --- |
| **Payload runs on** | Azure Kubernetes Service | Azure Container Apps | Google Kubernetes Engine | Google Cloud Run |
| **Database** | Azure Database for PostgreSQL | Azure Database for PostgreSQL | Cloud SQL | Cloud SQL |
| **Media files** | Azure Blob Storage | Azure Blob Storage | Cloud Storage | Cloud Storage |
| **Address + HTTPS** | Cloudflare | Cloudflare | Cloudflare | Cloudflare |

When everything is ready, the record fills in its status:
`url: https://smithbakery.com, ready: true`.

```mermaid
flowchart TB
    B["🧠 Our Kubernetes cluster<br/>API + KRO + Crossplane"] --> T1["Smith Bakery<br/>Azure Container Apps"]
    B --> T2["Acme Law<br/>AKS"]
    B --> T3["Riverside Church<br/>GKE"]
    B --> T4["Main St Dental<br/>Cloud Run"]
```

Our cluster is the brain; each customer's site runs wherever makes sense
for them. Mixed, multi-tenant, multi-cloud, all through one API.

## How it is built, in pseudocode

```text
ROUTE  POST /apis/kro.run/v1alpha1/namespaces/{tenant}/payloadsites
INPUT  domain, target, size

ALWAYS
  database = Crossplane: Azure Postgres  OR  Google Cloud SQL
  media    = Crossplane: Azure Blob      OR  Google Cloud Storage
  address  = Crossplane: Cloudflare DNS record for domain

WHEN target is "aks" OR "gke"
  app = Deployment + HTTPRoute on that cluster
WHEN target is "azure-container-apps"
  app = Crossplane: Azure Container App
WHEN target is "cloud-run"
  app = Crossplane: Google Cloud Run service

RETURN status.url = "https://" + domain
```

**KRO** writes that recipe down as a *Resource Graph Definition*: a
settings file listing the pieces and when each one applies (`includeWhen`).
KRO reads it, adds the `payloadsites` route on the spot, and creates the
pieces in the right order. **Crossplane** does the cloud part: every Azure
or Google resource in the recipe is itself a Kubernetes record that
Crossplane turns into the real thing, and keeps in line.

Other ways to build the same route:

- **Crossplane alone**, with a Composition (one PayloadSite in, the cloud
  pieces out).
- **Terraform / OpenTofu**, with the Flux OpenTofu controller running one
  module per target.

Whichever engine we use, the customer still just POSTs a PayloadSite, so
we can switch engines later without changing the route.

## Tenants: permissions and limits

Each customer gets a **namespace** (their folder), and two kinds of records
keep them safe and fair:

- **RBAC** (role-based access control) says who may use which routes,
  where. Smith Bakery's staff can see and edit sites only in
  `tenant-smith-bakery`; our portal can create sites in every tenant
  folder; our engineers can do everything.
- **ResourceQuota** sets limits per folder. For a plan that includes two
  sites:

```yaml
kind: ResourceQuota
metadata:
  namespace: tenant-smith-bakery
spec:
  hard:
    count/payloadsites.kro.run: "2"   # at most 2 Payload sites
    requests.cpu: "4"
    requests.memory: 8Gi
```

A third POST is refused with *403 Forbidden: exceeded quota*. On top of
that, Cilium network rules keep tenants from seeing each other's traffic.

## A customer portal on top

The customer-facing part is our own small app with a friendly screen:

```mermaid
flowchart LR
    C["🧑‍🍳 Customer"] --> P["🛒 Our portal<br/>pick plan, pay,<br/>pick Azure or Google"]
    P -- "POST a PayloadSite" --> K["🧩☁️ KRO + Crossplane"]
    K --> L["✅ Site live"]
    L -- "URL + bill" --> P
```

Behind the "Create my site" button the portal does exactly one thing: POST
a PayloadSite. For billing it **watches** the route
(`GET /apis/kro.run/v1alpha1/payloadsites?watch=true`): a site created
starts billing, a size change changes the price, a site deleted stops
billing. That makes the portal an operator too.

The customer buys a website. Kubernetes is invisible to them.

## Why programs inside Kubernetes are cheap to build

Our portal runs inside the cluster, so it gets, for free:

| It needs | Kubernetes gives it | The Windows way |
| --- | --- | --- |
| Somewhere to keep state, and news of changes | The built-in database (etcd) and **watch** | Set up and run a SQL Server |
| To find other services | **CoreDNS**: call `billing.payments` by name | Hard-coded IPs or hosts files |
| An identity with just enough rights | A **ServiceAccount** with RBAC | A shared admin account |
| A public HTTPS address | One **HTTPRoute** record | IIS bindings and a firewall ticket |

Our whole portal is one Deployment, one identity and one HTTPRoute. The
platform supplies the rest.

[Plain-language dictionary :material-arrow-right:](dictionary.md){ .md-button .md-button--primary }
