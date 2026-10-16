<!-- .slide: data-background-gradient="radial-gradient(circle at 70% 30%, #3a2a22, #141413 70%)" data-transition="zoom" class="title-slide" -->

<p class="kicker">For Dad</p>

# Kubernetes

<h2>The Extensible API</h2>

<p class="big" style="color: var(--clay)">a Platform that Develops itself</p>

<p class="hint">→ next topic · ↓ deeper · F full screen · Esc overview</p>

Note:
Right arrow = next topic, down arrow = a deeper look at the same topic.
Tonight's one idea: Kubernetes is not a container manager, it is an
extensible API that can run and manage anything our business needs, and it
grows with us. The only "code" is web addresses and a few short settings
files, all read like a form.

---

## Not "a container manager"

<p class="big">Kubernetes is an <strong>extensible API</strong> that can manage <strong>any</strong> resource.</p>

<div class="row">
<div class="box  fragment zoom-in"><span class="emoji">🧮</span><b>GPUs</b>for AI</div>
<div class="box blue fragment zoom-in"><span class="emoji">🪣</span><b>Cloud buckets</b>Azure, Google, AWS</div>
<div class="box green fragment zoom-in"><span class="emoji">🪟</span><b>Windows VMs</b>KubeVirt</div>
<div class="box sand fragment zoom-in"><span class="emoji">🔀</span><b>Workflows</b>Argo</div>
<div class="box rose fragment zoom-in"><span class="emoji">⏰</span><b>Cron jobs</b>built in</div>
</div>
<div class="row">
<div class="box green fragment zoom-in"><span class="emoji">⚙️</span><b>.NET apps</b></div>
<div class="box sand fragment zoom-in"><span class="emoji">🐹</span><b>Go apps</b></div>
<div class="box rose fragment zoom-in"><span class="emoji">🐍</span><b>Python apps</b></div>
<div class="box  fragment zoom-in"><span class="emoji">☁️</span><b>Cloud infra</b>Crossplane</div>
<div class="box blue fragment zoom-in"><span class="emoji">🧩</span><b>Our products</b>KRO</div>
</div>

<p class="fragment fade-up">One orchestrator for everything our business needs. <span class="muted">(↓ more)</span></p>

Note:
Most people hear "Kubernetes runs Docker containers". True, but small.
It is an API, and anything can be taught to it: GPUs, cloud storage,
virtual machines, scheduled jobs, apps in any language, and whole cloud
setups through Crossplane and KRO.

--

<!-- .slide: data-transition="convex" -->

## It adapts and evolves with us

<div class="row">
<div class="box fragment fade-right"><span class="emoji">🌐</span><b>Year 1</b>our websites</div>
<div class="arrow fragment fade-right">→</div>
<div class="box blue fragment fade-right"><span class="emoji">🐘</span><b>+ databases</b>install an operator</div>
<div class="arrow fragment fade-right">→</div>
<div class="box green fragment fade-right"><span class="emoji">🪟</span><b>+ Windows VMs</b>install KubeVirt</div>
<div class="arrow fragment fade-right">→</div>
<div class="box sand fragment fade-right"><span class="emoji">🧮</span><b>+ AI on GPUs</b>install a GPU driver</div>
<div class="arrow fragment fade-right">→</div>
<div class="box solid fragment fade-right"><span class="emoji">🛒</span><b>+ self-service</b>customers order sites</div>
</div>

<div class="takeaway fragment fade-up">Each new need = <strong>install new routes</strong>, not buy and integrate a new system.</div>

Note:
The business changes; the platform changes with it, without a rebuild or
a migration. Same API, same tools, same people.

--

<!-- .slide: data-transition="fade" -->

## How it manages anything: the thermostat

<div class="row">
<div class="box fragment fade-right"><span class="emoji">📝</span><b>What we want</b>"2 Payload sites"</div>
<div class="arrow fragment fade-right">→</div>
<div class="box solid fragment fade-right"><span class="emoji">🔁</span><b>A controller compares</b>want vs. have, forever</div>
<div class="arrow fragment fade-left">←</div>
<div class="box sand fragment fade-left"><span class="emoji">👀</span><b>What is real</b>only 1 running</div>
</div>
<div class="fragment fade-up"><div class="down">↓</div>
<div class="row"><div class="box green"><span class="emoji">🛠️</span><b>Fix the difference</b>build the missing one, in any cloud</div></div></div>

Note:
You set 70°F and the thermostat keeps checking and fixing. A controller
does the same for any kind of resource: a pod, a VM, a cloud bucket, a
customer's website.

---

## It's an HTTP API

<p class="fragment fade-in">Everything is a record, at a route you already know how to read:</p>

<div class="routes ">
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
</div>

<p class="fragment fade-up"><span class="verb">GET</span> <span class="verb post">POST</span> <span class="verb" style="background:var(--sand)">PUT</span> <span class="verb" style="background:var(--rose)">DELETE</span> &nbsp;= SELECT, INSERT, UPDATE, DELETE</p>

<p class="hint">↓ one front door</p>

Note:
He knows HTTP routes and APIs. Every part of a running system lives at a
route. {namespace} is a folder, one per team or customer.

--

<!-- .slide: data-transition="convex" -->

## One front door, instead of ten consoles

<div class="row">
<div class="box gray fragment fade-down" data-fragment-index="1"><b>IIS Manager</b></div>
<div class="box gray fragment fade-down" data-fragment-index="1"><b>DNS console</b></div>
<div class="box gray fragment fade-down" data-fragment-index="1"><b>Azure portal</b></div>
<div class="box gray fragment fade-down" data-fragment-index="1"><b>Google console</b></div>
<div class="box gray fragment fade-down" data-fragment-index="1"><b>Task Scheduler</b></div>
</div>
<div class="fragment fade-up" data-fragment-index="2">
<div class="row"><div class="box solid wide"><span class="emoji">🚪</span><b>One HTTP API</b>apps · names · VMs · cloud · jobs · passwords</div></div>
</div>
<div class="takeaway fragment fade-up" data-fragment-index="3">Dashboards, automation, our own portal: <strong>all use the same routes</strong>.</div>

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
Left to right: the group says which project taught Kubernetes this route,
the namespace is the customer's folder, the resource is like a table name,
the last part is the one record, like a row id.

---

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Teaching the API new tricks</p>

## Every Kubernetes starts with these

<div class="routes tight" data-id="routes">
<div class="route " data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route " data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route " data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route " data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route " data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
</div>

<p class="muted" data-id="count">5 routes on our API</p>

Note:
The built-in routes. Now press down: each step installs something.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #1</p>

## 🧮 + GPUs

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route new" data-id="gpu"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">resource.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">resourceclaims</span></span><span class="what">GPUs for AI <i>· NVIDIA driver</i></span></div>
</div>

<p class="muted" data-id="count">6 routes on our API</p>

Note:
Install NVIDIA's driver. Apps can now claim a GPU through a route. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #2</p>

## 🐘 + Databases

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="gpu"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">resource.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">resourceclaims</span></span><span class="what">GPUs for AI <i>· NVIDIA driver</i></span></div>
<div class="route new" data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
</div>

<p class="muted" data-id="count">7 routes on our API</p>

Note:
Install CloudNativePG. Every Postgres database is a record. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #3</p>

## 🪟 + Windows VMs

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="gpu"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">resource.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">resourceclaims</span></span><span class="what">GPUs for AI <i>· NVIDIA driver</i></span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
<div class="route new" data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs <i>· KubeVirt</i></span></div>
</div>

<p class="muted" data-id="count">8 routes on our API</p>

Note:
Install KubeVirt. A Windows Server VM is just a POST. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #4</p>

## 🔀 + Workflows

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="gpu"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">resource.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">resourceclaims</span></span><span class="what">GPUs for AI <i>· NVIDIA driver</i></span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs <i>· KubeVirt</i></span></div>
<div class="route new" data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">multi-step workflows <i>· Argo</i></span></div>
</div>

<p class="muted" data-id="count">9 routes on our API</p>

Note:
Install Argo Workflows. Pipelines and batch jobs get a route. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #5</p>

## 🚪 + Front doors

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="gpu"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">resource.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">resourceclaims</span></span><span class="what">GPUs for AI <i>· NVIDIA driver</i></span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs <i>· KubeVirt</i></span></div>
<div class="route " data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">multi-step workflows <i>· Argo</i></span></div>
<div class="route new" data-id="gw"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">gateway.networking.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">httproutes</span></span><span class="what">website front doors <i>· Gateway API</i></span></div>
<div class="route new" data-id="traefik"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">traefik.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">ingressroutes</span></span><span class="what">routing + mTLS <i>· Traefik</i></span></div>
</div>

<p class="muted" data-id="count">11 routes on our API</p>

Note:
Even the official Gateway API is added this way, and so is Traefik. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #6</p>

## ☁️ + The clouds

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="gpu"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">resource.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">resourceclaims</span></span><span class="what">GPUs for AI <i>· NVIDIA driver</i></span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs <i>· KubeVirt</i></span></div>
<div class="route " data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">multi-step workflows <i>· Argo</i></span></div>
<div class="route " data-id="gw"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">gateway.networking.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">httproutes</span></span><span class="what">website front doors <i>· Gateway API</i></span></div>
<div class="route " data-id="traefik"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">traefik.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">ingressroutes</span></span><span class="what">routing + mTLS <i>· Traefik</i></span></div>
<div class="route new" data-id="bucket"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">storage.gcp.upbound.io</span>/v1beta1/<span class="res">buckets</span></span><span class="what">Google Cloud buckets <i>· Crossplane</i></span></div>
<div class="route new" data-id="azpg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">dbforpostgresql.azure.upbound.io</span>/v1beta1/<span class="res">flexibleservers</span></span><span class="what">Azure Postgres <i>· Crossplane</i></span></div>
</div>

<p class="muted" data-id="count">13 routes on our API</p>

Note:
Crossplane mirrors Azure and Google Cloud into OUR API. Their resources become our routes. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Install #7</p>

## 🧩 + Our own product

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a stable name + address</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="gpu"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">resource.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">resourceclaims</span></span><span class="what">GPUs for AI <i>· NVIDIA driver</i></span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases <i>· CloudNativePG</i></span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs <i>· KubeVirt</i></span></div>
<div class="route " data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">multi-step workflows <i>· Argo</i></span></div>
<div class="route " data-id="gw"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">gateway.networking.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">httproutes</span></span><span class="what">website front doors <i>· Gateway API</i></span></div>
<div class="route " data-id="traefik"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">traefik.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">ingressroutes</span></span><span class="what">routing + mTLS <i>· Traefik</i></span></div>
<div class="route " data-id="bucket"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">storage.gcp.upbound.io</span>/v1beta1/<span class="res">buckets</span></span><span class="what">Google Cloud buckets <i>· Crossplane</i></span></div>
<div class="route " data-id="azpg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">dbforpostgresql.azure.upbound.io</span>/v1beta1/<span class="res">flexibleservers</span></span><span class="what">Azure Postgres <i>· Crossplane</i></span></div>
<div class="route new" data-id="payload"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">payloadsites</span></span><span class="what">a customer's Payload CMS site <i>· KRO</i></span></div>
</div>

<p class="muted" data-id="count">14 routes on our API</p>

Note:
With KRO we add our own route, PayloadSite, without writing a program. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-transition="zoom" -->

<p class="big">5 routes became <strong>14</strong>.</p>

# Nobody rebuilt the server.

<p class="fragment fade-up">Same logins · same permissions · same history · same tools, on every new route.</p>

Note:
This is the headline. Every added route behaves exactly like a built-in one.

---

## A new route, without writing an application

<div class="cols">
<div class="fragment fade-right">
<h3>The old way: build an API app</h3>
<ul class="ticks cross">
<li>write a web application</li>
<li>design the database tables</li>
<li>add logins and permissions</li>
<li>add an audit log</li>
<li>host it, patch it, monitor it</li>
<li>build a screen for it</li>
</ul>
</div>
<div class="fragment fade-left">
<h3>Kubernetes: describe the route</h3>
<pre class="spec"><span class="k">kind</span>: CustomResourceDefinition   <span class="c"># &quot;add a route&quot;</span>
<span class="k">names</span>:   payloadsites
<span class="k">fields</span>:  domain, target, size</pre>
<ul class="ticks">
<li>storage, in the built-in database</li>
<li>logins and permissions (RBAC)</li>
<li>audit log and history</li>
<li>works in every tool and dashboard</li>
</ul>
</div>
</div>

<p class="big fragment fade-up">The platform <strong>grows a route</strong>. Nothing to build, host or patch.</p>

Note:
This is the most important business point. Adding a capability to our
platform is a short definition, not a software project. Everything a
real API needs comes with it for free.

---

## The two big ones: Crossplane and KRO

<div class="row">
<div class="box blue fragment fade-right"><span class="emoji">☁️</span><b>Crossplane</b>turns the clouds into routes on our API: Azure, Google Cloud, AWS. Create, change and delete cloud resources natively, and it fixes drift.</div>
<div class="box solid fragment fade-left"><span class="emoji">🧩</span><b>KRO</b>builds <i>new</i> routes out of existing ones, with no code: "when someone POSTs a PayloadSite, create these 5 things".</div>
</div>

<div class="takeaway fragment fade-up"><strong>KRO</strong> decides <em>what</em> a customer gets. <strong>Crossplane</strong> builds it in <em>whichever</em> cloud they chose.</div>

<p class="fragment fade-in muted">Prefer Terraform? The Flux OpenTofu controller runs Terraform modules from a route too.</p>

<p class="hint">↓ who builds them</p>

Note:
Crossplane: a CNCF graduated project (2025), used by large enterprises to
run their clouds. KRO: started by AWS, Google and Microsoft together, now
part of the official Kubernetes project.

--

<!-- .slide: data-transition="zoom" -->

## Who builds them?

<div class="row">
<div class="box blue fragment zoom-in"><span class="emoji">🎓</span><b>Crossplane</b>CNCF <strong>Graduated</strong> (2025)</div>
<div class="box sand fragment zoom-in"><span class="emoji">🟧</span><b>KRO</b>Amazon AWS</div>
<div class="box blue fragment zoom-in"><span class="emoji">🟦</span><b>KRO</b>Google Cloud</div>
<div class="box green fragment zoom-in"><span class="emoji">🪟</span><b>KRO</b>Microsoft Azure</div>
</div>

<p class="big fragment fade-up">Three fierce competitors, building KRO <strong>together</strong>.</p>

---

<!-- .slide: data-transition="convex" -->

<p class="kicker">Example: our product</p>

## A "PayloadSite" route for our customers

<pre class="spec fragment fade-up"><span class="k">apiVersion</span>: kro.run/v1alpha1
<span class="k">kind</span>: PayloadSite
<span class="k">metadata</span>:
  <span class="k">name</span>: bakery-site
  <span class="k">namespace</span>: tenant-smith-bakery    <span class="c"># the customer&#x27;s folder</span>
<span class="k">spec</span>:
  <span class="k">domain</span>: smithbakery.com
  <span class="k">target</span>: azure-container-apps      <span class="c"># aks | azure-container-apps | gke | cloud-run</span>
  <span class="k">size</span>: small                       <span class="c"># small | medium | large</span></pre>

<div class="routes ">
<div class="route new fragment fade-up"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">tenant-smith-bakery</span>/<span class="res">payloadsites</span></span><span class="what"><em>= one new Payload CMS site</em></span></div>
</div>

<p class="hint">↓ what it builds · mixed clouds</p>

Note:
This is the whole order form: which domain, where to run it, how big. The
customer's folder (namespace) is "tenant-smith-bakery". Swap in your own
company's name for the group if you like; kro.run is KRO's default.

--

<!-- .slide: data-transition="fade" -->

## What one POST builds, per target

| | AKS | Azure Container Apps | GKE | Cloud Run |
| --- | --- | --- | --- | --- |
| **Payload runs on** | Azure Kubernetes | Container Apps | Google Kubernetes | Cloud Run |
| **Database** | Azure Postgres | Azure Postgres | Cloud SQL | Cloud SQL |
| **Media files** | Blob storage | Blob storage | Cloud Storage | Cloud Storage |
| **Address + HTTPS** | Cloudflare | Cloudflare | Cloudflare | Cloudflare |
<!-- .element: class="fragment fade-up" -->

<p class="fragment fade-up">Then the record fills in <span class="verb">status</span> <em>url: https://smithbakery.com, ready: true</em></p>

Note:
Payload CMS needs three things: somewhere to run, a database, and a place
for uploaded media. The same order form builds all three on whichever
cloud was chosen.

--

<!-- .slide: data-transition="fade" -->

## Our cluster is the brain, the sites run anywhere

<div class="row">
<div class="box solid wide"><span class="emoji">🧠</span><b>Our Kubernetes cluster</b>the API + KRO + Crossplane: the orchestrator</div>
</div>
<div class="down">↓ &nbsp; ↓ &nbsp; ↓ &nbsp; ↓</div>
<div class="row">
<div class="box blue fragment fade-up"><b>Smith Bakery</b>Azure Container Apps</div>
<div class="box blue fragment fade-up"><b>Acme Law</b>AKS</div>
<div class="box green fragment fade-up"><b>Riverside Church</b>GKE</div>
<div class="box green fragment fade-up"><b>Main St Dental</b>Cloud Run</div>
</div>

<div class="takeaway fragment fade-up">Mixed, multi-tenant, multi-cloud: one API manages all of it.</div>

Note:
The orchestration lives in our cluster; each customer's site runs where it
makes sense for them (price, region, Azure credits, and so on).

---

## How it works, in plain pseudocode

<pre class="spec fragment fade-up"><span class="kw">ROUTE</span>  POST /apis/kro.run/v1alpha1/namespaces/{tenant}/payloadsites
<span class="kw">INPUT</span>  domain, target, size

<span class="kw">ALWAYS</span>
  database = Crossplane: Azure Postgres  <span class="kw">OR</span>  Google Cloud SQL
  media    = Crossplane: Azure Blob      <span class="kw">OR</span>  Google Cloud Storage
  address  = Crossplane: Cloudflare DNS record for domain

<span class="kw">WHEN</span> target is &quot;aks&quot; <span class="kw">OR</span> &quot;gke&quot;
  app = Deployment + HTTPRoute on that cluster
<span class="kw">WHEN</span> target is &quot;azure-container-apps&quot;
  app = Crossplane: Azure Container App
<span class="kw">WHEN</span> target is &quot;cloud-run&quot;
  app = Crossplane: Google Cloud Run service

<span class="kw">RETURN</span> status.url = &quot;https://&quot; + domain</pre>

<p class="hint">↓ as a KRO recipe · with Terraform</p>

Note:
Read it like a recipe. ALWAYS: every site gets a database, media storage
and an address. WHEN: the place the site runs depends on the target the
customer picked.

--

<!-- .slide: data-transition="fade" -->

## The same recipe, for KRO

<pre class="spec fragment fade-up"><span class="k">kind</span>: ResourceGraphDefinition          <span class="c"># KRO: this adds the PayloadSite route</span>
<span class="k">spec</span>:
  <span class="k">schema</span>:
    <span class="k">kind</span>: PayloadSite
    <span class="k">spec</span>: { domain: string, target: string, size: string }
  <span class="k">resources</span>:
    - <span class="k">id</span>: database                         <span class="c"># Crossplane resource, Azure or Google</span>
    - <span class="k">id</span>: media
    - <span class="k">id</span>: dnsRecord
    - <span class="k">id</span>: containerApp                     <span class="c"># Crossplane: Azure Container App</span>
      <span class="k">includeWhen</span>: target == &#x27;azure-container-apps&#x27;
    - <span class="k">id</span>: cloudRun                         <span class="c"># Crossplane: Google Cloud Run</span>
      <span class="k">includeWhen</span>: target == &#x27;cloud-run&#x27;
    - <span class="k">id</span>: deployment                       <span class="c"># plain Kubernetes, on AKS or GKE</span>
      <span class="k">includeWhen</span>: target in [&#x27;aks&#x27;, &#x27;gke&#x27;]</pre>

<p class="fragment fade-in">A settings file, not a program. KRO reads it and the route appears.</p>

Note:
Simplified: real KRO writes conditions like
${schema.spec.target == "cloud-run"}. KRO handles the order: database
first, then the app that needs its address.

--

<!-- .slide: data-transition="fade" -->

## Or: Crossplane alone, or Terraform

<div class="row">
<div class="box blue fragment fade-up"><span class="emoji">☁️</span><b>Crossplane only</b>a Composition: one PayloadSite in, the cloud pieces out</div>
<div class="box sand fragment fade-up"><span class="emoji">🧱</span><b>Terraform / OpenTofu</b>the Flux OpenTofu controller runs one module per target</div>
<div class="box solid fragment fade-up"><span class="emoji">🧩</span><b>KRO + Crossplane</b>our pick: KRO for the recipe, Crossplane for the clouds</div>
</div>

<div class="takeaway fragment fade-up">Whichever we use, the customer still just POSTs a PayloadSite. We can switch engines later without changing the route.</div>

---

## Tenants: who can do what, and how much

<div class="cols">
<div class="fragment fade-right">
<h3>Permissions (RBAC)</h3>
<table><thead><tr><th>Who</th><th>Can</th><th>Where</th></tr></thead><tbody>
<tr><td>Smith Bakery staff</td><td>see + edit their sites</td><td>only <em>tenant-smith-bakery</em></td></tr>
<tr><td>Our portal</td><td>create sites</td><td>every tenant folder</td></tr>
<tr><td>Our engineers</td><td>everything</td><td>everywhere</td></tr>
</tbody></table>
</div>
<div class="fragment fade-left">
<h3>Limits (ResourceQuota)</h3>
<pre class="spec"><span class="k">kind</span>: ResourceQuota
<span class="k">metadata</span>:
  <span class="k">namespace</span>: tenant-smith-bakery
<span class="k">spec</span>:
  <span class="k">hard</span>:
    <span class="k">count/payloadsites.kro.run</span>: &quot;2&quot;   <span class="c"># max 2 sites</span>
    <span class="k">requests.cpu</span>: &quot;4&quot;
    <span class="k">requests.memory</span>: 8Gi</pre>
</div>
</div>

<div class="routes fragment fade-up">
<div class="route "><span class="verb post">POST</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">tenant-smith-bakery</span>/<span class="res">payloadsites</span></span><span class="what"><span style="color:var(--rose)">3rd site: 403 Forbidden, quota exceeded</span></span></div>
</div>

<p class="fragment fade-in muted">And Cilium network rules keep tenants from seeing each other.</p>

Note:
RBAC = role-based access control: who may use which routes, in which
folders. ResourceQuota = limits per folder, including "at most 2
PayloadSites" for a plan. Both are just more records on the same API.

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 30% 20%, #3a2a22, #1f1e1d 70%)" -->

## A customer portal on top: they never see Kubernetes

<div class="row">
<div class="box fragment fade-right"><span class="emoji">🧑‍🍳</span><b>Customer</b>"I want a website"</div>
<div class="arrow fragment fade-right">→</div>
<div class="box sand fragment fade-right"><span class="emoji">🛒</span><b>Our portal</b>pick plan · pay · pick Azure or Google</div>
<div class="arrow fragment fade-right">→</div>
<div class="box solid fragment fade-right"><span class="emoji">📮</span><b>POST</b>a PayloadSite</div>
<div class="arrow fragment fade-right">→</div>
<div class="box blue fragment fade-right"><span class="emoji">🧩☁️</span><b>KRO + Crossplane</b>build it</div>
<div class="arrow fragment fade-right">→</div>
<div class="box green fragment fade-right"><span class="emoji">✅</span><b>Site live</b>URL + bill in the portal</div>
</div>

<div class="row fragment fade-up">
<div class="box gray"><b>Azure Container Apps</b>Starter</div>
<div class="box gray"><b>AKS</b>Business</div>
<div class="box gray"><b>GKE</b>Business</div>
<div class="box gray"><b>Cloud Run</b>Starter</div>
</div>

<p class="big fragment fade-up">The customer buys a website. <strong>Kubernetes is invisible.</strong></p>

<p class="hint">↓ billing</p>

Note:
The portal is our own small app with a friendly UI. Behind the "Create my
site" button it does exactly one thing: POST a PayloadSite. The plan names
here are only examples.

--

<!-- .slide: data-transition="fade" -->

## Billing: the portal just watches the route

<div class="routes ">
<div class="route new fragment fade-up"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/<span class="res">payloadsites</span>?watch=true</span><span class="what"><em>"tell me about every site, in every tenant"</em></span></div>
</div>

<div class="row">
<div class="box green fragment fade-up"><span class="emoji">➕</span><b>Site created</b>start billing the plan</div>
<div class="box sand fragment fade-up"><span class="emoji">✏️</span><b>Size changed</b>change the price</div>
<div class="box rose fragment fade-up"><span class="emoji">➖</span><b>Site deleted</b>stop billing</div>
</div>

<div class="takeaway fragment fade-up">Our portal + billing is an <strong>operator</strong> too: it watches records and acts on them.</div>

---

## Programs inside Kubernetes get superpowers for free

<div class="row">
<div class="box fragment fade-up"><span class="emoji">🗄️</span><b>A database + watch</b>keep state in etcd, get told about changes instantly<br><span class="muted">no SQL server to set up</span></div>
<div class="box blue fragment fade-up"><span class="emoji">📇</span><b>CoreDNS</b>call others by name: <em>billing.payments</em><br><span class="muted">no hard-coded IPs</span></div>
<div class="box green fragment fade-up"><span class="emoji">🔐</span><b>Its own identity (RBAC)</b>allowed only the routes it needs<br><span class="muted">no shared admin password</span></div>
<div class="box sand fragment fade-up"><span class="emoji">🚪</span><b>Ingress in one record</b>one HTTPRoute = public HTTPS address<br><span class="muted">no IIS bindings, no firewall ticket</span></div>
</div>

<div class="takeaway fragment fade-up">Our whole portal = <strong>1 Deployment + 1 identity + 1 HTTPRoute</strong>. The platform supplies the rest.</div>

<p class="hint">↓ the rest of the plumbing</p>

Note:
This is why building controllers and portals on Kubernetes is cheap.
State, discovery, security and the front door are already there.

--

<!-- .slide: data-transition="fade" -->

## The rest of the plumbing, also included

| Job | Windows world | Kubernetes |
| --- | --- | --- |
| Network | VLANs, firewall tickets | **Cilium**, rules per app |
| Disks | SAN, iSCSI, drive letters | **CSI**: "20 GB, please" |
| Crashes | a person, a script | health checks, auto-replace |
| Updates | pull a server from the farm | **rolling updates** |
| Any cloud | different everywhere | same routes: AKS, GKE, EKS, our racks |
<!-- .element: class="fragment fade-up" -->

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 30% 20%, #2a3340, #1f1e1d 70%)" -->

<p class="kicker">Reassurance</p>

## How the CNCF grades its projects

<div class="row">
<div class="box gray fragment fade-up" style="text-align:left"><span class="emoji">🌱</span><b>Sandbox</b><em>Early, experimental</em>
<ul class="ticks" style="font-size:0.9em; margin-top:0.3em"><li>accepted by the CNCF</li><li>neutral home, open governance</li><li>may change a lot</li></ul>
<p style="margin:0.4em 0 0"><strong>For us:</strong> Try it at the edges</p></div>
<div class="arrow fragment fade-up">→</div>
<div class="box sand fragment fade-up" style="text-align:left"><span class="emoji">🌿</span><b>Incubating</b><em>Proven in production</em>
<ul class="ticks" style="font-size:0.9em; margin-top:0.3em"><li>used in production by 3+ independent companies</li><li>healthy, growing team of maintainers</li><li>steady releases</li></ul>
<p style="margin:0.4em 0 0"><strong>For us:</strong> Use it, keep an eye on it</p></div>
<div class="arrow fragment fade-up">→</div>
<div class="box green fragment fade-up" style="text-align:left"><span class="emoji">🌳</span><b>Graduated</b><em>Boring, in the best way</em>
<ul class="ticks" style="font-size:0.9em; margin-top:0.3em"><li>independent security audit passed</li><li>maintainers from several companies</li><li>public adopters, formal governance</li></ul>
<p style="margin:0.4em 0 0"><strong>For us:</strong> Build the business on it</p></div>
</div>

<p class="fragment fade-up">Graduated include <strong>Kubernetes · etcd · CoreDNS · Cilium · Crossplane · Argo · Flux</strong></p>

<p class="hint">↓ "never heard of it" ≠ small</p>

Note:
The Cloud Native Computing Foundation (part of the Linux Foundation) only
moves a project up after checks. Graduated means: an independent security
audit, maintainers from more than one company, a public list of
production users, and formal governance. Like a vendor that passed due
diligence.

--

<!-- .slide: data-transition="fade" -->

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
<div class="box blue fragment fade-up"><b>Crossplane</b>runs clouds at large enterprises</div>
<div class="box green fragment fade-up"><b>CloudNativePG</b><strong>EDB</strong>, Postgres experts</div>
</div>

<p class="big fragment fade-up">The most valuable software on earth runs on these.</p>

---

## Our rule: CNCF on the pathway

<p class="fragment fade-in muted">The pathway = everything a customer's order passes through:</p>

<div class="row">
<div class="box gray fragment fade-right"><b>Portal</b>ours</div>
<div class="arrow fragment fade-right">→</div>
<div class="box green fragment fade-right"><b>Kubernetes API</b>Graduated</div>
<div class="arrow fragment fade-right">→</div>
<div class="box green fragment fade-right"><b>KRO</b>Kubernetes project</div>
<div class="arrow fragment fade-right">→</div>
<div class="box green fragment fade-right"><b>Crossplane</b>Graduated</div>
<div class="arrow fragment fade-right">→</div>
<div class="box green fragment fade-right"><b>Cilium</b>Graduated</div>
<div class="arrow fragment fade-right">→</div>
<div class="box gray fragment fade-right"><b>Payload site</b>ours</div>
</div>

<div class="row">
<div class="box green fragment fade-up"><span class="emoji">1️⃣</span><b>Only CNCF</b>(or Kubernetes itself) on the pathway</div>
<div class="box green fragment fade-up"><span class="emoji">2️⃣</span><b>Prefer Graduated</b>for anything critical</div>
<div class="box sand fragment fade-up"><span class="emoji">3️⃣</span><b>Incubating</b>where needed, watched</div>
<div class="box gray fragment fade-up"><span class="emoji">4️⃣</span><b>Sandbox</b>off the critical path, or with a way out</div>
</div>

<p class="hint">↓ where our stack stands</p>

Note:
A simple procurement rule, like an approved-vendor list.

--

<!-- .slide: data-transition="fade" -->

## Where our stack stands today

| Level | Projects |
| --- | --- |
| 🌳 **Graduated** | Kubernetes · etcd · CoreDNS · Cilium · Crossplane · Argo · Flux |
| 🧩 **Part of Kubernetes** | KRO · Gateway API |
| 🌿 **Incubating** | KubeVirt (heading for graduation) |
| 🌱 **Sandbox** | CloudNativePG · OpenTofu · k3s · OpenEBS |
| ➖ **Not CNCF** (open source, company-backed) | Traefik · RKE2 |
<!-- .element: class="fragment fade-up" -->

<p class="fragment fade-up">The core of the pathway is already <strong>Graduated</strong>.</p>

Note:
Honest note: Traefik and RKE2 are open source but not CNCF projects.
Cilium's Gateway API is the CNCF option on the front door if we want the
pathway CNCF-only.

---

## Owned by a foundation, built in the open

<div class="row">
<div class="box gray fragment fade-right"><span class="emoji">🏛️</span><b>Linux Foundation</b>neutral non-profit</div>
<div class="arrow fragment fade-right">→</div>
<div class="box blue fragment fade-right"><span class="emoji">☁️</span><b>CNCF</b>Microsoft, Google, Amazon, Red Hat, ...</div>
<div class="arrow fragment fade-right">→</div>
<div class="box solid fragment fade-right"><span class="emoji">☸️</span><b>Kubernetes</b>given by Google in 2015</div>
</div>

<div class="takeaway fragment fade-up"><strong>2023:</strong> Terraform's company changed its license. The community moved the open code to <strong>OpenTofu</strong> under a foundation. A foundation-owned project <strong>can't be taken away</strong>.</div>

<p class="hint">↓ open source · it gets better</p>

Note:
No single company can change the rules on us.

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

--

<!-- .slide: data-transition="convex" -->

## It gets better underneath us

<div class="row">
<div class="box gray fragment fade-up"><b>2003+</b>Google runs Borg</div>
<div class="box fragment fade-up"><b>2014</b>open sourced</div>
<div class="box fragment fade-up"><b>2015</b>1.0, to CNCF</div>
<div class="box blue fragment fade-up"><b>2019</b>Windows containers</div>
<div class="box green fragment fade-up"><b>2023</b>Gateway API stable</div>
<div class="box solid fragment fade-up"><b>Today</b>AI, GPUs, every cloud</div>
</div>

<p class="fragment fade-up">A new release <strong>every 4 months</strong>. We upgrade and get better routes for free.</p>

<p class="big fragment fade-up">Over a decade old, here to stay, and only now getting really good.</p>

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 70% 80%, #2a3340, #1f1e1d 70%)" -->

## Our platform, floor by floor

<div class="layer fragment fade-down" data-fragment-index="6" style="border-left-color:var(--clay); width:96%"><span>🧩 Our routes: PayloadSites, tenants, databases, VMs</span><span>KRO · Crossplane · operators</span></div>
<div class="layer fragment fade-down" data-fragment-index="5" style="border-left-color:var(--rose); width:91%"><span>🚪 Front door</span><span>Traefik × N · Cilium Gateway API · Cloudflare mTLS</span></div>
<div class="layer fragment fade-down" data-fragment-index="4" style="border-left-color:var(--sand); width:86%"><span>🛣️ Networking</span><span>Cilium · Cluster Mesh · BGP + BIRD</span></div>
<div class="layer fragment fade-down" data-fragment-index="3" style="border-left-color:var(--blue); width:81%"><span>⚙️ Kubernetes</span><span>RKE2 (production) · k3s (edge) · OpenEBS</span></div>
<div class="layer fragment fade-down" data-fragment-index="2" style="border-left-color:var(--green); width:76%"><span>🔒 Encrypted network</span><span>WireGuard, layer 3, every server</span></div>
<div class="layer fragment fade-down" data-fragment-index="1" style="border-left-color:var(--muted); width:71%"><span>🖥️ Servers</span><span>NixOS · any cloud + our racks</span></div>

<p class="hint">↓ servers · network · front door</p>

Note:
Builds bottom to top.

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

--

<!-- .slide: data-transition="fade" -->

## Every server is a router

<div class="row">
<div class="box green fragment fade-up"><span class="emoji">🔒</span><b>WireGuard</b>every link encrypted</div>
<div class="box blue fragment fade-up"><span class="emoji">🗺️</span><b>Layer 3 only</b>routing, not stretched networks</div>
<div class="box sand fragment fade-up"><span class="emoji">☁️🏢</span><b>Mixed</b>clouds + racks, one cluster</div>
<div class="box fragment fade-up"><span class="emoji">🕸️</span><b>Cluster Mesh</b>many clusters act as one</div>
</div>

<div class="takeaway fragment fade-up">Cilium + BIRD speak <strong>BGP</strong> to make load-balancer addresses from our servers' own IPs. <strong>Add a server = more routing and front-door capacity.</strong></div>

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

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 50% 40%, #3a2a22, #141413 70%)" data-transition="zoom" -->

## One POST = one customer's website, on any cloud

<div class="routes ">
<div class="route new"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">tenant-smith-bakery</span>/<span class="res">payloadsites</span></span><span class="what"><em>"smithbakery.com, ACA, small"</em></span></div>
</div>

<p class="big fragment fade-up">Kubernetes, the extensible API: <strong>a platform that develops itself.</strong></p>

<h1 class="fragment fade-up" style="margin-top:0.6em">Questions?</h1>

<small class="fragment fade-in">Everything from tonight, slower, is on the website.</small>

Note:
Ask him to explain back, in his own words, what happens when a customer
clicks "Create my site".
