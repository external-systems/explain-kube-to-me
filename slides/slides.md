<!-- .slide: data-background-color="#1d2a44" -->

# Kubernetes

## The Extensible API

<p class="subtitle">a Platform that Develops itself</p>

<small>Press → to go forward · F for full screen</small>

Note:
Welcome. Set expectations right away: no code tonight, only pictures and
comparisons to things he already knows (Windows Server, IIS, DotNetNuke,
Payload CMS, SQL, APIs). Tell him he can stop you at any slide.
Everything here is also written up, slower, on the website, so nothing has
to be memorised tonight.

---

## Tonight's promise

<div class="row">
<div class="box teal"><span class="emoji">🚫</span><b>Zero code</b>Pictures and comparisons only</div>
<div class="box"><span class="emoji">🪟</span><b>Your world first</b>Windows Server, IIS, DNN, Payload, SQL</div>
<div class="box amber"><span class="emoji">✋</span><b>Stop me anytime</b>No question is too basic</div>
</div>

<p class="fragment">Everything tonight is also on the website, to read later at your own pace.</p>

Note:
The website is the docs site this deck lives in. Show him the URL at the
end. This takes the pressure off: he does not need to take notes.

---

## Five ideas, that's all

<div class="row">
<div class="box fragment"><span class="emoji">🚪</span><b>1. It's an API</b>Describe what you want</div>
<div class="box teal fragment"><span class="emoji">🧩</span><b>2. It's extensible</b>Add our own endpoints</div>
<div class="box purple fragment"><span class="emoji">🗄️</span><b>3. It's a database</b>Built right in</div>
<div class="box amber fragment"><span class="emoji">🔧</span><b>4. Plumbing included</b>DNS, network, storage</div>
<div class="box red fragment"><span class="emoji">🌍</span><b>5. Owned by everyone</b>Community + foundation</div>
</div>

Note:
This is the map for the evening. Come back to it at the end. If he only
remembers one thing: Kubernetes is an API, and we can teach it new things.

---

<!-- .slide: data-background-color="#2f6fde" -->

<p class="section-number">Part 1</p>

# The big idea

Containers, and the thermostat

---

## Today: setting up DotNetNuke by hand

<div class="row">
<div class="box gray"><span class="emoji">🖥️</span><b>Windows Server</b></div>
<div class="arrow">→</div>
<div class="box gray"><span class="emoji">🌐</span><b>+ IIS</b></div>
<div class="arrow">→</div>
<div class="box gray"><span class="emoji">⚙️</span><b>+ .NET</b></div>
<div class="arrow">→</div>
<div class="box gray"><span class="emoji">📝</span><b>+ settings</b></div>
<div class="arrow">→</div>
<div class="box gray"><span class="emoji">🧾</span><b>+ the site</b></div>
</div>

<p class="fragment">Every step done by a person. One step different, and it <strong>"works on my machine"</strong>.</p>

Note:
He has lived this. Ask him: how long does it take to stand up a new DNN
server? How often did a new server not quite match the old one?

---

## A container: the whole thing in one sealed box

<div class="row">
<div class="box wide fill"><span class="emoji">📦</span><b>The site + IIS-equivalent + runtime + settings</b>packed together once</div>
</div>
<div class="down">↓</div>
<div class="row">
<div class="box teal"><b>Your laptop</b>runs the same</div>
<div class="box teal"><b>Our server room</b>runs the same</div>
<div class="box teal"><b>Azure / AWS / Google</b>runs the same</div>
</div>

<p class="fragment muted">Docker is just one tool for <em>making</em> boxes. You never need it on your PC.</p>

Note:
Address the Docker install failure head-on: Docker Desktop on Windows needs
a Linux layer underneath (WSL), which is fiddly. It has nothing to do with
understanding or managing Kubernetes. Builders make the boxes; Kubernetes
runs them on servers.

---

## Why "Kubernetes"?

<div class="row">
<div class="box"><span class="emoji">📦</span><b>Shipping container</b>One standard shape, any ship or truck</div>
<div class="box"><span class="emoji">🚢</span><b>A ship full of them</b>Hundreds of apps, many servers</div>
<div class="box teal"><span class="emoji">☸️</span><b>"Kubernetes"</b>Greek for <em>helmsman</em>: the one who steers</div>
</div>

Note:
The steel shipping container standardised cargo in the 1950s and changed
world trade. Software containers did the same for programs. Kubernetes is
the helmsman steering a ship full of them. The logo is a ship's wheel.

---

## Kubernetes takes a work order

<div class="takeaway big">"Run <strong>3 copies</strong> of the customer portal, <strong>version 2.4</strong>, at <strong>portal.example.com</strong>, with <strong>20 GB</strong> of storage."</div>

<p class="fragment">You say <strong>what</strong> you want. Never <strong>how</strong>.</p>

Note:
This is the project-manager mindset he already has: you describe the
outcome and the team figures out the steps. Kubernetes is that team, and
it never sleeps.

---

## The thermostat

<div class="row">
<div class="box"><span class="emoji">📝</span><b>What we want</b>3 copies running</div>
<div class="arrow">→</div>
<div class="box teal fill"><span class="emoji">🔁</span><b>Compare</b>want vs. have, forever</div>
<div class="arrow">←</div>
<div class="box amber"><span class="emoji">👀</span><b>What is real</b>only 2 running</div>
</div>
<div class="down fragment">↓</div>
<div class="row fragment">
<div class="box red"><span class="emoji">🛠️</span><b>Fix the difference</b>start 1 more copy</div>
</div>

<p class="fragment muted">This loop is called a <strong>controller</strong>. Remember that word.</p>

Note:
Most important slide of part 1. A thermostat doesn't take orders like "run
the furnace 10 minutes". You set 70°F and it keeps checking and fixing.
That checking program is a controller. Everything later builds on this.

---

## 3 a.m., a server dies

<div class="row">
<div class="box red fragment"><span class="emoji">💥</span><b>3:00</b>Server 2 dies</div>
<div class="arrow fragment">→</div>
<div class="box amber fragment"><span class="emoji">👀</span><b>3:00</b>Controller: "want 3, have 2"</div>
<div class="arrow fragment">→</div>
<div class="box teal fragment"><span class="emoji">✅</span><b>3:01</b>New copy on server 3</div>
<div class="arrow fragment">→</div>
<div class="box fragment"><span class="emoji">😴</span><b>Morning</b>Nobody was paged</div>
</div>

<div class="takeaway fragment">The runbook <em>"RDP in, restart the app pool"</em> is replaced by the work order itself.</div>

Note:
Ask him how many 3 a.m. calls his teams get. The team writes down what
"good" looks like, and the platform does the restarting and moving.

---

<!-- .slide: data-background-color="#0f9d8a" -->

<p class="section-number">Part 2</p>

# Kubernetes is an API

One front door for everything

---

## Windows Server: a different tool for every job

<div class="row">
<div class="box gray"><b>IIS Manager</b></div>
<div class="box gray"><b>DNS console</b></div>
<div class="box gray"><b>Disk Mgmt</b></div>
<div class="box gray"><b>Task Scheduler</b></div>
<div class="box gray"><b>AD Users</b></div>
</div>

<p class="muted">Each with its own screen, usually over Remote Desktop.</p>

<div class="fragment">
<h2>Kubernetes: one front door</h2>
<div class="row"><div class="box wide fill"><span class="emoji">🚪</span><b>The Kubernetes API</b>websites · DNS names · disks · scheduled jobs · passwords</div></div>
</div>

Note:
He understands APIs. The point: every part of the system is managed
through the same API, in the same way, by the same tools.

---

## Everything is a record

| Kind | One record means... | In Windows terms |
| --- | --- | --- |
| **Deployment** | Keep 3 copies of this app running | IIS site + app pool + a watcher |
| **Service** | A stable name for those copies | DNS name + load balancer |
| **Secret** | A password or certificate | Credential Manager |
| **Volume claim** | "I need 20 GB of disk" | A new drive letter |
| **CronJob** | Run this every night at 2 a.m. | Task Scheduler |

<p class="fragment">Create · Read · Update · Delete. The same four verbs as SQL.</p>

Note:
Kubernetes calls the types "kinds" and the records "resources". CRUD maps
to INSERT, SELECT, UPDATE, DELETE, which he knows from SQL.

---

## You already know this: Payload CMS

<div class="row">
<div class="box"><b>Payload</b></div>
<div class="box"><span class="emoji">🗂️</span>Define a <b>collection</b></div>
<div class="arrow">→</div>
<div class="box"><span class="emoji">🔌</span>Get a <b>REST API</b> + admin screen</div>
<div class="arrow">→</div>
<div class="box"><span class="emoji">🪝</span><b>Hooks</b> run on every change</div>
</div>
<div class="row fragment">
<div class="box teal"><b>Kubernetes</b></div>
<div class="box teal"><span class="emoji">🗂️</span>Define a <b>kind</b></div>
<div class="arrow">→</div>
<div class="box teal"><span class="emoji">🔌</span>Get a <b>REST API</b> + dashboards</div>
<div class="arrow">→</div>
<div class="box teal"><span class="emoji">🔁</span><b>Controllers</b> act on every change</div>
</div>

<p class="fragment big">Same pattern. Content in Payload, <strong>infrastructure</strong> in Kubernetes.</p>

Note:
This is the key bridge for the whole talk. He is excited about Payload;
use that. Payload collection = Kubernetes kind. Payload hook = Kubernetes
controller. Then pause and check it landed before moving on.

---

## Why "it's an API" matters

<div class="row">
<div class="box fragment"><span class="emoji">🗣️</span><b>One language</b>Every tool reads and writes the same records</div>
<div class="box teal fragment"><span class="emoji">📜</span><b>Work orders in git</b>Who changed what, when, and undo</div>
<div class="box amber fragment"><span class="emoji">🌍</span><b>Same anywhere</b>Azure, AWS, Google, our racks</div>
<div class="box purple fragment"><span class="emoji">🧩</span><b>We can add our own</b>New collections, like Payload</div>
</div>

Note:
The last box is the bridge to Part 3, the heart of the headline.

---

<!-- .slide: data-background-color="#7d4cdb" -->

<p class="section-number">Part 3: the headline</p>

# Teaching the API new tricks

The Extensible API

---

## Three words

<div class="row">
<div class="box purple"><span class="emoji">📐</span><b>CRD</b>Defines a brand-new kind of record<br><span class="muted">= a new Payload collection</span></div>
<div class="box purple fragment"><span class="emoji">🧾</span><b>Custom resource</b>One record of that kind<br><span class="muted">= one entry in it</span></div>
<div class="box purple fragment"><span class="emoji">🔁</span><b>Controller</b>Makes the real world match<br><span class="muted">= a hook / the thermostat</span></div>
</div>

<div class="takeaway fragment">CRD + controller, packaged so anyone can install it = an <strong>operator</strong>.</div>

Note:
CRD stands for Custom Resource Definition. Once installed, the API grows a
new endpoint automatically, managed with the same tools, permissions and
history as everything built in. Nobody had to change Kubernetes or wait for
a vendor release.

---

## An operator is an expert in a box

<div class="row">
<div class="box"><span class="emoji">🧑‍💼</span><b>Your best DBA</b>replication · backups · restores · 3 a.m. failover · upgrades</div>
<div class="arrow">→</div>
<div class="box purple fill"><span class="emoji">🤖</span><b>Operator</b>the same knowledge, as a program, working 24/7</div>
</div>

<div class="takeaway fragment">Work order: <em>"A Postgres database, 2 standby copies, nightly backups."</em><br>The operator does the rest, and keeps doing it.</div>

Note:
He has managed DBAs and sysadmins. An operator is their runbook turned into
a program. The example here is CloudNativePG.

---

## Adding a new endpoint

<div class="row">
<div class="box purple fragment"><span class="emoji">1️⃣</span>Install a CRD: <b>"PostgresCluster"</b></div>
<div class="arrow fragment">→</div>
<div class="box purple fragment"><span class="emoji">2️⃣</span>The API grows a <b>new endpoint</b></div>
<div class="arrow fragment">→</div>
<div class="box purple fragment"><span class="emoji">3️⃣</span>Someone files <b>"billing-db, please"</b></div>
<div class="arrow fragment">→</div>
<div class="box teal fill fragment"><span class="emoji">🐘</span><b>A real database</b>backed up, highly available</div>
</div>

Note:
Walk through slowly. Step 2 is the magic: the endpoint appears on our
servers on its own, just like adding a collection in Payload gives you a
REST endpoint.

---

## Things we can add to our API today

<div class="row">
<div class="box fragment"><span class="emoji">☁️</span><b>Cloud infra</b>Google · AWS · Azure<br><span class="muted">Crossplane, Flux OpenTofu controller</span></div>
<div class="box teal fragment"><span class="emoji">🐘</span><b>Postgres</b>with backups & failover<br><span class="muted">CloudNativePG</span></div>
<div class="box amber fragment"><span class="emoji">🔒</span><b>A VPN per customer</b>on our own servers<br><span class="muted">headroom-operator</span></div>
<div class="box red fragment"><span class="emoji">🪟</span><b>Windows VMs</b>next to the containers<br><span class="muted">KubeVirt</span></div>
<div class="box purple fragment"><span class="emoji">🤖</span><b>AI agent sandbox</b>safe and locked down<br><span class="muted">NVIDIA OpenShell</span></div>
</div>

<p class="fragment">Each one: <strong>a new kind of record</strong>. Install it, and the platform can do something it couldn't yesterday.</p>

Note:
Pause on Windows VMs: Kubernetes can run his Windows Server world too.
For the cloud one, next slide tells the story.

---

## Our API as a remote control for every cloud

<div class="row">
<div class="box"><span class="emoji">📝</span><b>A record in our API</b>"Azure SQL database, this size, this region"</div>
<div class="arrow">→</div>
<div class="box purple"><span class="emoji">🔁</span><b>Crossplane controller</b>calls Azure's own API for us</div>
<div class="arrow">→</div>
<div class="box teal"><span class="emoji">🗄️</span><b>The database exists</b>in Azure</div>
</div>

<div class="takeaway fragment">Someone changes it by hand in the Azure portal? The controller <strong>puts it back</strong>. The thermostat again.</div>

<p class="fragment muted">Swap "Azure" for Google Cloud or AWS: same process.</p>

Note:
No logging into three different cloud portals. Our own API is the one
front door to every cloud. Drift is corrected automatically.

---

## KRO: new endpoints with no code at all

<div class="row">
<div class="box wide fill"><span class="emoji">📝</span><b>One record: "New customer: Acme, plan: Gold"</b></div>
</div>
<div class="down">↓ KRO follows our recipe, a <strong>Resource Graph Definition</strong> called "Tenant"</div>
<div class="row">
<div class="box fragment"><span class="emoji">📁</span><b>Folder</b>Acme's own space</div>
<div class="box teal fragment"><span class="emoji">🐘</span><b>Database</b>CloudNativePG</div>
<div class="box amber fragment"><span class="emoji">🔒</span><b>VPN</b>headroom-operator</div>
<div class="box red fragment"><span class="emoji">🌐</span><b>Website</b>+ public address</div>
<div class="box purple fragment"><span class="emoji">☁️</span><b>Backups</b>cloud bucket</div>
</div>

Note:
KRO = Kube Resource Orchestrator. The recipe is configuration, not a
program: what the new kind is called, what it asks for, and what it
creates. KRO adds the kind to the API on the spot and acts as its
controller. SQL comparison: like a view or stored procedure a non-programmer
can write. One simple thing outside, many real things inside.

---

## Who builds KRO?

<div class="row">
<div class="box amber"><span class="emoji">🟧</span><b>Amazon</b>AWS</div>
<div class="box"><span class="emoji">🟦</span><b>Google</b>Cloud</div>
<div class="box teal"><span class="emoji">🪟</span><b>Microsoft</b>Azure</div>
</div>

<p class="big fragment">Three fierce competitors, building it <strong>together</strong>.</p>

<p class="fragment muted">Now part of the official Kubernetes project.</p>

Note:
When the three biggest cloud companies, who compete for the same customers,
agree to build one tool together, that tells you where the industry is
going. Lead-in for Part 6 on community.

---

## A platform that develops itself

<div class="row">
<div class="box purple fragment"><span class="emoji">📥</span><b>Install</b>someone else's operator in minutes instead of building it</div>
<div class="box teal fragment"><span class="emoji">🏗️</span><b>Publish</b>our own products ("Tenant") on our own API</div>
<div class="box amber fragment"><span class="emoji">🔁</span><b>Automate</b>describe outcomes, stop clicking consoles</div>
<div class="box fragment"><span class="emoji">🌍</span><b>Inherit</b>improvements from the whole world</div>
</div>

Note:
This is the headline explained. Restate it out loud: Kubernetes, the
extensible API, a platform that develops itself.

---

<!-- .slide: data-background-color="#1d2a44" -->

<p class="section-number">Part 4</p>

# A database built in

Kubernetes is also a database

---

## Every record lives in a built-in database

| Key (the address) | Value (the record) |
| --- | --- |
| /deployments/acme/customer-portal | 3 copies, version 2.4 |
| /secrets/acme/database-password | 🔒 encrypted |
| /tenants/acme | plan: Gold, region: US-East |

<p class="fragment">A <strong>key-value store</strong> called <strong>etcd</strong>. Think: the Windows <strong>Registry</strong>, made bulletproof.</p>

<p class="fragment muted">On k3s it can even be SQLite, PostgreSQL or MySQL underneath.</p>

Note:
A key-value store is a SQL table with only two columns. etcd is pronounced
"et-see-dee". k3s (our edge Kubernetes) can use a SQL database instead.

---

## What it adds on top of a plain table

| Feature | Meaning | SQL Server |
| --- | --- | --- |
| **Replicated** | Kept on 3 or 5 servers | Always On |
| **Watch** | Programs are told instantly when a record changes | Triggers |
| **Versioned** | Nobody overwrites another's change | rowversion |
| **Schema checked** | Bad records are refused | Constraints |
| **Permissions** | Who can touch which kinds | GRANT / DENY |
| **Audit log** | Who changed what, when | SQL Audit |

Note:
Watch is what makes controllers possible: they are notified instead of
polling.

---

## Our apps can use it too

<div class="row">
<div class="box"><span class="emoji">🧩</span><b>Our app</b>stores its settings, customers, job status</div>
<div class="arrow">⇄</div>
<div class="box fill"><span class="emoji">🚪</span><b>Kubernetes API</b></div>
<div class="arrow">→</div>
<div class="box purple"><span class="emoji">🗄️</span><b>Built-in database</b>replicated, audited, free</div>
</div>

<div class="takeaway fragment">For <strong>small, important records</strong>. Millions of orders still go in a real database, which is just another work order (CloudNativePG).</div>

Note:
No separate database to set up and maintain for configuration and state.

---

<!-- .slide: data-background-color="#e69b00" -->

<p class="section-number">Part 5</p>

# The plumbing comes free

---

## Separate products before, built in now

| Job | Windows world | Kubernetes |
| --- | --- | --- |
| Names | Windows DNS, by hand | **CoreDNS**, automatic |
| Network | VLANs, firewall tickets | **Cilium**, rules per app |
| Encrypt app traffic | Certs per server | **Mesh network** |
| Internet front door | IIS bindings, ARR, F5 | **Gateway API**, LoadBalancer |
| Disks | SAN, iSCSI, drive letters | **CSI**: ask for 20 GB |
| Crashes | A person or a script | Health checks, auto-replace |
| Updates | Pull a server from the farm... | **Rolling updates** |

Note:
On Windows each row is a separate product, project and often team. In
Kubernetes each row is just another kind of record in the same API, and a
new app gets all of it on day one.

---

## How a visitor reaches our site

<div class="row">
<div class="box"><span class="emoji">🌍</span><b>Visitor</b></div>
<div class="arrow">→</div>
<div class="box amber"><span class="emoji">⚖️</span><b>Load balancer</b>public address</div>
<div class="arrow">→</div>
<div class="box teal"><span class="emoji">🚪</span><b>Gateway</b>Traefik: right site, HTTPS</div>
<div class="arrow">→</div>
<div class="box"><span class="emoji">📇</span><b>Service</b>found by name</div>
<div class="arrow">→</div>
<div class="box purple"><span class="emoji">📦📦📦</span><b>3 copies</b>+ their disks</div>
</div>

<p class="fragment">Every box is a record in the API. A server dies → traffic moves, a copy restarts, the disk follows.</p>

Note:
Nobody touches anything when a server fails.

---

## Runs anywhere

<div class="row">
<div class="box"><span class="emoji">🟦</span><b>Azure</b>AKS</div>
<div class="box amber"><span class="emoji">🟧</span><b>AWS</b>EKS</div>
<div class="box teal"><span class="emoji">🟩</span><b>Google</b>GKE</div>
<div class="box gray"><span class="emoji">🏢</span><b>Our own racks</b>first-class too</div>
</div>

<div class="takeaway fragment">"Which cloud?" stops being a 10-year lock-in. Moving is a migration of records, not a rewrite.</div>

<p class="fragment">🪟 Windows is welcome: Windows Server containers, and full Windows VMs with KubeVirt.</p>

Note:
Each cloud plugs its own load balancers, disks and networks in
automatically. On our own servers we bring our own (Cilium BGP, OpenEBS)
and apps cannot tell the difference.

---

<!-- .slide: data-background-color="#d64545" -->

<p class="section-number">Part 6: the most important part</p>

# Community and ownership

---

## "Never heard of it" ≠ small

<div class="row">
<div class="box"><b>Kubernetes</b>started at <strong>Google</strong></div>
<div class="box teal"><b>Argo CD</b>grown up at <strong>Intuit</strong></div>
<div class="box amber"><b>Flux</b>used by <strong>Microsoft</strong> in Azure</div>
<div class="box purple"><b>Cilium</b><strong>Cisco</strong>; inside Google &amp; Azure</div>
</div>
<div class="row">
<div class="box red"><b>KubeVirt</b>started by <strong>Red Hat</strong></div>
<div class="box"><b>KRO</b><strong>AWS + Google + Microsoft</strong></div>
<div class="box teal"><b>CloudNativePG</b><strong>EDB</strong>, Postgres experts</div>
<div class="box amber"><b>RKE2 / k3s</b><strong>SUSE</strong>; RKE2 built for government</div>
</div>

<p class="fragment big">The most valuable software on earth runs on these.</p>

Note:
Key emotional point. He has not heard of them because they live one layer
below the products people see. That doesn't make them small or poorly
maintained: they are built and run by the biggest companies on the planet.

---

## How to tell a healthy project

<div class="row">
<div class="box gray"><span class="emoji">🌱</span><b>Sandbox</b>promising, early</div>
<div class="arrow">→</div>
<div class="box amber"><span class="emoji">🌿</span><b>Incubating</b>in production, growing</div>
<div class="arrow">→</div>
<div class="box teal fill"><span class="emoji">🌳</span><b>Graduated</b>security audited, many companies, widely used</div>
</div>

<p class="fragment">Graduated: <strong>Kubernetes · Argo CD · Flux · Cilium · etcd · CoreDNS</strong></p>

Note:
These are the CNCF (Cloud Native Computing Foundation) maturity levels.
Graduation needs an independent security audit and maintainers from
several different companies.

---

## Open source: you already depend on it

<div class="row">
<div class="box"><span class="emoji">🌐</span><b>DotNetNuke</b>open source</div>
<div class="box teal"><span class="emoji">📰</span><b>Payload CMS</b>open source</div>
<div class="box purple"><span class="emoji">⚙️</span><b>.NET</b>open source since 2016</div>
<div class="box gray"><span class="emoji">🐙</span><b>GitHub</b>owned by Microsoft</div>
</div>

<p class="fragment big">Open source today = <strong>competitors building the foundation together</strong>.</p>

Note:
His two favourite frameworks are open source. Microsoft open-sourced .NET
and bought GitHub. Open source isn't hobbyists; it is how the industry
shares the costly foundation and competes on top of it.

---

## Why build in the open

<div class="row">
<div class="box fragment"><span class="emoji">👀</span><b>More eyes</b>security found and fixed in public</div>
<div class="box teal fragment"><span class="emoji">🔓</span><b>No lock-in</b>the code outlives any vendor</div>
<div class="box amber fragment"><span class="emoji">🧑‍💻</span><b>Easier hiring</b>people already know it</div>
<div class="box purple fragment"><span class="emoji">🎁</span><b>Free upgrades</b>others' fixes reach us</div>
<div class="box red fragment"><span class="emoji">⭐</span><b>Reputation</b>customers see our work</div>
</div>

<div class="takeaway fragment">So we build in the open as much as we can, the same way Kubernetes is built.</div>

Note:
Business value, not ideology. Each box is money: security costs, vendor
risk, hiring and training costs, engineering time, sales.

---

## Owned by a foundation, not a company

<div class="row">
<div class="box gray"><span class="emoji">🏛️</span><b>Linux Foundation</b>neutral non-profit</div>
<div class="arrow">→</div>
<div class="box"><span class="emoji">☁️</span><b>CNCF</b>Cloud Native Computing Foundation</div>
<div class="arrow">→</div>
<div class="box teal fill"><span class="emoji">☸️</span><b>Kubernetes</b>given by Google in 2015</div>
</div>

<div class="takeaway fragment"><strong>2023:</strong> Terraform's company changed its license. The community copied the open code into <strong>OpenTofu</strong> at the Linux Foundation. A foundation-owned project <strong>can't be taken away</strong>.</div>

Note:
Members include Microsoft, Google, Amazon, IBM/Red Hat, Oracle, Cisco and
hundreds more. The Terraform story is why our cloud controller uses
OpenTofu. Kubernetes has had that protection from day one.

---

## It gets better underneath us

<div class="row top">
<div class="box gray"><b>2003+</b>Google runs Borg internally</div>
<div class="box"><b>2014</b>Kubernetes open sourced</div>
<div class="box"><b>2015</b>1.0, given to CNCF</div>
<div class="box teal"><b>2019</b>Windows containers supported</div>
<div class="box teal"><b>2023</b>Gateway API stable</div>
<div class="box purple fill"><b>Today</b>every cloud, AI &amp; GPUs</div>
</div>

<p class="fragment">A new release <strong>every 4 months</strong>. We upgrade, and get better networking, storage and AI support for free.</p>

<p class="fragment big">Over a decade old, here to stay, and only now getting really good.</p>

Note:
Every operator improves on its own schedule too: a new CloudNativePG
version makes every tenant's database better with no work from our team.

---

<!-- .slide: data-background-color="#0f9d8a" -->

<p class="section-number">Part 7</p>

# Our platform

How we put it all together

---

## Our layer cake

<div class="layer" style="background:#7d4cdb; width:96%"><span>🧩 Our API: tenants, Postgres, VPNs, cloud infra, Windows VMs</span><span>KRO · operators</span></div>
<div class="layer" style="background:#d64545; width:90%"><span>🚪 Front door</span><span>Traefik · Cilium Gateway API · Cloudflare mTLS</span></div>
<div class="layer" style="background:#e69b00; width:84%"><span>🛣️ Networking</span><span>Cilium · Cluster Mesh · BGP + BIRD</span></div>
<div class="layer" style="background:#2f6fde; width:78%"><span>⚙️ Kubernetes</span><span>RKE2 (production) · k3s (edge) · OpenEBS</span></div>
<div class="layer" style="background:#0f9d8a; width:72%"><span>🔒 Encrypted network</span><span>WireGuard between every server</span></div>
<div class="layer" style="background:#1d2a44; width:66%"><span>🖥️ Servers</span><span>NixOS · any cloud + our racks</span></div>

Note:
Walk bottom to top. Each layer sits on the one below like floors in a
building. The next slides take a few floors one at a time.

---

## Floor 1: every server is a recipe

<div class="row">
<div class="box"><span class="emoji">📄</span><b>NixOS</b>the whole server described in text files</div>
<div class="arrow">→</div>
<div class="box amber"><span class="emoji">🧪</span><b>Tested first</b>whole clusters built as VMs and checked automatically</div>
<div class="arrow">→</div>
<div class="box teal fill"><span class="emoji">🚀</span><b>Then production</b>identical, every time</div>
</div>

<div class="takeaway fragment">Windows terms: the server image + all Group Policy + every setting, in one document. Bad change? Pick yesterday's version at boot.</div>

Note:
Every RKE2 and k3s feature is first tested and validated in a full NixOS
VM test suite before it ever hits production. Think: a brand-new staging
environment built from scratch and thrown away, for every single change.

---

## Floors 2 and 4: the network

<div class="row">
<div class="box teal"><span class="emoji">🔒</span><b>WireGuard</b>every server-to-server link encrypted</div>
<div class="box"><span class="emoji">🗺️</span><b>Layer 3 only</b>routing, not one stretched office network</div>
<div class="box amber"><span class="emoji">☁️🏢</span><b>Mixed</b>clouds + our racks in one cluster</div>
<div class="box purple"><span class="emoji">🕸️</span><b>Cluster Mesh</b>many clusters act as one</div>
</div>

<div class="takeaway fragment"><strong>Every server is a router.</strong> Cilium + BIRD speak BGP, the internet's own routing language, to make load-balancer addresses from the servers' IPs. Add a server → more routing and front-door capacity. No F5 to buy.</div>

Note:
Cilium is the only network plugin we use. BGP is how routers on the
internet tell each other where addresses live. Our servers speak it
themselves.

---

## Floor 5: the front door

<div class="row">
<div class="box"><span class="emoji">🌍</span><b>Visitor</b></div>
<div class="arrow">→</div>
<div class="box amber"><span class="emoji">☁️</span><b>Cloudflare</b>protection, caching</div>
<div class="arrow">→</div>
<div class="box red"><span class="emoji">🤝</span><b>mTLS</b>both sides show certificates</div>
<div class="arrow">→</div>
<div class="box teal"><span class="emoji">🚪</span><b>Traefik × N</b>on our servers</div>
<div class="arrow">→</div>
<div class="box purple"><span class="emoji">📦🪟</span><b>Apps + Windows VMs</b></div>
</div>

<p class="fragment">Every protocol: <strong>HTTP · HTTPS · TCP · UDP · TLS · mTLS · QUIC</strong>, public or private.</p>

<p class="fragment muted">Gateway API preferred over the older Ingress.</p>

Note:
1 to N Traefik copies, each with a public load balancer address from Cilium
BGP using the nodes' IPs. Traefik's own record types (IngressRoute) let it
only accept connections that prove they came from Cloudflare, so nobody
can go around Cloudflare's protection.

---

## One record = one new customer

<div class="row">
<div class="box wide fill"><span class="emoji">📝</span><b>"New customer: Acme, Gold, US-East"</b></div>
</div>
<div class="down">↓</div>
<div class="row">
<div class="box">📁 folder</div>
<div class="box teal">🐘 database</div>
<div class="box amber">🔒 VPN</div>
<div class="box red">🌐 website + address</div>
<div class="box purple">☁️ backups</div>
</div>

<div class="takeaway fragment">On any cloud or our racks · encrypted end to end · tested before production · kept healthy 24/7</div>

Note:
This is the whole talk in one slide. Everything we discussed tonight is
working together to make this one record do all of that.

---

## The five ideas

<div class="row">
<div class="box"><span class="emoji">🚪</span><b>An API</b>describe what you want</div>
<div class="box teal"><span class="emoji">🧩</span><b>Extensible</b>add our own endpoints, even with no code</div>
<div class="box purple"><span class="emoji">🗄️</span><b>A database</b>built right in</div>
<div class="box amber"><span class="emoji">🔧</span><b>Plumbing</b>included, anywhere</div>
<div class="box red"><span class="emoji">🌍</span><b>Everyone's</b>community, open, foundation-owned</div>
</div>

<p class="fragment big">Kubernetes, the extensible API: <strong>a platform that develops itself.</strong></p>

Note:
Ask him to explain one of the five back to you in his own words. That is
the best check of what landed.

---

<!-- .slide: data-background-color="#1d2a44" -->

# Questions?

Everything from tonight, slower and in more detail, is on the website next to these slides.

<small>Chapters 1 to 7 · plain-language dictionary · no code anywhere</small>

Note:
Point him to the docs site, especially the dictionary page, which maps
every term to a Windows-world equivalent.
