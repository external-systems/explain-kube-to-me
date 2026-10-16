<!-- .slide: data-background-gradient="radial-gradient(circle at 70% 30%, #3a2a22, #141413 70%)" data-transition="zoom" class="title-slide" -->

<p class="kicker">For Dad</p>

# Kubernetes

<h2>The Extensible API</h2>

<p class="big" style="color: var(--clay)">a Platform that Develops itself</p>

<p class="hint">→ next · ↓ deeper · F full screen · Esc overview</p>

Note:
Set expectations: pictures and comparisons to things he already knows
(Windows Server, IIS, DotNetNuke, Payload CMS, SQL, APIs). The only
"code" tonight is web addresses (HTTP routes), which he already reads
every day. Explain the controls once: right arrow = next topic, down arrow
= a deeper look at the same topic. He can stop you on any slide.

---

## Tonight: five ideas

<div class="row">
<div class="box fragment fade-up"><span class="emoji">🌐</span><b>1. An HTTP API</b>routes you already understand</div>
<div class="box blue fragment fade-up"><span class="emoji">🧩</span><b>2. Extensible</b>we add our own routes</div>
<div class="box green fragment fade-up"><span class="emoji">🗄️</span><b>3. A database</b>behind every route</div>
<div class="box sand fragment fade-up"><span class="emoji">🔧</span><b>4. Plumbing included</b>DNS, network, storage</div>
<div class="box rose fragment fade-up"><span class="emoji">🌍</span><b>5. Owned by everyone</b>community + foundation</div>
</div>

<p class="fragment fade-in muted">Everything is also on the website, to read later.</p>

Note:
This is the map for the evening. If he only remembers one thing: Kubernetes
is an HTTP API, and we can add our own routes to it.

---

## Today: setting up DotNetNuke by hand

<div class="row">
<div class="box gray fragment fade-right"><span class="emoji">🖥️</span><b>Windows Server</b></div>
<div class="arrow fragment fade-right">→</div>
<div class="box gray fragment fade-right"><span class="emoji">🌐</span><b>+ IIS</b></div>
<div class="arrow fragment fade-right">→</div>
<div class="box gray fragment fade-right"><span class="emoji">⚙️</span><b>+ .NET</b></div>
<div class="arrow fragment fade-right">→</div>
<div class="box gray fragment fade-right"><span class="emoji">📝</span><b>+ settings</b></div>
<div class="arrow fragment fade-right">→</div>
<div class="box gray fragment fade-right"><span class="emoji">🧾</span><b>+ the site</b></div>
</div>

<div class="fragment fade-up">
<div class="down">↓</div>
<div class="row"><div class="box solid wide"><span class="emoji">📦</span><b>A container: all of it, sealed in one box</b>runs the same on a laptop, in our server room, in Azure</div></div>
</div>

<p class="hint">↓ why "Kubernetes"?</p>

Note:
He has lived the top row. Ask: how long does a new DNN server take? How
often did it not match the old one? The container packs the app with
everything it needs. Address Docker: Docker Desktop on Windows needs a
Linux layer (WSL), which is why it failed; he never needs it.

--

<!-- .slide: data-transition="convex" -->

## Why "Kubernetes"?

<div class="row">
<div class="box fragment zoom-in"><span class="emoji">📦</span><b>Shipping container</b>one standard shape for any ship or truck</div>
<div class="box blue fragment zoom-in"><span class="emoji">🚢</span><b>A ship full of them</b>hundreds of apps, many servers</div>
<div class="box solid fragment zoom-in"><span class="emoji">☸️</span><b>"Kubernetes"</b>Greek for <i>helmsman</i>, the one who steers</div>
</div>

Note:
The steel shipping container standardised world trade; software
containers did the same for programs. Kubernetes steers the ship. The
logo is a ship's wheel.

---

## The thermostat

<div class="row">
<div class="box fragment fade-right"><span class="emoji">📝</span><b>What we want</b>3 copies running</div>
<div class="arrow fragment fade-right">→</div>
<div class="box solid fragment fade-right"><span class="emoji">🔁</span><b>Compare, forever</b>want vs. have</div>
<div class="arrow fragment fade-left" data-fragment-index="3">←</div>
<div class="box sand fragment fade-left" data-fragment-index="3"><span class="emoji">👀</span><b>What is real</b>only 2 running</div>
</div>
<div class="fragment fade-up">
<div class="down">↓</div>
<div class="row"><div class="box green"><span class="emoji">🛠️</span><b>Fix the difference</b>start 1 more copy</div></div>
</div>

<p class="fragment fade-in">This loop is a <strong>controller</strong>. Remember that word.</p>

<p class="hint">↓ 3 a.m.</p>

Note:
Most important idea of part 1. A thermostat doesn't take orders like "run
the furnace 10 minutes": you set 70°F and it keeps checking and fixing.
You say WHAT you want, never HOW. The checking program is a controller.

--

<!-- .slide: data-transition="fade" -->

## 3 a.m., a server dies

<div class="row">
<div class="box rose fragment fade-up"><span class="emoji">💥</span><b>3:00</b>server 2 dies</div>
<div class="arrow fragment fade-up">→</div>
<div class="box sand fragment fade-up"><span class="emoji">👀</span><b>3:00</b>"want 3, have 2"</div>
<div class="arrow fragment fade-up">→</div>
<div class="box green fragment fade-up"><span class="emoji">✅</span><b>3:01</b>new copy on server 3</div>
<div class="arrow fragment fade-up">→</div>
<div class="box blue fragment fade-up"><span class="emoji">😴</span><b>Morning</b>nobody was paged</div>
</div>

<div class="takeaway fragment fade-up">The runbook <em>"RDP in, restart the app pool"</em> is replaced by writing down what good looks like.</div>

Note:
Ask how many 3 a.m. calls his teams get.

---

## Kubernetes is an HTTP API

<p class="fragment fade-in">Everything is a record, at a route you already know how to read:</p>

<div class="routes">
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">keep N copies running</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
</div>

<p class="fragment fade-up"><span class="verb">GET</span> <span class="verb post">POST</span> <span class="verb" style="background:var(--sand)">PUT</span> <span class="verb" style="background:var(--rose)">DELETE</span> &nbsp;= SELECT, INSERT, UPDATE, DELETE</p>

<p class="hint">↓ one front door</p>

Note:
He understands HTTP routes and APIs; lean on that. Every part of a running
system lives at a route. The four HTTP verbs map to the four SQL verbs.
{namespace} is a folder, usually one per team or customer.

--

<!-- .slide: data-transition="convex" -->

## One front door, instead of ten consoles

<div class="row">
<div class="box gray fragment fade-down" data-fragment-index="1"><b>IIS Manager</b></div>
<div class="box gray fragment fade-down" data-fragment-index="1"><b>DNS console</b></div>
<div class="box gray fragment fade-down" data-fragment-index="1"><b>Disk Mgmt</b></div>
<div class="box gray fragment fade-down" data-fragment-index="1"><b>Task Scheduler</b></div>
<div class="box gray fragment fade-down" data-fragment-index="1"><b>AD Users</b></div>
</div>
<p class="muted fragment" data-fragment-index="1">Windows Server: a different tool for every job, over Remote Desktop.</p>

<div class="fragment fade-up" data-fragment-index="2">
<div class="row"><div class="box solid wide"><span class="emoji">🚪</span><b>One HTTP API</b>websites · names · disks · jobs · passwords</div></div>
</div>

<div class="takeaway fragment fade-up" data-fragment-index="3">Dashboards, automation, Argo CD, Flux, the command line: <strong>all use the same routes</strong>.</div>

Note:
No screen scraping, no RDP, no "only Bob knows how to configure that".
The records are saved in git, so we know who changed what and can undo.

---

## You already know this: Payload CMS

<div class="row">
<div class="box blue fragment fade-right" data-fragment-index="1"><span class="emoji">📰</span><b>Payload</b>define a <em>collection</em>: Blog Posts</div>
<div class="arrow fragment fade-right" data-fragment-index="1">→</div>
<div class="box blue wide fragment fade-right" data-fragment-index="1"><b>You get a route</b><div class="routes"><div class="route"><span class="verb">GET</span><span class="path">/api/<span class="res">blog-posts</span>/<span class="name">42</span></span></div></div>+ an admin screen + hooks on every change</div>
</div>
<div class="row">
<div class="box fragment fade-right" data-fragment-index="2"><span class="emoji">☸️</span><b>Kubernetes</b>define a <em>CRD</em>: Virtual Machines</div>
<div class="arrow fragment fade-right" data-fragment-index="2">→</div>
<div class="box wide fragment fade-right" data-fragment-index="2"><b>You get a route</b><div class="routes"><div class="route"><span class="verb">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">acme</span>/<span class="res">virtualmachines</span>/<span class="name">sql-01</span></span></div></div>+ dashboards + a <strong>controller</strong> on every change</div>
</div>

<p class="big fragment fade-up" data-fragment-index="3">Same idea. Content in Payload, <strong>infrastructure</strong> in Kubernetes.</p>

Note:
The key bridge of the talk. Payload collection = Kubernetes CRD (Custom
Resource Definition). Payload hook = Kubernetes controller. Pause and check
it landed before going on.

---

<!-- .slide: data-transition="zoom" -->

## Reading a route

<div class="anatomy">
<div class="fragment fade-up"><span class="seg" style="color:var(--green)">GET</span><span class="lbl">the verb: read it</span></div>
<div><span class="sep">/apis/</span></div>
<div class="fragment fade-up"><span class="seg" style="color:var(--blue)">kubevirt.io</span><span class="lbl">who added this route</span></div>
<div><span class="sep">/</span></div>
<div class="fragment fade-up"><span class="seg" style="color:var(--muted)">v1</span><span class="lbl">its version</span></div>
<div><span class="sep">/namespaces/</span></div>
<div class="fragment fade-up"><span class="seg" style="color:var(--sand)">acme</span><span class="lbl">whose folder: the customer</span></div>
<div><span class="sep">/</span></div>
<div class="fragment fade-up"><span class="seg" style="color:var(--clay)">virtualmachines</span><span class="lbl">the kind of thing</span></div>
<div><span class="sep">/</span></div>
<div class="fragment fade-up"><span class="seg" style="color:var(--green)">sql-01</span><span class="lbl">this one record</span></div>
</div>

<p class="fragment fade-up big">"Acme's Windows SQL server" <span class="muted">is just an address.</span></p>

Note:
Walk left to right, one fragment at a time. The group (kubevirt.io) tells
you which project taught Kubernetes this route. The namespace is the
customer's folder. The resource is the kind of thing, like a table name.
The last part is the one record, like a row id.

---

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Teaching the API new tricks</p>

## Every Kubernetes starts with these

<div class="routes tight" data-id="routes">
<div class="route " data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route " data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">keep N copies running</span></div>
<div class="route " data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route " data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route " data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
</div>

<p class="muted" data-id="count">5 routes on our API</p>

Note:
The built-in routes. Now watch what happens when we install things. Press down.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #1</p>

## 🐘 + A Postgres database route

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">keep N copies running</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route new" data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
</div>

<p class="muted" data-id="count">6 routes on our API</p>

Note:
Install the CloudNativePG operator. Every Postgres database is now a record at this route. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #2</p>

## 🪟 + A Windows VM route

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">keep N copies running</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
<div class="route new" data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs <i>· KubeVirt</i></span></div>
</div>

<p class="muted" data-id="count">7 routes on our API</p>

Note:
Install KubeVirt. A full Windows Server virtual machine is now just a POST. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #3</p>

## 🔀 + A workflow route

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">keep N copies running</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs <i>· KubeVirt</i></span></div>
<div class="route new" data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">multi-step jobs <i>· Argo Workflows</i></span></div>
</div>

<p class="muted" data-id="count">8 routes on our API</p>

Note:
Install Argo Workflows. Pipelines, batch jobs and nightly reports get their own route. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #4</p>

## 🚪 + Front-door routes

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">keep N copies running</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs <i>· KubeVirt</i></span></div>
<div class="route " data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">multi-step jobs <i>· Argo Workflows</i></span></div>
<div class="route new" data-id="gw"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">gateway.networking.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">httproutes</span></span><span class="what">website front doors <i>· Gateway API</i></span></div>
<div class="route new" data-id="traefik"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">traefik.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">ingressroutes</span></span><span class="what">Traefik routing + mTLS <i>· Traefik</i></span></div>
</div>

<p class="muted" data-id="count">10 routes on our API</p>

Note:
Even the official Gateway API is added this way, and so is Traefik's IngressRoute. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #5</p>

## ☁️ + Cloud infrastructure routes

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">keep N copies running</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs <i>· KubeVirt</i></span></div>
<div class="route " data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">multi-step jobs <i>· Argo Workflows</i></span></div>
<div class="route " data-id="gw"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">gateway.networking.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">httproutes</span></span><span class="what">website front doors <i>· Gateway API</i></span></div>
<div class="route " data-id="traefik"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">traefik.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">ingressroutes</span></span><span class="what">Traefik routing + mTLS <i>· Traefik</i></span></div>
<div class="route new" data-id="tofu"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">infra.contrib.fluxcd.io</span>/v1alpha2/namespaces/<span class="ns">{namespace}</span>/<span class="res">terraforms</span></span><span class="what">cloud infra <i>· Flux + OpenTofu</i></span></div>
<div class="route new" data-id="xp"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">compute.gcp.upbound.io</span>/v1beta1/<span class="res">instances</span></span><span class="what">Google Cloud servers <i>· Crossplane</i></span></div>
</div>

<p class="muted" data-id="count">12 routes on our API</p>

Note:
Google Cloud, AWS, Azure: their servers, networks and databases become routes on OUR API. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #6</p>

## 🏢 + Our own product as a route

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">keep N copies running</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs <i>· KubeVirt</i></span></div>
<div class="route " data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">multi-step jobs <i>· Argo Workflows</i></span></div>
<div class="route " data-id="gw"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">gateway.networking.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">httproutes</span></span><span class="what">website front doors <i>· Gateway API</i></span></div>
<div class="route " data-id="traefik"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">traefik.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">ingressroutes</span></span><span class="what">Traefik routing + mTLS <i>· Traefik</i></span></div>
<div class="route " data-id="tofu"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">infra.contrib.fluxcd.io</span>/v1alpha2/namespaces/<span class="ns">{namespace}</span>/<span class="res">terraforms</span></span><span class="what">cloud infra <i>· Flux + OpenTofu</i></span></div>
<div class="route " data-id="xp"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">compute.gcp.upbound.io</span>/v1beta1/<span class="res">instances</span></span><span class="what">Google Cloud servers <i>· Crossplane</i></span></div>
<div class="route new" data-id="tenant"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">tenants</span></span><span class="what">a whole new customer <i>· KRO, no code</i></span></div>
</div>

<p class="muted" data-id="count">13 routes on our API</p>

Note:
With KRO we define our own route, Tenant, without writing a program. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-transition="fade" -->

## A platform that develops itself

<div class="row">
<div class="box fragment fade-up"><span class="emoji">📥</span><b>Install</b>someone else's routes in minutes</div>
<div class="box blue fragment fade-up"><span class="emoji">🏗️</span><b>Publish</b>our own products as routes</div>
<div class="box green fragment fade-up"><span class="emoji">🔐</span><b>Same rules</b>same logins, permissions, history</div>
<div class="box sand fragment fade-up"><span class="emoji">🌍</span><b>Inherit</b>improvements from the whole world</div>
</div>

<p class="big fragment fade-up">5 routes became <strong>13</strong>. Nobody rebuilt the server.</p>

Note:
This is the headline. Every route added works exactly like the built-in
ones: same tools, same permissions, same audit history in git.

---

## An operator: an expert in a box

<div class="routes">
<div class="route new fragment fade-in"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">acme</span>/<span class="res">clusters</span></span><span class="what"><em>"billing-db, 3 copies, nightly backups"</em></span></div>
</div>
<div class="down fragment fade-in">↓ the CloudNativePG operator, 24/7</div>
<div class="row">
<div class="box fragment fade-up"><span class="emoji">🐘</span><b>Primary</b>database</div>
<div class="box blue fragment fade-up"><span class="emoji">🐘🐘</span><b>2 standbys</b>live copies</div>
<div class="box green fragment fade-up"><span class="emoji">💾</span><b>Backups</b>every night</div>
<div class="box sand fragment fade-up"><span class="emoji">🚨</span><b>Failover</b>at 3 a.m., alone</div>
<div class="box rose fragment fade-up"><span class="emoji">⬆️</span><b>Upgrades</b>no downtime</div>
</div>

<p class="fragment fade-in muted">CRD (the route) + controller (the thermostat) = an <strong>operator</strong>.</p>

Note:
Think of the best DBA he's ever managed. An operator is that person's
runbook turned into a program that never sleeps. One POST, and the
operator does everything the DBA would have done, and keeps doing it.

---

<!-- .slide: data-transition="convex" -->

## KRO: our own route, no code

<div class="routes">
<div class="route new"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">acme</span>/<span class="res">tenants</span></span><span class="what"><em>"Acme, plan: Gold"</em></span></div>
</div>
<div class="down fragment fade-in">↓ KRO follows our recipe, a <strong>Resource Graph Definition</strong>, and calls:</div>
<div class="routes">
<div class="route  fragment fade-left"><span class="verb post">POST</span><span class="path">/api/v1/<span class="res">namespaces</span></span><span class="what">Acme's folder</span></div>
<div class="route  fragment fade-left"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">acme</span>/<span class="res">clusters</span></span><span class="what">their database</span></div>
<div class="route  fragment fade-left"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">acme</span>/<span class="res">virtualmachines</span></span><span class="what">their Windows VM</span></div>
<div class="route  fragment fade-left"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">gateway.networking.k8s.io</span>/v1/namespaces/<span class="ns">acme</span>/<span class="res">httproutes</span></span><span class="what">their website address</span></div>
<div class="route  fragment fade-left"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">infra.contrib.fluxcd.io</span>/v1alpha2/namespaces/<span class="ns">acme</span>/<span class="res">terraforms</span></span><span class="what">their cloud backups bucket</span></div>
</div>

<p class="fragment fade-up">+ their private VPN <span class="muted">(headroom-operator)</span></p>

<p class="hint">↓ who builds KRO?</p>

Note:
KRO = Kube Resource Orchestrator. The recipe is configuration, not a
program: what our new route is called, what it asks for, and which routes
it calls. KRO adds the route to the API on the spot. SQL comparison: a
view or stored procedure a non-programmer can write.

--

<!-- .slide: data-transition="zoom" -->

## Who builds KRO?

<div class="row">
<div class="box sand fragment zoom-in"><span class="emoji">🟧</span><b>Amazon</b>AWS</div>
<div class="box blue fragment zoom-in"><span class="emoji">🟦</span><b>Google</b>Cloud</div>
<div class="box green fragment zoom-in"><span class="emoji">🪟</span><b>Microsoft</b>Azure</div>
</div>

<p class="big fragment fade-up">Three fierce competitors, building it <strong>together</strong>.</p>

<p class="fragment fade-in muted">Now part of the official Kubernetes project.</p>

Note:
When the three biggest cloud companies agree to build one tool together,
that tells you where the industry is going.

---

## Behind every route: a built-in database

<div class="routes">
<div class="route "><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">acme</span>/<span class="res">secrets</span>/<span class="name">db-password</span></span><span class="what">the route</span></div>
</div>
<div class="down fragment fade-in">↓ is stored at the key</div>
<div class="routes fragment fade-in">
<div class="route new"><span class="verb" style="background:var(--muted)">KEY</span><span class="path">/registry/<span class="res">secrets</span>/<span class="ns">acme</span>/<span class="name">db-password</span></span><span class="what">in <strong>etcd</strong></span></div>
</div>

<p class="fragment fade-up">A key-value store: think the Windows <strong>Registry</strong>, made bulletproof.</p>

<div class="routes fragment fade-up">
<div class="route "><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">acme</span>/<span class="res">pods</span>?watch=true</span><span class="what"><em>"tell me the moment anything changes"</em></span></div>
</div>

<p class="hint">↓ what it adds · our apps can use it</p>

Note:
Kubernetes is also a database. Every record at every route is stored in
etcd ("et-see-dee"). On k3s it can even be SQLite, Postgres or MySQL. The
watch feature is what makes controllers possible: they are told instantly
instead of polling.

--

<!-- .slide: data-transition="fade" -->

## What it adds on top of a plain table

| Feature | Meaning | SQL Server |
| --- | --- | --- |
| **Replicated** | kept on 3 or 5 servers | Always On |
| **Watch** | apps told instantly about changes | triggers |
| **Versioned** | nobody overwrites another's change | rowversion |
| **Schema checked** | bad records refused | constraints |
| **Permissions** | who can touch which routes | GRANT / DENY |
| **Audit log** | who changed what, when | SQL Audit |
<!-- .element: class="fragment fade-up" -->

<div class="takeaway fragment fade-up">Our apps can keep their settings and state here for free. Millions of orders still go in a real database (one POST to CloudNativePG).</div>

Note:
Small, important records: configuration and state. Not big business data.

---

<!-- .slide: data-transition="convex" -->

## The plumbing comes free

| Job | Windows world | Kubernetes |
| --- | --- | --- |
| Names | Windows DNS, by hand | **CoreDNS**, automatic |
| Network | VLANs, firewall tickets | **Cilium**, rules per app |
| Front door | IIS bindings, ARR, F5 | **Gateway API**, LoadBalancer |
| Disks | SAN, iSCSI, drive letters | **CSI**: "20 GB, please" |
| Crashes | a person, a script | health checks, auto-replace |
| Updates | pull a server from the farm | **rolling updates** |
<!-- .element: class="fragment fade-up" -->

<p class="hint">↓ how a visitor gets in · runs anywhere</p>

Note:
On Windows each row is a separate product, project and often team. In
Kubernetes each row is just more routes on the same API.

--

<!-- .slide: data-transition="fade" -->

## How a visitor reaches our site

<div class="row">
<div class="box fragment fade-right"><span class="emoji">🌍</span><b>Visitor</b></div>
<div class="arrow fragment fade-right">→</div>
<div class="box sand fragment fade-right"><span class="emoji">⚖️</span><b>Load balancer</b>public address</div>
<div class="arrow fragment fade-right">→</div>
<div class="box fragment fade-right"><span class="emoji">🚪</span><b>Gateway</b>Traefik: right site, HTTPS</div>
<div class="arrow fragment fade-right">→</div>
<div class="box blue fragment fade-right"><span class="emoji">📇</span><b>Service</b>found by name</div>
<div class="arrow fragment fade-right">→</div>
<div class="box green fragment fade-right"><span class="emoji">📦📦📦</span><b>3 copies</b>+ their disks</div>
</div>

<p class="fragment fade-up">Every box is a record at a route. A server dies: traffic moves, a copy restarts, the disk follows.</p>

--

<!-- .slide: data-transition="fade" -->

## Runs anywhere

<div class="row">
<div class="box blue fragment zoom-in"><span class="emoji">🟦</span><b>Azure</b>AKS</div>
<div class="box sand fragment zoom-in"><span class="emoji">🟧</span><b>AWS</b>EKS</div>
<div class="box green fragment zoom-in"><span class="emoji">🟩</span><b>Google</b>GKE</div>
<div class="box fragment zoom-in"><span class="emoji">🏢</span><b>Our own racks</b>first-class too</div>
</div>

<div class="takeaway fragment fade-up">Same routes everywhere. "Which cloud?" stops being a 10-year lock-in.</div>

<p class="fragment fade-in">🪟 Windows is welcome: Windows containers, and full Windows VMs with KubeVirt.</p>

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 30% 20%, #3a2a22, #1f1e1d 70%)" -->

<p class="kicker">The most important part</p>

## "Never heard of it" ≠ small

<div class="row">
<div class="box fragment fade-up"><b>Kubernetes</b>started at <strong>Google</strong></div>
<div class="box blue fragment fade-up"><b>Argo</b>grown up at <strong>Intuit</strong></div>
<div class="box green fragment fade-up"><b>Flux</b>used by <strong>Microsoft</strong> in Azure</div>
<div class="box sand fragment fade-up"><b>Cilium</b><strong>Cisco</strong>; inside Google &amp; Azure</div>
</div>
<div class="row">
<div class="box rose fragment fade-up"><b>KubeVirt</b>started by <strong>Red Hat</strong></div>
<div class="box fragment fade-up"><b>KRO</b><strong>AWS + Google + Microsoft</strong></div>
<div class="box blue fragment fade-up"><b>CloudNativePG</b><strong>EDB</strong>, Postgres experts</div>
<div class="box green fragment fade-up"><b>RKE2 / k3s</b><strong>SUSE</strong>; built for government</div>
</div>

<p class="big fragment fade-up">The most valuable software on earth runs on these.</p>

<p class="hint">↓ how to tell a healthy project · open source</p>

Note:
Key emotional point. He hasn't heard of them because they live one layer
below the products people see. They are built and run by the biggest
companies on the planet.

--

<!-- .slide: data-transition="fade" -->

## How to tell a healthy project

<div class="row">
<div class="box gray fragment fade-right"><span class="emoji">🌱</span><b>Sandbox</b>promising, early</div>
<div class="arrow fragment fade-right">→</div>
<div class="box sand fragment fade-right"><span class="emoji">🌿</span><b>Incubating</b>in production, growing</div>
<div class="arrow fragment fade-right">→</div>
<div class="box solid fragment fade-right"><span class="emoji">🌳</span><b>Graduated</b>security audited, many companies</div>
</div>

<p class="fragment fade-up">Graduated: <strong>Kubernetes · Argo · Flux · Cilium · etcd · CoreDNS</strong></p>

Note:
CNCF (Cloud Native Computing Foundation) maturity levels. Graduation needs
an independent security audit and maintainers from several companies.

--

<!-- .slide: data-transition="fade" -->

## Open source: you already depend on it

<div class="row">
<div class="box fragment zoom-in"><span class="emoji">🌐</span><b>DotNetNuke</b>open source</div>
<div class="box blue fragment zoom-in"><span class="emoji">📰</span><b>Payload CMS</b>open source</div>
<div class="box green fragment zoom-in"><span class="emoji">⚙️</span><b>.NET</b>open since 2016</div>
<div class="box sand fragment zoom-in"><span class="emoji">🐙</span><b>GitHub</b>owned by Microsoft</div>
</div>

<div class="row">
<div class="box gray fragment fade-up"><b>👀 More eyes</b>security fixed in public</div>
<div class="box gray fragment fade-up"><b>🔓 No lock-in</b>code outlives vendors</div>
<div class="box gray fragment fade-up"><b>🧑‍💻 Easy hiring</b>people know it</div>
<div class="box gray fragment fade-up"><b>🎁 Free upgrades</b>others' fixes reach us</div>
</div>

<p class="fragment fade-up">So we build in the open as much as we can, like Kubernetes.</p>

Note:
His two favourite frameworks are open source. Open source today means
competitors building the expensive foundation together.

---

## Owned by a foundation, not a company

<div class="row">
<div class="box gray fragment fade-right"><span class="emoji">🏛️</span><b>Linux Foundation</b>neutral non-profit</div>
<div class="arrow fragment fade-right">→</div>
<div class="box blue fragment fade-right"><span class="emoji">☁️</span><b>CNCF</b>Microsoft, Google, Amazon, Red Hat, ...</div>
<div class="arrow fragment fade-right">→</div>
<div class="box solid fragment fade-right"><span class="emoji">☸️</span><b>Kubernetes</b>given by Google in 2015</div>
</div>

<div class="takeaway fragment fade-up"><strong>2023:</strong> Terraform's company changed its license. The community copied the open code into <strong>OpenTofu</strong> at the Linux Foundation. A foundation-owned project <strong>can't be taken away</strong>.</div>

<p class="hint">↓ it gets better underneath us</p>

Note:
That story is why our cloud controller uses OpenTofu. Kubernetes has had
that protection from day one.

--

<!-- .slide: data-transition="convex" -->

## It gets better underneath us

<div class="row">
<div class="box gray fragment fade-up"><b>2003+</b>Google runs Borg</div>
<div class="box fragment fade-up"><b>2014</b>open sourced</div>
<div class="box fragment fade-up"><b>2015</b>1.0, to CNCF</div>
<div class="box blue fragment fade-up"><b>2019</b>Windows containers</div>
<div class="box green fragment fade-up"><b>2023</b>Gateway API stable</div>
<div class="box solid fragment fade-up"><b>Today</b>every cloud, AI, GPUs</div>
</div>

<p class="fragment fade-up">A new release <strong>every 4 months</strong>. We upgrade and get better routes for free.</p>

<p class="big fragment fade-up">Over a decade old, here to stay, and only now getting really good.</p>

Note:
Every operator improves on its own schedule too: a new CloudNativePG
version makes every tenant's database better with no work from us.

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 70% 80%, #2a3340, #1f1e1d 70%)" -->

## Our platform, floor by floor

<div class="layer fragment fade-down" data-fragment-index="6" style="border-left-color:var(--clay); width:96%"><span>🧩 Our routes: tenants, Postgres, VPNs, cloud, Windows VMs</span><span>KRO · operators</span></div>
<div class="layer fragment fade-down" data-fragment-index="5" style="border-left-color:var(--rose); width:91%"><span>🚪 Front door</span><span>Traefik × N · Cilium Gateway API · Cloudflare mTLS</span></div>
<div class="layer fragment fade-down" data-fragment-index="4" style="border-left-color:var(--sand); width:86%"><span>🛣️ Networking</span><span>Cilium · Cluster Mesh · BGP + BIRD</span></div>
<div class="layer fragment fade-down" data-fragment-index="3" style="border-left-color:var(--blue); width:81%"><span>⚙️ Kubernetes</span><span>RKE2 (production) · k3s (edge) · OpenEBS</span></div>
<div class="layer fragment fade-down" data-fragment-index="2" style="border-left-color:var(--green); width:76%"><span>🔒 Encrypted network</span><span>WireGuard, layer 3, every server</span></div>
<div class="layer fragment fade-down" data-fragment-index="1" style="border-left-color:var(--muted); width:71%"><span>🖥️ Servers</span><span>NixOS · any cloud + our racks</span></div>

<p class="hint">↓ servers · network · front door</p>

Note:
Builds bottom to top. Each floor sits on the one below. Press down for a
closer look at three of them.

--

<!-- .slide: data-transition="fade" -->

## Every server is a recipe

<div class="row">
<div class="box fragment fade-right"><span class="emoji">📄</span><b>NixOS</b>the whole server in text files</div>
<div class="arrow fragment fade-right">→</div>
<div class="box sand fragment fade-right"><span class="emoji">🧪</span><b>Tested first</b>whole clusters built as VMs, checked automatically</div>
<div class="arrow fragment fade-right">→</div>
<div class="box solid fragment fade-right"><span class="emoji">🚀</span><b>Production</b>identical, every time</div>
</div>

<div class="takeaway fragment fade-up">Windows terms: the server image + all Group Policy + every setting, in one document. Bad change? Pick yesterday's version at boot.</div>

Note:
Every RKE2 and k3s feature is tested in a full NixOS VM test suite before
it hits production: a fresh staging environment for every change.

--

<!-- .slide: data-transition="fade" -->

## Every server is a router

<div class="row">
<div class="box green fragment fade-up"><span class="emoji">🔒</span><b>WireGuard</b>every link encrypted</div>
<div class="box blue fragment fade-up"><span class="emoji">🗺️</span><b>Layer 3 only</b>routing, not stretched networks</div>
<div class="box sand fragment fade-up"><span class="emoji">☁️🏢</span><b>Mixed</b>clouds + racks, one cluster</div>
<div class="box fragment fade-up"><span class="emoji">🕸️</span><b>Cluster Mesh</b>many clusters act as one</div>
</div>

<div class="takeaway fragment fade-up">Cilium + BIRD speak <strong>BGP</strong>, the internet's routing language, to make load-balancer addresses from our servers' own IPs. <strong>Add a server = more routing and front-door capacity.</strong> No F5 to buy.</div>

--

<!-- .slide: data-transition="fade" -->

## The front door

<div class="row">
<div class="box fragment fade-right"><span class="emoji">🌍</span><b>Visitor</b></div>
<div class="arrow fragment fade-right">→</div>
<div class="box sand fragment fade-right"><span class="emoji">☁️</span><b>Cloudflare</b>protection</div>
<div class="arrow fragment fade-right">→</div>
<div class="box rose fragment fade-right"><span class="emoji">🤝</span><b>mTLS</b>both sides show certificates</div>
<div class="arrow fragment fade-right">→</div>
<div class="box solid fragment fade-right"><span class="emoji">🚪</span><b>Traefik × N</b>on our servers</div>
<div class="arrow fragment fade-right">→</div>
<div class="box green fragment fade-right"><span class="emoji">📦🪟</span><b>Apps + VMs</b></div>
</div>

<p class="fragment fade-up">Every protocol: <strong>HTTP · HTTPS · TCP · UDP · TLS · mTLS · QUIC</strong>, public or private.</p>

<p class="fragment fade-in muted">Gateway API preferred over the older Ingress.</p>

Note:
1 to N Traefik copies, each with a load balancer address from Cilium BGP.
Traefik's IngressRoute only accepts connections proven to come from
Cloudflare, so nobody can go around Cloudflare.

---

<!-- .slide: data-transition="zoom" -->

## One POST = one new customer

<div class="routes">
<div class="route new"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">acme</span>/<span class="res">tenants</span></span><span class="what"><em>"Acme, Gold, US-East"</em></span></div>
</div>
<div class="row">
<div class="box fragment zoom-in">📁 folder</div>
<div class="box blue fragment zoom-in">🐘 database</div>
<div class="box green fragment zoom-in">🔒 VPN</div>
<div class="box sand fragment zoom-in">🌐 website</div>
<div class="box rose fragment zoom-in">🪟 Windows VM</div>
</div>

<div class="takeaway fragment fade-up">Any cloud or our racks · encrypted end to end · tested before production · kept healthy 24/7</div>

<p class="big fragment fade-up">Kubernetes, the extensible API: <strong>a platform that develops itself.</strong></p>

Note:
The whole talk in one slide. Ask him to explain one of the five ideas back
in his own words.

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 50% 40%, #3a2a22, #141413 70%)" data-transition="zoom" -->

# Questions?

<p class="big">Everything from tonight, slower, is on the website.</p>

<small>Seven short chapters · a plain-language dictionary</small>

Note:
Point him to the docs site, especially the dictionary page, which maps
every term to a Windows-world equivalent.
