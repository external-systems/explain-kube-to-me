# Docs settings that differ from the org defaults (pkgs flakeModules.docs).
# The look, Mermaid, emoji, speaker sync and the sketch diagrams all come
# from the org style; this deck adds only its own blocks (custom.css).
{
  perSystem.docs = {
    repo = "explain-kube-to-me";

    settings = {
      site_name = "Kubernetes, The Extensible API";
      site_description = "A Platform that Develops itself. Kubernetes explained in plain language.";
      nav = [
        {"Start here" = "index.md";}
        {"The presentation" = "presentation.md";}
        {"1. The big idea" = "big-idea.md";}
        {"2. First, a reliable database" = "database.md";}
        {"3. Kubernetes is an API" = "api.md";}
        {"4. Teaching the API new tricks" = "extending.md";}
        {"5. The plumbing comes free" = "plumbing.md";}
        {"6. Community and ownership" = "community.md";}
        {"7. Our platform" = "our-platform.md";}
        {"8. Example, Payload CMS sites" = "payload-sites.md";}
        {"Plain-language dictionary" = "dictionary.md";}
      ];
    };

    # Route pills, the route anatomy, kinds of record, CNCF levels.
    slides.extraHead = ''<link rel="stylesheet" href="custom.css" />'';
  };
}
