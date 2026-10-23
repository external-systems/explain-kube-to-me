# Kubernetes, The Extensible API

## A Platform that Develops itself

!!! quote ""
    **Kubernetes is an API for running software, with a built-in way to
    teach that API new things.** Every company that adds something to it
    makes it better for everyone else, so the platform keeps improving
    underneath us without us lifting a finger.

That one paragraph is the whole idea. The rest of this site explains it
slowly, one piece at a time, using things you already know: Windows Server,
IIS, DotNetNuke, Payload CMS, SQL and APIs. Every idea is a picture, an
everyday comparison, or a web address (an HTTP route) like the ones you
already read every day. The only code is one worked example, in chapter 8.

## How to read this site

Each chapter is short and builds on the one before it. Read them in order,
or watch [the presentation](presentation.md) first and come back here when
you want more detail on a slide.

| Chapter | The question it answers |
| --- | --- |
| [1. The big idea](big-idea.md) | What are containers, and what does Kubernetes actually do with them? |
| [2. First, a reliable database](database.md) | Where does Kubernetes keep its information, and why can we trust it? |
| [3. Kubernetes is an API](api.md) | How does the API wrap that database, and why does that matter? |
| [4. Teaching the API new tricks](extending.md) | How can we add our own "endpoints" for databases, cloud servers, VMs and AI agents? |
| [5. The plumbing comes free](plumbing.md) | What do we get without building it ourselves? |
| [6. Community and ownership](community.md) | Who builds this, who owns it, and why should we trust it? |
| [7. Our platform](our-platform.md) | How do all these pieces fit together in what we run? |
| [8. Example: Payload CMS sites](payload-sites.md) | What does a real product on our API look like, from order form to bill? |

Stuck on a word? The [plain-language dictionary](dictionary.md) has every
term in one place, each with a Windows-world comparison.

## The five things to remember

<div class="grid cards" markdown>

-   :material-database:{ .lg } **It is a database first**

    Everything it knows lives in a built-in database that our apps can use
    too.

-   :material-api:{ .lg } **It is an API**

    You describe what you want, Kubernetes makes it happen and keeps it
    that way.

-   :material-puzzle-plus:{ .lg } **It is extensible**

    We can add our own types of things to that API, like adding a new
    collection in Payload CMS.

-   :material-pipe:{ .lg } **The plumbing is included**

    DNS, networking, load balancing, storage and security come in the box.

-   :material-account-group:{ .lg } **Nobody owns it alone**

    A foundation owns it, and the largest companies on earth build it
    together, in the open.

</div>
