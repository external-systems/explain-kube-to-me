<!-- .slide: data-background-gradient="radial-gradient(circle at 70% 30%, #3a2a22, #141413 70%)" data-transition="zoom" class="title-slide" -->

<img class="hero" src="icons/kubernetes.svg" alt="Kubernetes">

<p class="kicker">For Dad</p>

# Kubernetes

<h2>The Extensible API</h2>

<p class="big hand" style="color: var(--clay)">a platform that develops itself</p>

<p class="hint">→ next topic · ↓ deeper · F full screen · Esc overview</p>

Note:
Eight topics, left to right. Press the down arrow on any of them for more.
Tonight's one idea: Kubernetes is an API that manages resources, any
resource, and we can keep teaching it new ones.

---

<p class="kicker">The big idea</p>

## An API that manages resources. Any resource.

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 600" style="max-height:440px" xmlns="http://www.w3.org/2000/svg">
<ellipse cx="600" cy="265" rx="150" ry="62" stroke="#d97757" stroke-width="3" fill="#d97757"/>
<image href="icons/kubernetes.svg" x="477" y="234" width="62" height="62"/>
<text x="630" y="261" font-size="30" fill="#faf9f5" text-anchor="middle" font-weight="700">Kubernetes</text>
<text x="630" y="293" font-size="26" fill="#faf9f5" text-anchor="middle">API</text>
<line x1="650" y1="199" x2="682" y2="157" stroke="#e3c08d" stroke-width="2" fill="none" data-arrow/>
<image href="icons/lucide-box.svg" x="706" y="30" width="58" height="58"/>
<text x="735" y="118" font-size="26" fill="#e3c08d" text-anchor="middle">Containers</text>
<text x="735" y="144" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">2015 · version 1</text>
<g class="fragment fade-in">
<line x1="729" y1="225" x2="868" y2="182" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/microsoft-windows.svg" x="934" y="95" width="58" height="58"/>
<text x="963" y="183" font-size="26" fill="#faf9f5" text-anchor="middle">Windows VMs</text>
<text x="963" y="209" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">KubeVirt</text>
</g>
<g class="fragment fade-in">
<line x1="758" y1="264" x2="980" y2="263" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/microsoft-azure.svg" x="1046" y="205" width="58" height="58"/>
<text x="1075" y="293" font-size="26" fill="#faf9f5" text-anchor="middle">Cloud infrastructure</text>
<text x="1075" y="319" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">Crossplane</text>
</g>
<g class="fragment fade-in">
<line x1="735" y1="301" x2="942" y2="357" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/envoy-gateway.svg" x="1008" y="325" width="58" height="58"/>
<text x="1037" y="413" font-size="26" fill="#faf9f5" text-anchor="middle">Proxy settings</text>
<text x="1037" y="439" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">Envoy Gateway</text>
</g>
<g class="fragment fade-in">
<line x1="676" y1="326" x2="773" y2="404" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/postgresql.svg" x="831" y="417" width="58" height="58"/>
<text x="860" y="505" font-size="26" fill="#faf9f5" text-anchor="middle">Databases</text>
<text x="860" y="531" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">CloudNativePG</text>
</g>
<g class="fragment fade-in">
<line x1="600" y1="335" x2="600" y2="438" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/cncf-argo.svg" x="571" y="451" width="58" height="58"/>
<text x="600" y="539" font-size="26" fill="#faf9f5" text-anchor="middle">Workflows</text>
<text x="600" y="565" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">Argo</text>
</g>
<g class="fragment fade-in">
<line x1="524" y1="326" x2="427" y2="404" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/payload-light.svg" x="311" y="417" width="58" height="58"/>
<text x="340" y="505" font-size="26" fill="#faf9f5" text-anchor="middle">Payload CMS sites</text>
<text x="340" y="531" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">our own, with KRO</text>
</g>
<g class="fragment fade-in">
<line x1="465" y1="301" x2="258" y2="357" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/dotnet.svg" x="134" y="325" width="58" height="58"/>
<text x="163" y="413" font-size="26" fill="#faf9f5" text-anchor="middle">.NET apps</text>
<text x="163" y="439" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">with their data</text>
</g>
<g class="fragment fade-in">
<line x1="442" y1="264" x2="220" y2="263" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/nvidia.svg" x="96" y="205" width="58" height="58"/>
<text x="125" y="293" font-size="26" fill="#faf9f5" text-anchor="middle">AI agents</text>
<text x="125" y="319" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">NVIDIA OpenShell</text>
</g>
<g class="fragment fade-in">
<line x1="471" y1="225" x2="332" y2="182" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/lucide-paperclip.svg" x="208" y="95" width="58" height="58"/>
<text x="237" y="183" font-size="26" fill="#faf9f5" text-anchor="middle">Paperclip</text>
<text x="237" y="209" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">the Paperclip operator</text>
</g>
<g class="fragment fade-in">
<line x1="550" y1="199" x2="518" y2="157" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/minecraft.svg" x="436" y="30" width="58" height="58"/>
<text x="465" y="118" font-size="26" fill="#faf9f5" text-anchor="middle">Minecraft servers</text>
<text x="465" y="144" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">our own CRD</text>
</g>
</svg>
</div>

<p class="fragment fade-up">Version 1 only ran <em>stateless containers</em>. Now it runs whatever we <strong>teach it</strong>.</p>

<p class="hint">↓ the new kinds · how it manages them</p>

Note:
In 2015, Kubernetes did one thing: start containers that keep no data,
and restart them when they die. Every arrow you see appear is something
it has since been taught to manage: Windows Server VMs, Azure and Google
resources, the proxy that is our front door, Postgres databases,
workflows, our customers' Payload CMS sites, .NET apps that keep data, AI
agents, Paperclip instances and Minecraft servers. Same API for all of it.

--

<!-- .slide: data-transition="fade" -->

## Each one is a new kind of record

<div class="kinds" style="font-size:0.56em">
<div class="kind fragment fade-up"><img class="" src="icons/microsoft-windows.svg" alt=""><code>VirtualMachine</code><span>a Windows Server VM, like Hyper-V</span><span class="who">KubeVirt</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/microsoft-azure.svg" alt=""><code>FlexibleServer</code><span>a database server in Azure</span><span class="who">Crossplane</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/envoy-gateway.svg" alt=""><code>HTTPRoute</code><span>"send tjscatfishandwings.com to TJ's site"</span><span class="who">Envoy Gateway</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/postgresql.svg" alt=""><code>Cluster</code><span>a Postgres database with backups</span><span class="who">CloudNativePG</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/cncf-argo.svg" alt=""><code>Workflow</code><span>"every night: export, report, email"</span><span class="who">Argo Workflows</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/payload-light.svg" alt=""><code>PayloadSite</code><span>one customer's Payload CMS website</span><span class="who">ours, with KRO</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/dotnet.svg" alt=""><code>Deployment</code><span>a .NET app, 3 copies, always on</span><span class="who">built in</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/nvidia.svg" alt=""><code>AI agent</code><span>an AI agent in a locked-down sandbox</span><span class="who">NVIDIA OpenShell</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/lucide-paperclip.svg" alt=""><code>Paperclip</code><span>one Paperclip instance, ready to use</span><span class="who">Paperclip operator</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/minecraft.svg" alt=""><code>MinecraftServer</code><span>"a world for the grandkids, 10 players"</span><span class="who">ours</span></div>
</div>

<p class="fragment fade-up">Like adding a <strong>collection</strong> in Payload CMS: a new kind of record, with its own form.</p>

Note:
These are the kinds of records our platform and you will actually use.
Each is a Custom Resource Definition (CRD): a new table, if you like.
Installing a project like KubeVirt adds its kinds to the API.

--

<!-- .slide: data-transition="fade" -->

## How it manages anything: like a thermostat

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 430" xmlns="http://www.w3.org/2000/svg">
<image href="icons/lucide-file-text.svg" x="170" y="90" width="60" height="60"/>
<text x="200" y="180" font-size="26" fill="#faf9f5" text-anchor="middle">What we want</text>
<text x="200" y="206" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">"TJ's has 2 sites"</text>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="300" y1="120" x2="470" y2="120" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/lucide-refresh-cw.svg" x="570" y="90" width="60" height="60"/>
<text x="600" y="180" font-size="26" fill="#faf9f5" text-anchor="middle">A controller compares</text>
<text x="600" y="206" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">want vs. have, forever</text>
</g>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="890" y1="120" x2="720" y2="120" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/lucide-eye.svg" x="970" y="90" width="60" height="60"/>
<text x="1000" y="180" font-size="26" fill="#faf9f5" text-anchor="middle">What is real</text>
<text x="1000" y="206" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">only 1 is running</text>
</g>
<g class="fragment fade-in" data-fragment-index="2">
<polyline points="600,210 600,290" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/lucide-search-check.svg" x="571" y="301" width="58" height="58"/>
<text x="600" y="395" font-size="26" fill="#8fa876" text-anchor="middle">Fix the difference: build the missing one</text>
</g>
<g class="fragment fade-in" data-fragment-index="3">
<polyline points="520,330 200,330 200,215" stroke="#b0aea5" stroke-width="2" fill="none" data-dash data-arrow/>
<text x="360" y="318" font-size="20" fill="#b0aea5" text-anchor="middle" class="sans">and check again</text>
</g>
</svg>
</div>

Note:
You set 70°F; the thermostat keeps checking and fixing. Every kind of
record has a controller like this: a VM, a database, a customer's website.

--

<!-- .slide: data-transition="fade" -->

## Docker Swarm vs. Kubernetes

<table>
<thead><tr><th></th><th><img class="icon" src="icons/docker.svg" alt=""> Docker Swarm</th><th><img class="icon" src="icons/kubernetes.svg" alt=""> Kubernetes</th></tr></thead>
<tbody>
<tr class="fragment fade-up"><td><strong>Manages</strong></td><td>containers</td><td>containers, VMs, databases, clouds, <em>anything we add</em></td></tr>
<tr class="fragment fade-up"><td><strong>Automation</strong></td><td>restart and scale containers</td><td>a controller for <em>every</em> kind: heal, scale, update, back up</td></tr>
<tr class="fragment fade-up"><td><strong>Its database</strong></td><td>internal, apps can't use it</td><td>an API apps read, write and <em>watch</em></td></tr>
<tr class="fragment fade-up"><td><strong>Extending it</strong></td><td>not really</td><td><strong>operators</strong>: install new kinds of records</td></tr>
<tr class="fragment fade-up"><td><strong>Who supports it</strong></td><td>mostly Docker, shrinking</td><td>every cloud, thousands of projects</td></tr>
</tbody>
</table>

<div class="takeaway fragment fade-up">Swarm runs containers. Kubernetes is a <strong>platform you extend</strong>, and operators are how.</div>

Note:
Swarm is simpler and fine for a few containers on a few servers. But it
stops there: no new kinds of records, no shared database for our own
programs, no operators. Everything in this talk needs those.

---

<!-- .slide: data-transition="zoom" -->

<p class="kicker">Every record has a web address</p>

## Every route has the same shape

<div class="anatomy">
<div class="fragment fade-up"><span class="seg" style="color:var(--green)">GET</span><span class="lbl">the verb: what to do</span></div>
<div><span class="sep">/apis/</span></div>
<div class="fragment fade-up"><span class="seg" style="color:var(--blue)">{group}</span><span class="lbl">who added it</span></div>
<div><span class="sep">/</span></div>
<div class="fragment fade-up"><span class="seg" style="color:var(--muted)">{version}</span><span class="lbl">its version</span></div>
<div><span class="sep">/namespaces/</span></div>
<div class="fragment fade-up"><span class="seg" style="color:var(--sand)">{namespace}</span><span class="lbl">whose folder: the tenant</span></div>
<div><span class="sep">/</span></div>
<div class="fragment fade-up"><span class="seg" style="color:var(--clay)">{resource}</span><span class="lbl">the kind of record</span></div>
<div><span class="sep">/</span></div>
<div class="fragment fade-up"><span class="seg" style="color:var(--green)">{name}</span><span class="lbl">one record</span></div>
</div>

<div class="takeaway fragment fade-up">The list of routes <strong>is</strong> the platform. If there is a route for it, the platform can do it. If not, it can't, <em>yet</em>.</div>

<p class="hint">↓ your tenants · routes add up · who gets what</p>

Note:
Each kind of record from the last slide gets a web address. Every address
has the same parts. The orange part is the kind of record; the sand part
is the tenant's folder.

--

<!-- .slide: data-transition="fade" -->

## The same shape, for every tenant

<div class="routes ">
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">tjs-catfish-and-wings</span>/<span class="res">payloadsites</span>/<span class="name">main-site</span></span><span class="what">TJ's website</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">bff</span>/<span class="res">clusters</span>/<span class="name">orders-db</span></span><span class="what">bff's database</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">dev-team</span>/<span class="res">virtualmachines</span>/<span class="name">sql-01</span></span><span class="what">a Windows SQL VM</span></div>
<div class="route  fragment fade-left"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">matt</span>/<span class="res">workflows</span>/<span class="name">nightly-report</span></span><span class="what">Matt's nightly job</span></div>
<div class="route  fragment fade-left"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">michael</span>/<span class="res">payloadsites</span></span><span class="what"><em>a new site for Michael</em></span></div>
</div>

<p class="fragment fade-up"><span class="verb">GET</span> <span class="verb post">POST</span> <span class="verb" style="background:var(--sand)">PUT</span> <span class="verb" style="background:var(--rose)">DELETE</span> &nbsp;= SELECT, INSERT, UPDATE, DELETE</p>

Note:
Five tenants, five folders. Read any route left to right: who added it,
whose folder, what kind, which one.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Routes add up over time</p>

## Day 1: every Kubernetes starts with these

<div class="routes tight" data-id="routes">
<div class="route " data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route " data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route " data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a name other apps can call</span></div>
<div class="route " data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route " data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
</div>

<p class="muted" data-id="count"><strong>5</strong> routes = <strong>5</strong> things our platform can do</p>

Note:
The built-in routes. Each step down installs one more project.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Month 2 · install #1</p>

## <img class="icon" src="icons/microsoft-windows.svg" alt=""> + Windows VMs

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a name other apps can call</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route new" data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs</span></div>
</div>

<p class="muted" data-id="count"><strong>6</strong> routes = <strong>6</strong> things our platform can do</p>

Note:
Install KubeVirt. A Windows Server VM is now a POST. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Month 4 · install #2</p>

## <img class="icon" src="icons/postgresql.svg" alt=""> + Databases, workflows, front doors

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a name other apps can call</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs</span></div>
<div class="route new" data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases</span></div>
<div class="route new" data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">workflows</span></div>
<div class="route new" data-id="gw"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">gateway.networking.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">httproutes</span></span><span class="what">website front doors</span></div>
</div>

<p class="muted" data-id="count"><strong>9</strong> routes = <strong>9</strong> things our platform can do</p>

Note:
Install CloudNativePG, Argo and Envoy Gateway. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Month 8 · install #3</p>

## <img class="icon" src="icons/cncf-crossplane.svg" alt=""> + The clouds

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a name other apps can call</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs</span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases</span></div>
<div class="route " data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">workflows</span></div>
<div class="route " data-id="gw"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">gateway.networking.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">httproutes</span></span><span class="what">website front doors</span></div>
<div class="route new" data-id="bucket"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">storage.gcp.upbound.io</span>/v1beta1/<span class="res">buckets</span></span><span class="what">Google Cloud storage</span></div>
<div class="route new" data-id="azpg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">dbforpostgresql.azure.upbound.io</span>/v1beta1/<span class="res">flexibleservers</span></span><span class="what">Azure databases</span></div>
</div>

<p class="muted" data-id="count"><strong>11</strong> routes = <strong>11</strong> things our platform can do</p>

Note:
Install Crossplane: Azure and Google resources become routes on OUR API. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-auto-animate -->

<p class="kicker" data-id="kick">Year 2 · install #4</p>

## <img class="icon" src="icons/payload-light.svg" alt=""> + Our own product

<div class="routes tight" data-id="routes">
<div class="route dim" data-id="pods"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">pods</span></span><span class="what">running copies of an app</span></div>
<div class="route dim" data-id="deploy"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">apps</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">deployments</span></span><span class="what">.NET, Go, Python apps</span></div>
<div class="route dim" data-id="svc"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">services</span></span><span class="what">a name other apps can call</span></div>
<div class="route dim" data-id="secrets"><span class="verb ">GET</span><span class="path">/api/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">secrets</span></span><span class="what">passwords, certificates</span></div>
<div class="route dim" data-id="cron"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">batch</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">cronjobs</span></span><span class="what">scheduled jobs</span></div>
<div class="route " data-id="vm"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kubevirt.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">virtualmachines</span></span><span class="what">Windows Server VMs</span></div>
<div class="route " data-id="pg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">postgresql.cnpg.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">clusters</span></span><span class="what">Postgres databases</span></div>
<div class="route " data-id="wf"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">argoproj.io</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">workflows</span></span><span class="what">workflows</span></div>
<div class="route " data-id="gw"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">gateway.networking.k8s.io</span>/v1/namespaces/<span class="ns">{namespace}</span>/<span class="res">httproutes</span></span><span class="what">website front doors</span></div>
<div class="route " data-id="bucket"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">storage.gcp.upbound.io</span>/v1beta1/<span class="res">buckets</span></span><span class="what">Google Cloud storage</span></div>
<div class="route " data-id="azpg"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">dbforpostgresql.azure.upbound.io</span>/v1beta1/<span class="res">flexibleservers</span></span><span class="what">Azure databases</span></div>
<div class="route new" data-id="payload"><span class="verb ">GET</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">{namespace}</span>/<span class="res">payloadsites</span></span><span class="what">a customer's Payload CMS site</span></div>
</div>

<p class="muted" data-id="count"><strong>12</strong> routes = <strong>12</strong> things our platform can do</p>

Note:
With KRO we add our own route, PayloadSite, without writing a program. Nobody rebuilt or restarted Kubernetes.

--

<!-- .slide: data-transition="zoom" -->

<p class="big">5 routes became <strong>12</strong>.</p>

# Nobody rebuilt the server.

<p class="fragment fade-up">Same logins · same permissions · same history · same tools, on every new route.</p>

<p class="big fragment fade-up">More routes = <strong>more platform</strong>.</p>

--

<!-- .slide: data-transition="convex" -->

## Routes are capabilities, for every tenant

<table style="margin:0.4em auto"><thead><tr><th>Tenant (folder)</th><th><img class="icon" src="icons/lucide-box.svg" alt=""> Apps</th><th><img class="icon" src="icons/postgresql.svg" alt=""> Databases</th><th><img class="icon" src="icons/microsoft-windows.svg" alt=""> Windows VMs</th><th><img class="icon" src="icons/cncf-argo.svg" alt=""> Workflows</th><th class="fragment fade-in" data-fragment-index="1"><img class="icon" src="icons/payload-light.svg" alt=""> Payload sites</th></tr></thead><tbody>
<tr><td><em>tjs-catfish-and-wings</em></td><td><span style="color:var(--green)">✓</span></td><td><span style="color:var(--green)">✓</span></td><td><span class="muted">·</span></td><td><span class="muted">·</span></td><td class="fragment fade-in" data-fragment-index="1"><span style="color:var(--green)">✓</span></td></tr>
<tr><td><em>bff</em></td><td><span style="color:var(--green)">✓</span></td><td><span style="color:var(--green)">✓</span></td><td><span class="muted">·</span></td><td><span class="muted">·</span></td><td class="fragment fade-in" data-fragment-index="1"><span style="color:var(--green)">✓</span></td></tr>
<tr><td><em>dev-team</em></td><td><span style="color:var(--green)">✓</span></td><td><span style="color:var(--green)">✓</span></td><td><span style="color:var(--green)">✓</span></td><td><span style="color:var(--green)">✓</span></td><td class="fragment fade-in" data-fragment-index="1"><span style="color:var(--green)">✓</span></td></tr>
<tr><td><em>matt</em></td><td><span style="color:var(--green)">✓</span></td><td><span class="muted">·</span></td><td><span style="color:var(--green)">✓</span></td><td><span style="color:var(--green)">✓</span></td><td class="fragment fade-in" data-fragment-index="1"><span class="muted">·</span></td></tr>
<tr><td><em>michael</em></td><td><span style="color:var(--green)">✓</span></td><td><span class="muted">·</span></td><td><span class="muted">·</span></td><td><span class="muted">·</span></td><td class="fragment fade-in" data-fragment-index="1"><span style="color:var(--green)">✓</span></td></tr>
</tbody></table>

<div class="takeaway fragment fade-up" data-fragment-index="2">Install a route <strong>once</strong> and every tenant can have it. <strong>Permissions and limits</strong> decide who actually gets it.</div>

Note:
Press next: the Payload sites column appears for everyone the moment KRO
adds the route.

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 20% 80%, #2a3340, #1f1e1d 70%)" -->

<p class="kicker">How things find each other</p>

## DNS inside the cluster

<div class="diagram">
<svg style="max-height:430px" class="sketch" viewBox="0 0 1200 470" xmlns="http://www.w3.org/2000/svg">
<rect x="30" y="150" width="330" height="290" rx="14" stroke="#e3c08d" stroke-width="2" fill="none" data-dash/>
<text x="195" y="425" font-size="20" fill="#e3c08d" text-anchor="middle" class="sans">folder: tjs-catfish-and-wings</text>
<image href="icons/payload-light.svg" x="163" y="208" width="64" height="64"/>
<text x="195" y="302" font-size="26" fill="#faf9f5" text-anchor="middle">TJ's website</text>
<text x="195" y="328" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">Payload CMS</text>
<image href="icons/coredns.svg" x="568" y="28" width="64" height="64"/>
<text x="645" y="62" font-size="28" fill="#faf9f5" text-anchor="start">CoreDNS</text>
<text x="645" y="92" font-size="20" fill="#b0aea5" text-anchor="start" class="sans">the cluster's phone book</text>
<rect x="840" y="150" width="330" height="290" rx="14" stroke="#e3c08d" stroke-width="2" fill="none" data-dash/>
<text x="1005" y="425" font-size="20" fill="#e3c08d" text-anchor="middle" class="sans">same folder</text>
<rect x="890" y="185" width="230" height="58" rx="29" stroke="#d97757" stroke-width="2" fill="#d97757"/>
<text x="1005" y="222" font-size="26" fill="#faf9f5" text-anchor="middle" font-weight="700">payload-db</text>
<g class="fragment fade-in" data-fragment-index="1">
<circle cx="45" cy="102" r="17" stroke="#d97757" stroke-width="2" fill="#d97757" data-fill="solid"/>
<text x="45" y="110" font-size="22" fill="#141413" text-anchor="middle" font-weight="700">1</text>
<line x1="230" y1="175" x2="555" y2="80" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<text x="72" y="110" font-size="24" fill="#faf9f5" text-anchor="start">"Where is payload-db?"</text>
</g>
<g class="fragment fade-in" data-fragment-index="2">
<circle cx="380" cy="193" r="17" stroke="#d97757" stroke-width="2" fill="#d97757" data-fill="solid"/>
<text x="380" y="201" font-size="22" fill="#141413" text-anchor="middle" font-weight="700">2</text>
<line x1="565" y1="100" x2="300" y2="225" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<text x="405" y="201" font-size="24" fill="#8fa876" text-anchor="start">"10.43.0.12"</text>
</g>
<g class="fragment fade-in" data-fragment-index="3">
<circle cx="520" cy="280" r="17" stroke="#d97757" stroke-width="2" fill="#d97757" data-fill="solid"/>
<text x="520" y="288" font-size="22" fill="#141413" text-anchor="middle" font-weight="700">3</text>
<line x1="300" y1="270" x2="880" y2="215" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<text x="545" y="288" font-size="24" fill="#faf9f5" text-anchor="start">connect</text>
</g>
<g class="fragment fade-in" data-fragment-index="4">
<line x1="1005" y1="245" x2="925" y2="330" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<line x1="1005" y1="245" x2="1005" y2="330" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<line x1="1005" y1="245" x2="1085" y2="330" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/postgresql.svg" x="903" y="338" width="44" height="44"/>
<image href="icons/postgresql.svg" x="983" y="338" width="44" height="44"/>
<image href="icons/postgresql.svg" x="1063" y="338" width="44" height="44"/>
<circle cx="1130" cy="300" r="17" stroke="#d97757" stroke-width="2" fill="#d97757" data-fill="solid"/>
<text x="1130" y="308" font-size="22" fill="#141413" text-anchor="middle" font-weight="700">4</text>
</g>
</svg>
</div>

<p class="fragment fade-up">Nobody typed an IP address. <strong>Ever.</strong></p>

<p class="hint">↓ reading a name · things move · the front door · auth for free</p>

Note:
Every cluster has its own DNS server, CoreDNS: a phone book that updates
itself. 1: TJ's website asks "where is payload-db?". 2: CoreDNS answers
with an address. 3: the website connects. 4: the service passes it to a
healthy copy of the database. On Windows this would be a hosts file, a
hard-coded IP or a DNS ticket.

--

<!-- .slide: data-transition="fade" -->

## A name says where it lives

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 380" xmlns="http://www.w3.org/2000/svg">
<text x="600" y="60" font-size="34" fill="#faf9f5" text-anchor="middle" class="mono">payload-db . tjs-catfish-and-wings . svc . cluster.local</text>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="250" y1="80" x2="210" y2="140" stroke="#d97757" stroke-width="2" fill="none" data-arrow/>
<text x="210" y="170" font-size="24" fill="#d97757" text-anchor="middle">the service</text>
</g>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="560" y1="80" x2="560" y2="140" stroke="#e3c08d" stroke-width="2" fill="none" data-arrow/>
<text x="560" y="170" font-size="24" fill="#e3c08d" text-anchor="middle">the tenant's folder</text>
</g>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="845" y1="80" x2="845" y2="140" stroke="#6a9bcc" stroke-width="2" fill="none" data-arrow/>
<text x="845" y="170" font-size="24" fill="#6a9bcc" text-anchor="middle">it's a service</text>
</g>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="1050" y1="80" x2="1080" y2="140" stroke="#b0aea5" stroke-width="2" fill="none" data-arrow/>
<text x="1080" y="170" font-size="24" fill="#b0aea5" text-anchor="middle">this cluster</text>
</g>
<g class="fragment fade-in" data-fragment-index="2">
<rect x="60" y="220" width="500" height="140" rx="14" stroke="#e3c08d" stroke-width="2" fill="none" data-dash/>
<text x="80" y="250" font-size="20" fill="#e3c08d" text-anchor="start" class="sans">tjs-catfish-and-wings</text>
<image href="icons/payload-light.svg" x="116" y="281" width="48" height="48"/>
<line x1="180" y1="305" x2="380" y2="305" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<text x="280" y="290" font-size="22" fill="#faf9f5" text-anchor="middle">payload-db</text>
<image href="icons/postgresql.svg" x="396" y="281" width="48" height="48"/>
<text x="470" y="312" font-size="22" fill="#faf9f5" text-anchor="start">TJ's</text>
</g>
<g class="fragment fade-in" data-fragment-index="2">
<rect x="640" y="220" width="500" height="140" rx="14" stroke="#e3c08d" stroke-width="2" fill="none" data-dash/>
<text x="660" y="250" font-size="20" fill="#e3c08d" text-anchor="start" class="sans">bff</text>
<image href="icons/payload-light.svg" x="696" y="281" width="48" height="48"/>
<line x1="760" y1="305" x2="960" y2="305" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<text x="860" y="290" font-size="22" fill="#faf9f5" text-anchor="middle">payload-db</text>
<image href="icons/postgresql.svg" x="976" y="281" width="48" height="48"/>
<text x="1050" y="312" font-size="22" fill="#faf9f5" text-anchor="start">bff's</text>
</g>
</svg>
</div>

<p class="fragment fade-up" data-fragment-index="3">Same app, same settings, <strong>every tenant</strong>. The folder decides which database it gets.</p>

Note:
The full name has four parts. Inside its own folder an app only needs the
short name, payload-db. So TJ's site and bff's site run with identical
settings and still each reach their own database. That is why adding a
tenant needs no reconfiguring.

--

<!-- .slide: data-transition="fade" -->

## Things move. Names don't.

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 400" xmlns="http://www.w3.org/2000/svg">
<rect x="470" y="20" width="260" height="64" rx="32" stroke="#d97757" stroke-width="2" fill="#d97757"/>
<text x="600" y="62" font-size="28" fill="#faf9f5" text-anchor="middle" font-weight="700">payload-db</text>
<image href="icons/lucide-server.svg" x="268" y="218" width="64" height="64"/>
<text x="300" y="312" font-size="26" fill="#faf9f5" text-anchor="middle">Server A</text>
<image href="icons/lucide-server.svg" x="868" y="218" width="64" height="64"/>
<text x="900" y="312" font-size="26" fill="#faf9f5" text-anchor="middle">Server B</text>
<image href="icons/postgresql.svg" x="277" y="137" width="46" height="46"/>
<line x1="560" y1="84" x2="330" y2="135" stroke="#b0aea5" stroke-width="2" fill="none" data-dash data-arrow/>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="270" y1="130" x2="330" y2="190" stroke="#c9789a" stroke-width="4" fill="none"/>
<line x1="330" y1="130" x2="270" y2="190" stroke="#c9789a" stroke-width="4" fill="none"/>
<text x="300" y="360" font-size="22" fill="#c9789a" text-anchor="middle" class="sans">server dies</text>
</g>
<g class="fragment fade-in" data-fragment-index="2">
<image href="icons/postgresql.svg" x="877" y="137" width="46" height="46"/>
<line x1="640" y1="84" x2="870" y2="135" stroke="#8fa876" stroke-width="3" fill="none" data-arrow/>
<text x="900" y="360" font-size="22" fill="#8fa876" text-anchor="middle" class="sans">a new copy starts here</text>
</g>
<g class="fragment fade-in" data-fragment-index="3">
<text x="600" y="200" font-size="26" fill="#e3c08d" text-anchor="middle">same name,</text>
<text x="600" y="232" font-size="26" fill="#e3c08d" text-anchor="middle">new address</text>
</g>
</svg>
</div>

<p class="fragment fade-up">Windows: update the hosts file, open a DNS ticket. Kubernetes: the phone book <strong>updates itself in seconds</strong>.</p>

Note:
Copies of apps move between servers all the time: a server is patched, a
server dies. The name stays the same; only the address behind it changes,
and CoreDNS keeps up automatically.

--

<!-- .slide: data-transition="fade" -->

## From the internet to TJ's site

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 340" xmlns="http://www.w3.org/2000/svg">
<image href="icons/lucide-user.svg" x="88" y="78" width="64" height="64"/>
<text x="120" y="172" font-size="26" fill="#faf9f5" text-anchor="middle">Visitor</text>
<text x="120" y="198" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">types the address</text>
<g class="fragment fade-left">
<line x1="170" y1="110" x2="310" y2="110" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/cloudflare.svg" x="328" y="78" width="64" height="64"/>
<text x="360" y="172" font-size="26" fill="#faf9f5" text-anchor="middle">Cloudflare</text>
<text x="360" y="198" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">public DNS + protection</text>
</g>
<g class="fragment fade-left">
<line x1="410" y1="110" x2="550" y2="110" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/envoy-gateway.svg" x="568" y="78" width="64" height="64"/>
<text x="600" y="172" font-size="26" fill="#faf9f5" text-anchor="middle">Envoy Gateway</text>
<text x="600" y="198" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">our front door</text>
</g>
<g class="fragment fade-left">
<line x1="650" y1="110" x2="790" y2="110" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/lucide-book-user.svg" x="808" y="78" width="64" height="64"/>
<text x="840" y="172" font-size="26" fill="#faf9f5" text-anchor="middle">CoreDNS</text>
<text x="840" y="198" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">finds "payload"</text>
</g>
<g class="fragment fade-left">
<line x1="890" y1="110" x2="1030" y2="110" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/payload-light.svg" x="1048" y="78" width="64" height="64"/>
<text x="1080" y="172" font-size="26" fill="#faf9f5" text-anchor="middle">TJ's site</text>
<text x="1080" y="198" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">a healthy copy</text>
</g>
<g class="fragment fade-in">
<rect x="250" y="250" width="700" height="80" rx="14" stroke="#e3c08d" stroke-width="2" fill="none" data-dash/>
<text x="600" y="284" font-size="24" fill="#e3c08d" text-anchor="middle">tjscatfishandwings.com → the right folder → the right app</text>
<text x="600" y="314" font-size="18" fill="#b0aea5" text-anchor="middle" class="sans">public DNS gets visitors to our door; cluster DNS gets them to the app</text>
</g>
</svg>
</div>

Note:
Two phone books. Cloudflare's public DNS turns tjscatfishandwings.com into
our front door. Envoy Gateway reads an HTTPRoute record ("this domain goes
to the payload service in TJ's folder") and CoreDNS finds that service.

--

<!-- .slide: data-transition="fade" -->

## The front door: north-south traffic

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 430" xmlns="http://www.w3.org/2000/svg">
<rect x="330" y="110" width="840" height="300" rx="14" stroke="#6a9bcc" stroke-width="2" fill="none" data-dash/>
<text x="350" y="140" font-size="22" fill="#6a9bcc" text-anchor="start" class="sans">our cluster</text>
<image href="icons/lucide-globe.svg" x="71" y="31" width="58" height="58"/>
<text x="100" y="119" font-size="26" fill="#faf9f5" text-anchor="middle">The internet</text>
<g class="fragment fade-in" data-fragment-index="1">
<polyline points="160,80 300,80 300,230 390,230" stroke="#d97757" stroke-width="3" fill="none" data-arrow/>
<image href="icons/envoy-gateway.svg" x="428" y="198" width="64" height="64"/>
<text x="460" y="292" font-size="26" fill="#faf9f5" text-anchor="middle">Envoy Gateway</text>
<text x="240" y="300" font-size="26" fill="#d97757" text-anchor="middle">north-south</text>
<text x="240" y="330" font-size="20" fill="#b0aea5" text-anchor="middle" class="sans">in and out</text>
</g>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="540" y1="230" x2="680" y2="230" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/payload-light.svg" x="732" y="202" width="56" height="56"/>
<text x="760" y="288" font-size="26" fill="#faf9f5" text-anchor="middle">TJ's site</text>
</g>
<g class="fragment fade-in" data-fragment-index="2">
<line x1="840" y1="230" x2="970" y2="230" stroke="#8fa876" stroke-width="2" fill="none" data-arrow/>
<image href="icons/postgresql.svg" x="1022" y="202" width="56" height="56"/>
<text x="1050" y="288" font-size="26" fill="#faf9f5" text-anchor="middle">its database</text>
<line x1="760" y1="300" x2="760" y2="340" stroke="#8fa876" stroke-width="2" fill="none"/>
<text x="905" y="370" font-size="22" fill="#8fa876" text-anchor="middle">east-west: app to app, inside</text>
<text x="905" y="398" font-size="18" fill="#b0aea5" text-anchor="middle" class="sans">CoreDNS names + Cilium rules</text>
</g>
</svg>
</div>

<p class="fragment fade-up">Envoy Gateway <strong>only</strong> guards the front door. A developer adds a site with <strong>one record</strong>: "this address goes to my app".</p>

Note:
North-south is traffic coming in from the internet and going out.
East-west is apps talking to each other inside. Envoy Gateway only does
north-south. For a developer, publishing an app is one HTTPRoute record:
no firewall ticket, no IIS bindings, no certificate juggling.

--

<!-- .slide: data-transition="fade" -->

## Security and logins, before the app

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 430" xmlns="http://www.w3.org/2000/svg">
<image href="icons/lucide-user.svg" x="52" y="92" width="56" height="56"/>
<text x="80" y="178" font-size="26" fill="#faf9f5" text-anchor="middle">Visitor</text>
<rect x="190" y="40" width="700" height="200" rx="14" stroke="#c9789a" stroke-width="2" fill="#c9789a"/>
<image href="icons/envoy-gateway.svg" x="216" y="51" width="48" height="48"/>
<text x="280" y="84" font-size="24" fill="#faf9f5" text-anchor="start">Envoy Gateway: checks on the way in</text>
<line x1="120" y1="120" x2="220" y2="140" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<g class="fragment fade-in" data-fragment-index="1">
<rect x="220" y="115" width="150" height="90" rx="14" stroke="#faf9f5" stroke-width="2" fill="#2b2a27" data-fill="solid"/>
<image href="icons/lucide-lock-keyhole.svg" x="278" y="128" width="34" height="34"/>
<text x="295" y="192" font-size="20" fill="#faf9f5" text-anchor="middle" class="sans">HTTPS</text>
</g>
<g class="fragment fade-in" data-fragment-index="2">
<line x1="370" y1="160" x2="390" y2="160" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<rect x="390" y="115" width="150" height="90" rx="14" stroke="#faf9f5" stroke-width="2" fill="#2b2a27" data-fill="solid"/>
<image href="icons/lucide-user-check.svg" x="448" y="128" width="34" height="34"/>
<text x="465" y="192" font-size="20" fill="#faf9f5" text-anchor="middle" class="sans">who are you?</text>
<line x1="465" y1="205" x2="465" y2="300" stroke="#e3c08d" stroke-width="2" fill="none" data-dash/>
<image href="icons/lucide-shield-check.svg" x="441" y="306" width="48" height="48"/>
<text x="465" y="385" font-size="20" fill="#e3c08d" text-anchor="middle" class="sans">our login service</text>
<text x="465" y="410" font-size="18" fill="#b0aea5" text-anchor="middle" class="sans">(external auth)</text>
</g>
<g class="fragment fade-in" data-fragment-index="3">
<line x1="540" y1="160" x2="560" y2="160" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<rect x="560" y="115" width="150" height="90" rx="14" stroke="#faf9f5" stroke-width="2" fill="#2b2a27" data-fill="solid"/>
<image href="icons/lucide-gauge.svg" x="618" y="128" width="34" height="34"/>
<text x="635" y="192" font-size="20" fill="#faf9f5" text-anchor="middle" class="sans">not too fast</text>
</g>
<g class="fragment fade-in" data-fragment-index="4">
<line x1="710" y1="160" x2="730" y2="160" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<rect x="730" y="115" width="150" height="90" rx="14" stroke="#faf9f5" stroke-width="2" fill="#2b2a27" data-fill="solid"/>
<image href="icons/lucide-route.svg" x="788" y="128" width="34" height="34"/>
<text x="805" y="192" font-size="20" fill="#faf9f5" text-anchor="middle" class="sans">which app?</text>
</g>
<g class="fragment fade-in" data-fragment-index="5">
<line x1="890" y1="140" x2="990" y2="140" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/payload-light.svg" x="1040" y="110" width="60" height="60"/>
<text x="1070" y="200" font-size="26" fill="#faf9f5" text-anchor="middle">TJ's site</text>
<text x="1070" y="240" font-size="22" fill="#8fa876" text-anchor="middle">just gets a request</text>
<text x="1070" y="268" font-size="22" fill="#8fa876" text-anchor="middle">from a signed-in user</text>
</g>
</svg>
</div>

<div class="takeaway fragment fade-up">The app has <strong>no login code</strong> and no HTTPS setup. Envoy's filters and plugins do it, the same way for every app.</div>

Note:
Envoy Gateway runs a chain of filters on every request: HTTPS, then
"external auth", which asks our login service whether this visitor is
allowed in, then rate limits, then routing. Only a request that passed
all of them reaches the app, already labelled with who the user is. Like
IIS authentication modules, but in front of every app at once, set up
with records instead of server settings.

---

<!-- .slide: data-transition="convex" -->

<p class="kicker">Example: our product</p>

## A "PayloadSite" route for our customers

<pre class="spec fragment fade-up"><span class="k">apiVersion</span>: kro.run/v1alpha1
<span class="k">kind</span>: PayloadSite
<span class="k">metadata</span>:
  <span class="k">name</span>: main-site
  <span class="k">namespace</span>: tjs-catfish-and-wings  <span class="c"># the tenant&#x27;s folder</span>
<span class="k">spec</span>:
  <span class="k">domain</span>: tjscatfishandwings.com
  <span class="k">target</span>: azure-container-apps      <span class="c"># aks | azure-container-apps | gke | cloud-run</span>
  <span class="k">size</span>: small                       <span class="c"># small | medium | large</span></pre>

<div class="routes ">
<div class="route new fragment fade-up"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">tjs-catfish-and-wings</span>/<span class="res">payloadsites</span></span><span class="what"><em>= one new Payload CMS site</em></span></div>
</div>

<p class="hint">↓ what it builds · mixed clouds</p>

Note:
The whole order form: which domain, where to run it, how big. Read it
like a form, not code.

--

<!-- .slide: data-transition="fade" -->

## What one POST builds, per target

<table>
<thead><tr><th></th><th><img class="icon" src="icons/azure-container-service.svg" alt=""> AKS</th><th><img class="icon" src="icons/azure-container-instances.svg" alt=""> Azure Container Apps</th><th><img class="icon" src="icons/google-cloud-platform.svg" alt=""> GKE</th><th><img class="icon" src="icons/google-cloud-platform.svg" alt=""> Cloud Run</th></tr></thead>
<tbody>
<tr><td><strong>Payload runs on</strong></td><td>Azure Kubernetes</td><td>Container Apps</td><td>Google Kubernetes</td><td>Cloud Run</td></tr>
<tr><td><strong>Database</strong></td><td>Azure Postgres</td><td>Azure Postgres</td><td>Cloud SQL</td><td>Cloud SQL</td></tr>
<tr><td><strong>Media files</strong></td><td>Blob Storage</td><td>Blob Storage</td><td>Cloud Storage</td><td>Cloud Storage</td></tr>
<tr><td><strong>Address + HTTPS</strong></td><td><img class="icon" src="icons/cloudflare.svg" alt=""> Cloudflare</td><td><img class="icon" src="icons/cloudflare.svg" alt=""> Cloudflare</td><td><img class="icon" src="icons/cloudflare.svg" alt=""> Cloudflare</td><td><img class="icon" src="icons/cloudflare.svg" alt=""> Cloudflare</td></tr>
</tbody>
</table>
<!-- .element: class="fragment fade-up" -->

<p class="fragment fade-up">Then the record fills in <span class="verb">status</span> <em>url: https://tjscatfishandwings.com, ready: true</em></p>

Note:
Payload CMS needs somewhere to run, a database, and a place for uploaded
media. KRO decides what to build; Crossplane builds it in the cloud
that was picked.

--

<!-- .slide: data-transition="fade" -->

## Our cluster is the brain, the sites run anywhere

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 390" xmlns="http://www.w3.org/2000/svg">
<rect x="380" y="20" width="440" height="110" rx="14" stroke="#d97757" stroke-width="2" fill="#d97757"/>
<image href="icons/kubernetes.svg" x="420" y="45" width="60" height="60"/>
<text x="640" y="68" font-size="28" fill="#faf9f5" text-anchor="middle" font-weight="700">Our Kubernetes cluster</text>
<text x="640" y="102" font-size="20" fill="#faf9f5" text-anchor="middle" class="sans">the API + KRO + Crossplane</text>
<g class="fragment fade-in">
<line x1="480" y1="130" x2="150" y2="230" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/azure-container-instances.svg" x="118" y="238" width="64" height="64"/>
<text x="150" y="340" font-size="24" fill="#e3c08d" text-anchor="middle">tjs-catfish-and-wings</text>
<text x="150" y="368" font-size="20" fill="#b0aea5" text-anchor="middle" class="sans">Azure Container Apps</text>
</g>
<g class="fragment fade-in">
<line x1="560" y1="130" x2="450" y2="230" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/azure-container-service.svg" x="418" y="238" width="64" height="64"/>
<text x="450" y="340" font-size="24" fill="#e3c08d" text-anchor="middle">bff</text>
<text x="450" y="368" font-size="20" fill="#b0aea5" text-anchor="middle" class="sans">AKS</text>
</g>
<g class="fragment fade-in">
<line x1="640" y1="130" x2="750" y2="230" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/google-cloud-platform.svg" x="718" y="238" width="64" height="64"/>
<text x="750" y="340" font-size="24" fill="#e3c08d" text-anchor="middle">matt</text>
<text x="750" y="368" font-size="20" fill="#b0aea5" text-anchor="middle" class="sans">GKE</text>
</g>
<g class="fragment fade-in">
<line x1="720" y1="130" x2="1050" y2="230" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/google-cloud-platform.svg" x="1018" y="238" width="64" height="64"/>
<text x="1050" y="340" font-size="24" fill="#e3c08d" text-anchor="middle">michael</text>
<text x="1050" y="368" font-size="20" fill="#b0aea5" text-anchor="middle" class="sans">Cloud Run</text>
</g>
</svg>
</div>

<p class="fragment fade-up">Mixed, multi-tenant, multi-cloud: <strong>one API</strong> manages all of it.</p>

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 30% 20%, #3a2a22, #1f1e1d 70%)" -->

<p class="kicker">A customer portal</p>

## Our portal is a Kubernetes app

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 430" style="max-height:400px" xmlns="http://www.w3.org/2000/svg">
<image href="icons/lucide-user.svg" x="80" y="80" width="60" height="60"/>
<text x="110" y="170" font-size="26" fill="#faf9f5" text-anchor="middle">Michael</text>
<text x="110" y="196" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">"I want a website"</text>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="170" y1="110" x2="300" y2="110" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/lucide-layout-dashboard.svg" x="350" y="80" width="60" height="60"/>
<text x="380" y="170" font-size="26" fill="#faf9f5" text-anchor="middle">Our portal</text>
<text x="380" y="196" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">plan · pay · pick a cloud</text>
</g>
<g class="fragment fade-in" data-fragment-index="2">
<circle cx="540" cy="80" r="17" stroke="#d97757" stroke-width="2" fill="#d97757" data-fill="solid"/>
<text x="540" y="88" font-size="22" fill="#141413" text-anchor="middle" font-weight="700">1</text>
<line x1="470" y1="110" x2="650" y2="110" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<text x="560" y="140" font-size="20" fill="#d97757" text-anchor="middle" class="sans">POST PayloadSite</text>
<image href="icons/kubernetes.svg" x="708" y="78" width="64" height="64"/>
<text x="740" y="172" font-size="26" fill="#faf9f5" text-anchor="middle">Kubernetes API</text>
</g>
<g class="fragment fade-in" data-fragment-index="3">
<circle cx="890" cy="80" r="17" stroke="#d97757" stroke-width="2" fill="#d97757" data-fill="solid"/>
<text x="890" y="88" font-size="22" fill="#141413" text-anchor="middle" font-weight="700">2</text>
<line x1="830" y1="110" x2="960" y2="110" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/cncf-crossplane.svg" x="996" y="71" width="48" height="48"/>
<image href="icons/microsoft-azure.svg" x="1058" y="73" width="44" height="44"/>
<image href="icons/google-cloud-platform.svg" x="1118" y="73" width="44" height="44"/>
<text x="1080" y="155" font-size="22" fill="#faf9f5" text-anchor="middle">KRO + Crossplane</text>
<text x="1080" y="180" font-size="22" fill="#faf9f5" text-anchor="middle">build it</text>
</g>
<g class="fragment fade-in" data-fragment-index="4">
<circle cx="920" cy="270" r="17" stroke="#d97757" stroke-width="2" fill="#d97757" data-fill="solid"/>
<text x="920" y="278" font-size="22" fill="#141413" text-anchor="middle" font-weight="700">3</text>
<polyline points="1080,195 1080,300 790,300 760,205" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<text x="940" y="330" font-size="22" fill="#8fa876" text-anchor="middle">status: ready</text>
</g>
<g class="fragment fade-in" data-fragment-index="5">
<circle cx="560" cy="270" r="17" stroke="#d97757" stroke-width="2" fill="#d97757" data-fill="solid"/>
<text x="560" y="278" font-size="22" fill="#141413" text-anchor="middle" font-weight="700">4</text>
<polyline points="690,300 450,300 420,215" stroke="#6a9bcc" stroke-width="2" fill="none" data-arrow/>
<text x="570" y="330" font-size="22" fill="#6a9bcc" text-anchor="middle">the portal is watching</text>
</g>
<g class="fragment fade-in" data-fragment-index="6">
<polyline points="330,240 130,240 115,210" stroke="#8fa876" stroke-width="2" fill="none" data-arrow/>
<image href="icons/lucide-receipt.svg" x="208" y="278" width="44" height="44"/>
<text x="230" y="350" font-size="22" fill="#8fa876" text-anchor="middle">site live + first bill</text>
</g>
</svg>
</div>

<p class="fragment fade-up">The customer buys a website. <strong>Kubernetes is invisible to them.</strong></p>

<p class="hint">↓ what the portal is made of · the operator loop · fences</p>

Note:
1: behind the "Create my site" button, the portal does one thing: POST a
PayloadSite. 2: KRO and Crossplane build it in the cloud Michael picked.
3: the record says ready. 4: the portal is watching that route, so it
shows the address and starts the bill.

--

<!-- .slide: data-transition="fade" -->

## What the portal is made of: four records

<div class="kinds">
<div class="kind fragment fade-up"><img class="" src="icons/dotnet.svg" alt=""><code>Deployment</code><span>the portal program itself (.NET, or anything), 3 copies</span><span class="who">built in</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/envoy-gateway.svg" alt=""><code>HTTPRoute</code><span>its public address: portal.our-company.com</span><span class="who">Envoy Gateway</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/lucide-key-round.svg" alt=""><code>ServiceAccount</code><span>its own login: may create PayloadSites, nothing else</span><span class="who">RBAC, built in</span></div>
<div class="kind fragment fade-up"><img class="" src="icons/lucide-eye.svg" alt=""><code>watch</code><span>told about every PayloadSite change, the moment it happens</span><span class="who">built in</span></div>
</div>

<div class="takeaway fragment fade-up">No server to build, no database to set up, no login system to write. The platform supplies the rest.</div>

Note:
A program that watches records and acts on them is called an operator, or
controller. Our portal is one. It finds the API by DNS name, keeps its
state in Kubernetes' own database, and gets its address from one record.

--

<!-- .slide: data-transition="fade" -->

## The operator loop: billing that never misses

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 400" xmlns="http://www.w3.org/2000/svg">
<image href="icons/lucide-eye.svg" x="220" y="60" width="60" height="60"/>
<text x="250" y="150" font-size="26" fill="#faf9f5" text-anchor="middle">Watch</text>
<text x="250" y="176" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">every PayloadSite, every tenant</text>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="380" y1="90" x2="500" y2="90" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/lucide-search-check.svg" x="570" y="60" width="60" height="60"/>
<text x="600" y="150" font-size="26" fill="#faf9f5" text-anchor="middle">Compare</text>
<text x="600" y="176" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">the record vs. our billing</text>
</g>
<g class="fragment fade-in" data-fragment-index="2">
<line x1="720" y1="90" x2="840" y2="90" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/lucide-receipt.svg" x="920" y="60" width="60" height="60"/>
<text x="950" y="150" font-size="26" fill="#faf9f5" text-anchor="middle">Act</text>
<text x="950" y="176" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">start, change or stop billing</text>
</g>
<g class="fragment fade-in" data-fragment-index="3">
<polyline points="950,200 950,230 250,230 250,200" stroke="#b0aea5" stroke-width="2" fill="none" data-dash data-arrow/>
<text x="600" y="222" font-size="20" fill="#b0aea5" text-anchor="middle" class="sans">forever</text>
</g>
<g class="fragment fade-in" data-fragment-index="4">
<text x="150" y="300" font-size="24" fill="#faf9f5" text-anchor="start">TJ's second site created</text>
<text x="800" y="300" font-size="24" fill="#8fa876" text-anchor="start">→ start billing</text>
<text x="150" y="340" font-size="24" fill="#faf9f5" text-anchor="start">bff changes small → medium</text>
<text x="800" y="340" font-size="24" fill="#e3c08d" text-anchor="start">→ new price</text>
<text x="150" y="380" font-size="24" fill="#faf9f5" text-anchor="start">Michael deletes his site</text>
<text x="800" y="380" font-size="24" fill="#c9789a" text-anchor="start">→ stop billing</text>
</g>
</svg>
</div>

Note:
The same thermostat idea from slide 2: watch, compare, act, forever. If
the portal restarts, it simply looks again and catches up.

--

<!-- .slide: data-transition="fade" -->

## Each tenant is fenced in

<table>
<thead><tr><th>Tenant</th><th>Can use</th><th>Payload sites (max)</th></tr></thead>
<tbody>
<tr><td><em>tjs-catfish-and-wings</em></td><td><img class="icon" src="icons/payload-light.svg" alt=""> sites, <img class="icon" src="icons/postgresql.svg" alt=""> databases</td><td>2</td></tr>
<tr><td><em>bff</em></td><td><img class="icon" src="icons/payload-light.svg" alt=""> sites, <img class="icon" src="icons/postgresql.svg" alt=""> databases</td><td>2</td></tr>
<tr><td><em>matt</em></td><td><img class="icon" src="icons/microsoft-windows.svg" alt=""> VMs, <img class="icon" src="icons/cncf-argo.svg" alt=""> workflows</td><td>0</td></tr>
<tr><td><em>michael</em></td><td><img class="icon" src="icons/payload-light.svg" alt=""> sites</td><td>1</td></tr>
<tr><td><em>dev-team</em></td><td>everything, everywhere</td><td>no limit</td></tr>
</tbody>
</table>
<!-- .element: class="fragment fade-up" -->

<div class="routes fragment fade-up">
<div class="route "><span class="verb post">POST</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">tjs-catfish-and-wings</span>/<span class="res">payloadsites</span></span><span class="what"><span style="color:var(--rose)">TJ&#39;s 3rd site: 403 Forbidden, limit reached</span></span></div>
</div>

Note:
Permissions (RBAC) say which routes each tenant may use, in which folder.
Limits (ResourceQuota) say how many. Both are just more records.

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 30% 20%, #2a3340, #1f1e1d 70%)" -->

<p class="kicker">Reassurance <img class="icon" src="icons/cncf.svg" alt=""></p>

## How the CNCF grades its projects

<div class="levels">
<div class="level  fragment fade-up"><img class="" src="icons/lucide-sprout.svg" alt=""><b>Sandbox</b><em>Early, experimental</em><ul class="ticks" style="font-size:0.95em; margin:0.3em 0 0.3em 0.2em"><li>accepted by the CNCF</li><li>neutral home, open rules</li><li>may still change a lot</li></ul><p style="margin:0"><strong>For us:</strong> Try it at the edges</p></div>
<div class="level sand fragment fade-up"><img class="" src="icons/lucide-leaf.svg" alt=""><b>Incubating</b><em>Proven in production</em><ul class="ticks" style="font-size:0.95em; margin:0.3em 0 0.3em 0.2em"><li>used in production by 3+ companies</li><li>a healthy, growing team</li><li>steady releases</li></ul><p style="margin:0"><strong>For us:</strong> Use it, keep an eye on it</p></div>
<div class="level green fragment fade-up"><img class="" src="icons/lucide-tree-deciduous.svg" alt=""><b>Graduated</b><em>Boring, in the best way</em><ul class="ticks" style="font-size:0.95em; margin:0.3em 0 0.3em 0.2em"><li>independent security audit</li><li>maintainers from several companies</li><li>public list of users</li></ul><p style="margin:0"><strong>For us:</strong> Build the business on it</p></div>
</div>

<div class="tiles fragment fade-up" style="gap:0.4em 0.3em">
<div class="tile" style="width:5.2em"><img class="" src="icons/kubernetes.svg" alt=""><b>Kubernetes</b></div><div class="tile" style="width:5.2em"><img class="" src="icons/etcd.svg" alt=""><b>etcd</b></div><div class="tile" style="width:5.2em"><img class="" src="icons/coredns.svg" alt=""><b>CoreDNS</b></div><div class="tile" style="width:5.2em"><img class="" src="icons/cilium.svg" alt=""><b>Cilium</b></div><div class="tile" style="width:5.2em"><img class="" src="icons/envoy-gateway.svg" alt=""><b>Envoy</b></div><div class="tile" style="width:5.2em"><img class="" src="icons/cncf-crossplane.svg" alt=""><b>Crossplane</b></div><div class="tile" style="width:5.2em"><img class="" src="icons/cncf-argo.svg" alt=""><b>Argo</b></div><div class="tile" style="width:5.2em"><img class="" src="icons/flux-cd.svg" alt=""><b>Flux</b></div>
</div>

<p class="hint">↓ "never heard of it" ≠ small · our rule · where we stand · who owns it</p>

Note:
The Cloud Native Computing Foundation (part of the Linux Foundation) only
moves a project up after checks, like vendor due diligence. The logos at
the bottom are Graduated projects we use.

--

<!-- .slide: data-transition="fade" -->

## "Never heard of it" ≠ small

<div class="tiles" style="gap:0.6em 0.3em">
<div class="tile fragment fade-up" style="width:5.6em"><img class="" src="icons/kubernetes.svg" alt=""><b>Kubernetes</b><span>started at Google</span></div><div class="tile fragment fade-up" style="width:5.6em"><img class="" src="icons/cncf-argo.svg" alt=""><b>Argo</b><span>grown up at Intuit</span></div><div class="tile fragment fade-up" style="width:5.6em"><img class="" src="icons/flux-cd.svg" alt=""><b>Flux</b><span>used by Microsoft in Azure</span></div><div class="tile fragment fade-up" style="width:5.6em"><img class="" src="icons/cilium.svg" alt=""><b>Cilium</b><span>Cisco; inside Google & Azure</span></div><div class="tile fragment fade-up" style="width:5.6em"><img class="" src="icons/envoy-gateway.svg" alt=""><b>Envoy</b><span>born at Lyft; runs Google & AWS proxies</span></div><div class="tile fragment fade-up" style="width:5.6em"><img class="" src="icons/cncf-kubevirt.svg" alt=""><b>KubeVirt</b><span>started by Red Hat</span></div><div class="tile fragment fade-up" style="width:5.6em"><img class="" src="icons/kubernetes.svg" alt=""><b>KRO</b><span>AWS + Google + Microsoft</span></div><div class="tile fragment fade-up" style="width:5.6em"><img class="" src="icons/cncf-crossplane.svg" alt=""><b>Crossplane</b><span>runs clouds at big enterprises</span></div>
</div>

<p class="big fragment fade-up">The most valuable software on earth runs on these.</p>

--

<!-- .slide: data-transition="fade" -->

## Our rule: CNCF on the pathway

<p class="muted">The pathway = everything a customer's order passes through</p>

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 190" xmlns="http://www.w3.org/2000/svg">
<g class="fragment fade-right">
<image href="icons/lucide-layout-dashboard.svg" x="53" y="53" width="54" height="54"/>
<text x="80" y="137" font-size="22" fill="#faf9f5" text-anchor="middle">Portal</text>
<text x="80" y="163" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">ours</text>
</g>
<g class="fragment fade-right">
<line x1="133" y1="80" x2="208" y2="80" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/kubernetes.svg" x="226" y="53" width="54" height="54"/>
<text x="253" y="137" font-size="22" fill="#8fa876" text-anchor="middle">Kubernetes</text>
<text x="253" y="163" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">Graduated</text>
</g>
<g class="fragment fade-right">
<line x1="306" y1="80" x2="381" y2="80" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/kubernetes.svg" x="399" y="53" width="54" height="54"/>
<text x="426" y="137" font-size="22" fill="#faf9f5" text-anchor="middle">KRO</text>
<text x="426" y="163" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">Kubernetes project</text>
</g>
<g class="fragment fade-right">
<line x1="479" y1="80" x2="554" y2="80" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/cncf-crossplane.svg" x="572" y="53" width="54" height="54"/>
<text x="599" y="137" font-size="22" fill="#8fa876" text-anchor="middle">Crossplane</text>
<text x="599" y="163" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">Graduated</text>
</g>
<g class="fragment fade-right">
<line x1="652" y1="80" x2="727" y2="80" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/cilium.svg" x="745" y="53" width="54" height="54"/>
<text x="772" y="137" font-size="22" fill="#8fa876" text-anchor="middle">Cilium</text>
<text x="772" y="163" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">Graduated</text>
</g>
<g class="fragment fade-right">
<line x1="825" y1="80" x2="900" y2="80" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/envoy-gateway.svg" x="918" y="53" width="54" height="54"/>
<text x="945" y="137" font-size="22" fill="#8fa876" text-anchor="middle">Envoy Gateway</text>
<text x="945" y="163" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">Graduated</text>
</g>
<g class="fragment fade-right">
<line x1="998" y1="80" x2="1073" y2="80" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/payload-light.svg" x="1091" y="53" width="54" height="54"/>
<text x="1118" y="137" font-size="22" fill="#faf9f5" text-anchor="middle">Payload site</text>
<text x="1118" y="163" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">ours</text>
</g>
</svg>
</div>

<div class="levels">
<div class="level green fragment fade-up"><b>1. Only CNCF</b>or Kubernetes itself, on the pathway</div>
<div class="level green fragment fade-up"><b>2. Prefer Graduated</b>for anything critical</div>
<div class="level sand fragment fade-up"><b>3. Incubating</b>where needed, watched</div>
<div class="level fragment fade-up"><b>4. Sandbox</b>off the critical path</div>
</div>

Note:
A simple procurement rule, like an approved-vendor list. With Envoy
Gateway as the front door, the whole pathway is now CNCF.

--

<!-- .slide: data-transition="fade" -->

## Where our stack stands today

| Level | Projects |
| --- | --- |
| <img class="icon" src="icons/lucide-tree-deciduous.svg" alt=""> **Graduated** | <img class="icon" src="icons/kubernetes.svg" alt=""> Kubernetes · <img class="icon" src="icons/etcd.svg" alt=""> etcd · <img class="icon" src="icons/coredns.svg" alt=""> CoreDNS · <img class="icon" src="icons/cilium.svg" alt=""> Cilium · <img class="icon" src="icons/envoy-gateway.svg" alt=""> Envoy (Gateway) · <img class="icon" src="icons/cncf-crossplane.svg" alt=""> Crossplane · <img class="icon" src="icons/cncf-argo.svg" alt=""> Argo · <img class="icon" src="icons/flux-cd.svg" alt=""> Flux |
| <img class="icon" src="icons/kubernetes.svg" alt=""> **Part of Kubernetes** | KRO · Gateway API |
| <img class="icon" src="icons/lucide-leaf.svg" alt=""> **Incubating** | <img class="icon" src="icons/cncf-kubevirt.svg" alt=""> KubeVirt |
| <img class="icon" src="icons/lucide-sprout.svg" alt=""> **Sandbox** | <img class="icon" src="icons/postgresql.svg" alt=""> CloudNativePG · <img class="icon" src="icons/opentofu.svg" alt=""> OpenTofu · <img class="icon" src="icons/cncf-k3s.svg" alt=""> k3s · <img class="icon" src="icons/cncf-openebs.svg" alt=""> OpenEBS |
| **Not CNCF** (open source) | <img class="icon" src="icons/rancher.svg" alt=""> RKE2 |
<!-- .element: class="fragment fade-up" -->

<p class="fragment fade-up">The whole pathway is <strong>Graduated</strong> or part of Kubernetes.</p>

--

<!-- .slide: data-transition="fade" -->

## Owned by a foundation, built in the open

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 200" xmlns="http://www.w3.org/2000/svg">
<image href="icons/lucide-landmark.svg" x="120" y="40" width="60" height="60"/>
<text x="150" y="130" font-size="26" fill="#faf9f5" text-anchor="middle">Linux Foundation</text>
<text x="150" y="156" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">neutral non-profit</text>
<g class="fragment fade-in" data-fragment-index="1">
<line x1="260" y1="70" x2="420" y2="70" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/cncf.svg" x="500" y="40" width="60" height="60"/>
<text x="530" y="130" font-size="26" fill="#faf9f5" text-anchor="middle">CNCF</text>
<text x="530" y="156" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">Microsoft, Google, Amazon, ...</text>
</g>
<g class="fragment fade-in" data-fragment-index="2">
<line x1="650" y1="70" x2="820" y2="70" stroke="#faf9f5" stroke-width="2" fill="none" data-arrow/>
<image href="icons/kubernetes.svg" x="900" y="40" width="60" height="60"/>
<text x="930" y="130" font-size="26" fill="#faf9f5" text-anchor="middle">Kubernetes</text>
<text x="930" y="156" font-size="19" fill="#b0aea5" text-anchor="middle" class="sans">given by Google, 2015</text>
</g>
</svg>
</div>

<div class="takeaway fragment fade-up"><img class="icon" src="icons/opentofu.svg" alt=""> <strong>2023:</strong> Terraform's company changed its license. The community moved the open code to <strong>OpenTofu</strong> under a foundation. A foundation-owned project <strong>can't be taken away</strong>.</div>

<p class="fragment fade-up">You already depend on open source: <img class="icon" src="icons/payload-light.svg" alt=""> Payload CMS · DotNetNuke · <img class="icon" src="icons/dotnet.svg" alt=""> .NET · <img class="icon" src="icons/github-light.svg" alt=""> GitHub. A new Kubernetes release every <strong>4 months</strong>, free.</p>

---

<!-- .slide: data-background-gradient="radial-gradient(circle at 70% 80%, #2a3340, #1f1e1d 70%)" -->

## Our platform, floor by floor

<div class="layer fragment fade-down" data-fragment-index="6" style="border-left-color:var(--clay); width:96%"><span>Our routes: sites, tenants, databases, VMs</span><span><img class="icon" src="icons/kubernetes.svg" alt=""> KRO <img class="icon" src="icons/cncf-crossplane.svg" alt=""> Crossplane <img class="icon" src="icons/cncf-kubevirt.svg" alt=""> KubeVirt <img class="icon" src="icons/postgresql.svg" alt=""> CloudNativePG</span></div>
<div class="layer fragment fade-down" data-fragment-index="5" style="border-left-color:var(--rose); width:91%"><span>Front door</span><span><img class="icon" src="icons/cloudflare.svg" alt=""> Cloudflare <img class="icon" src="icons/envoy-gateway.svg" alt=""> Envoy Gateway</span></div>
<div class="layer fragment fade-down" data-fragment-index="4" style="border-left-color:var(--sand); width:86%"><span>Networking: Cluster Mesh, BGP</span><span><img class="icon" src="icons/cilium.svg" alt=""> Cilium</span></div>
<div class="layer fragment fade-down" data-fragment-index="3" style="border-left-color:var(--blue); width:81%"><span>Kubernetes, disks, sandboxes</span><span><img class="icon" src="icons/rancher.svg" alt=""> RKE2 <img class="icon" src="icons/cncf-k3s.svg" alt=""> k3s <img class="icon" src="icons/cncf-openebs.svg" alt=""> OpenEBS <img class="icon" src="icons/lucide-shield.svg" alt=""> Kata</span></div>
<div class="layer fragment fade-down" data-fragment-index="2" style="border-left-color:var(--green); width:76%"><span>Encrypted network between every server</span><span><img class="icon" src="icons/wireguard.svg" alt=""> WireGuard</span></div>
<div class="layer fragment fade-down" data-fragment-index="1" style="border-left-color:var(--muted); width:71%"><span>Servers: any cloud + our racks</span><span><img class="icon" src="icons/nixos.svg" alt=""> NixOS</span></div>

<p class="hint">↓ extra walls · the end</p>

Note:
Builds bottom to top. NixOS: every server described in text files and
tested before it reaches production. WireGuard: one encrypted network
across clouds and our own racks. Then Kubernetes, networking, the front
door, and our own routes on top.

--

<!-- .slide: data-transition="fade" -->

## Extra walls for risky work: Kata Containers

<div class="diagram">
<svg class="sketch" viewBox="0 0 1200 330" xmlns="http://www.w3.org/2000/svg">
<rect x="60" y="30" width="480" height="270" rx="14" stroke="#b0aea5" stroke-width="2" fill="none"/>
<text x="300" y="65" font-size="26" fill="#faf9f5" text-anchor="middle">Normal containers</text>
<rect x="100" y="240" width="400" height="40" rx="14" stroke="#e3c08d" stroke-width="2" fill="#2b2a27" data-fill="solid"/>
<text x="300" y="268" font-size="20" fill="#e3c08d" text-anchor="middle" class="sans">one shared Linux kernel</text>
<image href="icons/lucide-container.svg" x="133" y="133" width="54" height="54"/>
<image href="icons/lucide-container.svg" x="273" y="133" width="54" height="54"/>
<image href="icons/lucide-container.svg" x="413" y="133" width="54" height="54"/>
<line x1="160" y1="190" x2="160" y2="238" stroke="#e3c08d" stroke-width="2" fill="none"/>
<line x1="300" y1="190" x2="300" y2="238" stroke="#e3c08d" stroke-width="2" fill="none"/>
<line x1="440" y1="190" x2="440" y2="238" stroke="#e3c08d" stroke-width="2" fill="none"/>
<g class="fragment fade-in" data-fragment-index="1">
<rect x="660" y="30" width="480" height="270" rx="14" stroke="#8fa876" stroke-width="2" fill="none"/>
<text x="900" y="65" font-size="26" fill="#8fa876" text-anchor="middle">Kata Containers</text>
<rect x="705" y="100" width="120" height="180" rx="14" stroke="#8fa876" stroke-width="3" fill="none"/>
<rect x="840" y="100" width="120" height="180" rx="14" stroke="#8fa876" stroke-width="3" fill="none"/>
<rect x="975" y="100" width="120" height="180" rx="14" stroke="#8fa876" stroke-width="3" fill="none"/>
<image href="icons/nvidia.svg" x="741" y="136" width="48" height="48"/>
<image href="icons/minecraft.svg" x="876" y="136" width="48" height="48"/>
<image href="icons/lucide-bot.svg" x="1011" y="136" width="48" height="48"/>
<text x="765" y="255" font-size="18" fill="#faf9f5" text-anchor="middle" class="sans">own VM</text>
<text x="900" y="255" font-size="18" fill="#faf9f5" text-anchor="middle" class="sans">own VM</text>
<text x="1035" y="255" font-size="18" fill="#faf9f5" text-anchor="middle" class="sans">own VM</text>
</g>
</svg>
</div>

<p class="fragment fade-up">For AI agents, customer code and Minecraft plugins: one line, <em>runtimeClassName: kata</em>.</p>

Note:
Normal containers on a server share one Linux kernel, like apartments
sharing one building. Kata Containers gives each one its own small virtual
machine, like a separate house, so a break-in stays inside. Same API, same
records; only the risky workloads pay the small extra cost.

--

<!-- .slide: data-background-gradient="radial-gradient(circle at 50% 40%, #3a2a22, #141413 70%)" data-transition="zoom" -->

## One POST = one customer's website, on any cloud

<div class="routes ">
<div class="route new"><span class="verb post">POST</span><span class="path">/apis/<span class="grp">kro.run</span>/v1alpha1/namespaces/<span class="ns">tjs-catfish-and-wings</span>/<span class="res">payloadsites</span></span><span class="what"><em>"tjscatfishandwings.com, ACA, small"</em></span></div>
</div>

<p class="big fragment fade-up">Kubernetes, the extensible API: <strong>a platform that develops itself.</strong></p>

<h1 class="fragment fade-up hand" style="margin-top:0.5em">Questions?</h1>

<small class="fragment fade-in">Everything from tonight, slower, is on the website.</small>

Note:
Ask him to explain back what happens when Michael clicks "Create my site".
