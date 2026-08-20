# Delquro Labs — Brand Asset Suite

All assets in this folder are derived from the master logo (`../logo.png`) and
re-drawn as vectors so they stay crisp at any size.

## Colors

| Token | Hex | Use |
| --- | --- | --- |
| Brand cyan | `#4FBFD0` | Mark, accents, primary buttons |
| Cyan soft | `#7AD3E0` | Gradient highlight |
| Cyan deep | `#2F9FB4` | Gradient shadow, light-mode text accent |
| Brand navy | `#122B4A` | Wordmark on light backgrounds |
| Navy deep | `#0A1729` | App icon background, dark surfaces |
| Page dark | `#0A1420` | Dark theme background |

## Files

| File | Purpose |
| --- | --- |
| `logo-mark.svg` / `.png` | The "D + spark" mark on its own. Favicons, avatars, stamps. |
| `wordmark.svg` | "Delquro Labs" type only, navy — for light backgrounds. |
| `wordmark-light.svg` | Wordmark in off-white — for dark backgrounds. |
| `logo-lockup.svg` / `.png` | Full horizontal lockup (mark + navy wordmark). |
| `logo-lockup-light.svg` / `.png` | Full lockup with off-white wordmark, for dark backgrounds. |
| `logo-lockup-mono.svg` | Single-colour lockup using `currentColor`. Print, stamps, one-colour use. |
| `app-icon.svg` | Rounded-square app icon: cyan mark on a navy gradient. |
| `app-icon-192.png`, `app-icon-512.png` | PWA icons (referenced by `site.webmanifest`). |
| `apple-touch-icon.png` | 180×180 iOS home-screen icon. |
| `favicon-16.png`, `favicon-32.png` | Source PNGs for `../favicon.ico`. |
| `og-image.svg` / `.png` | 1200×630 social sharing card. |

## Usage notes

- In HTML the header and footer use `<picture>` with a
  `media="(prefers-color-scheme: dark)"` source, so the correct wordmark
  variant is chosen automatically.
- Keep clear space around the lockup equal to the height of the mark's
  counter (roughly 25% of the mark height).
- Do not recolor the mark outside the palette above, stretch it
  non-proportionally, or place the navy wordmark on dark backgrounds.
- `logo.png` at the repo root is the original master artwork; keep it as the
  source of truth if the suite ever needs to be regenerated.
