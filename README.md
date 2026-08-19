# delquro-site

Marketing site for **Delquro Labs** — a static site served from GitHub Pages at
[www.delquro.com](https://www.delquro.com).

## Structure

```
index.html                 Landing page
commonwealth-connect.html  Product page
support.html               Support / contact
resources.html             Index of support + policy pages
status.html                Product status and launch countdown
privacy.html               Privacy policy
terms.html                 Terms of service
account-deletion.html      Account deletion instructions

style.css                  Design system + all page styles
responsive-base.css        Responsive foundation (imported by style.css)
site.js                    Sticky header, scroll reveals, preview tabs
site.webmanifest           PWA manifest
favicon.ico                Multi-size favicon

assets/                    Brand asset suite (see assets/README.md)
logo.png                   Master logo artwork
```

## Local preview

No build step — it is plain HTML/CSS/JS. Serve the folder with any static server:

```bash
python3 -m http.server 8080
# then open http://localhost:8080
```

## Design system

Colors, spacing, radii, and shadows are defined as CSS custom properties at the
top of `style.css`, with a `prefers-color-scheme: light` override block. Both a
dark and a light theme ship by default and follow the visitor's OS setting.

Brand colors and logo usage are documented in [`assets/README.md`](assets/README.md).

## Conventions

- Every page shares the same header, nav, and footer markup — update all pages
  together when changing them.
- Interactive enhancements live in `site.js` and degrade gracefully: content is
  fully readable and navigable with JavaScript disabled.
- Animations respect `prefers-reduced-motion`.
