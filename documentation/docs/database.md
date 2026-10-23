# 2. First, a reliable database

Before anything else, **Kubernetes is a database**: a reliable datastore
that holds every record about everything it runs (every app, VM, website,
tenant and setting), **wrapped in an API** that we can extend. Everything
in the following chapters is built on those two pieces, and our own
applications can use them too.

## A key-value store: the simplest kind of database

Kubernetes keeps its records in **etcd** (said "et-see-dee"), a
*key-value store*. If you picture a SQL table with only two columns, you
have it:

| Key (the "address" of the record) | Value (the record itself) |
| --- | --- |
| /deployments/tjs-catfish-and-wings/customer-portal | 3 copies, version 2.4, ... |
| /secrets/tjs-catfish-and-wings/database-password | (encrypted) |
| /tenants/tjs-catfish-and-wings | plan: Gold, region: US-East |

!!! tip "You have used one before"
    The Windows **Registry** is a key-value store: a path like
    `HKEY_LOCAL_MACHINE\SOFTWARE\...` pointing to a value. etcd is the same
    idea, made reliable enough to run a data center.

!!! note "etcd is the default, not the only choice"
    We use **etcd** in our clusters. Kubernetes can also keep its records in
    **PostgreSQL** or **NATS** (k3s, the lightweight Kubernetes we run at
    the edge, can even use SQLite or MySQL). Same API on top, a different
    database underneath.

## Why it is reliable

etcd keeps every record on **three (or five) servers**. A change only
counts once **most of them agree** they have it. One server can die, or
be patched, and nothing is lost and nothing stops: the others carry on.
That is a SQL Server Always On availability group, built in and free.

## The API wraps the database

Nobody talks to the datastore directly. Every read and write goes through
the Kubernetes API, which checks **who you are**, whether you are
**allowed**, whether the record is **valid**, **keeps history**, and
**tells everyone watching** that something changed. The verbs are the
ones you know: GET, POST, PUT and DELETE are SELECT, INSERT, UPDATE and
DELETE.

## What it gives us that a plain database does not

The API sits in front of the store, so every record gets features we would
otherwise have to build ourselves:

| Feature | What it means | SQL Server comparison |
| --- | --- | --- |
| **Replicated** | Kept on 3 or 5 servers at once; losing one loses nothing | An Always On availability group |
| **Watch** | Programs are *told* the moment a record changes, no polling | Triggers or change tracking |
| **Versioned** | Two people cannot overwrite each other's change by accident | A rowversion column |
| **Schema checked** | A record with a wrong or missing field is refused | Column types and constraints |
| **Permissions** | Who may read or change which kinds, per folder | GRANT / DENY on tables |
| **Audit log** | Who changed what, and when | SQL Server Audit |

The **watch** feature is what makes the thermostat from
[chapter 1](big-idea.md) possible: a controller does not have to keep
asking "did anything change?". It is notified instantly.

## Our applications can use it too

An application built for Kubernetes can keep its own small, important data
as records in this API: its settings, the list of customers it serves,
feature switches, the state of a long-running job. It gets replication,
change notifications, permissions and auditing for free, without anyone
setting up or maintaining a separate database for it.

```mermaid
flowchart LR
    app["🧩 Our app"] -- "create / read /<br/>update / delete" --> api(["🚪 Kubernetes API"])
    api -- "tells the app<br/>the moment something changes" --> app
    api --> db[("🗄️ Built-in database<br/>replicated on 3+ servers")]
    tools["📊 Dashboards, Argo CD,<br/>Flux, the command line"] --> api
```

!!! warning "Right tool for the job"
    The built-in database is for **small, important records**: configuration
    and state, not millions of orders or customer files. Big business data
    still belongs in a real database, and thanks to operators like
    CloudNativePG ([chapter 4](extending.md)), getting one of those is just
    another work order.

[Next: Kubernetes is an API :material-arrow-right:](api.md){ .md-button .md-button--primary }
