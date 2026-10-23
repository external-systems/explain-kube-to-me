# Plain-language dictionary

Every term from this site, in alphabetical order, with the closest thing
from the Windows and web world.

| Term | In plain words | Closest familiar thing |
| --- | --- | --- |
| **API** | A front door that programs use to ask for things | The same as any web API you know |
| **Argo CD / Flux** | Robots that copy what is written in git into the cluster, and keep it matching | An automatic deployment pipeline that never stops checking |
| **BGP** | The language routers use to tell each other where addresses live | How the internet itself finds its way |
| **BIRD** | A program that speaks BGP on our servers | A software router |
| **Cilium** | Our network plugin: connects, secures and load-balances app traffic | Network team + firewall + load balancer, built in |
| **Cluster** | A group of servers that Kubernetes manages as one | A server farm |
| **Cluster Mesh** | Joining several clusters so they act like one | Linking two data centers |
| **CNCF** | The foundation that owns Kubernetes and many related projects | A neutral standards body |
| **Container** | An app sealed in a box with everything it needs to run | A website + IIS + .NET, packaged together |
| **Controller** | A program that keeps reality matching a record | A thermostat |
| **CoreDNS** | Automatic name lookup inside the cluster | Windows DNS Server, but self-updating |
| **CRD** | A definition of a new kind of record | A new collection in Payload CMS |
| **Crossplane** | Creates cloud resources from Kubernetes records | A remote control for Azure, AWS and Google Cloud |
| **CSI** | The standard plug for storage | Drivers for a SAN |
| **Custom resource** | One record of a custom kind | One entry in a Payload collection |
| **Deployment** | "Keep N copies of this app running, at this version" | An IIS site + app pool, with someone watching it |
| **Desired state** | Describing the result you want, not the steps | Setting a thermostat to 70°F |
| **Docker** | A tool for building and running containers on one machine | (Not needed to use Kubernetes) |
| **Docker Swarm** | Docker's own way to run containers on several servers | A simple web farm: runs apps, but can't be taught new things |
| **etcd** | The built-in database where every record is kept | The Windows Registry, replicated and made bulletproof |
| **Envoy Gateway** | Our front door for traffic from the internet; its filters handle HTTPS, logins and limits | IIS with ARR and authentication modules, in front of every site |
| **Gateway API** | The modern way to let outside traffic in | IIS bindings + ARR, as records |
| **Ingress** | The older way to let outside traffic in | Same as above, the previous generation |
| **k3s** | Small, lightweight Kubernetes for edge sites | Windows Server Core for small branch offices |
| **Kata Containers** | Runs a risky container inside its own small virtual machine | Hyper-V isolation for Windows containers |
| **KRO / Resource Graph Definition** | A recipe that creates a new kind of record out of existing ones, no code | A SQL view or stored procedure anyone can write |
| **Kubernetes** | An API that runs software and can be taught new things | A tireless operations team with one front door |
| **KubeVirt** | Runs virtual machines inside Kubernetes | Hyper-V, managed by the same API |
| **LoadBalancer** | A public or private address that spreads traffic over copies of an app | An F5 or Windows NLB |
| **mTLS** | Both sides of a connection prove who they are with certificates | A secure handshake in both directions |
| **Namespace** | A folder that groups records, per team or customer | A separate site or server per client |
| **NixOS** | Linux where the whole server is described in text files | A server image + Group Policy, in one document |
| **Node** | One server in the cluster | One server in the farm |
| **North-south / east-west** | Traffic in and out of the cluster / traffic between apps inside it | Internet-facing traffic / LAN traffic |
| **OpenEBS** | Storage built from our servers' own disks | A SAN without buying a SAN |
| **OpenTofu** | An open, foundation-owned tool for creating cloud infrastructure | Terraform, without the license risk |
| **Operator** | A CRD + controller that does an expert's job, 24/7 | A DBA in a box |
| **Pod** | One running copy of an app | A running w3wp.exe process |
| **RKE2** | Security-hardened Kubernetes for production | Windows Server Datacenter edition |
| **Secret** | A password, key or certificate stored safely | Windows Credential Manager |
| **Service** | A stable name for a group of app copies | A DNS name behind a load balancer |
| **WireGuard** | A fast, modern encrypted tunnel between servers | A site-to-site VPN |
