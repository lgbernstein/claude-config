# Style Presets

The default template uses **Outfit** font with warm tinted neutrals. The template automatically supports light/dark themes via `prefers-color-scheme` and includes a color picker with 12 Tana supertag colors.

**These are safe starting points.** Users can request any style — different fonts, custom colors, gradients, dark themes, brutalist layouts, whatever they want. Don't limit suggestions to presets.

---

## Default Colors

### Light Theme
| Variable | Value | Purpose |
|----------|-------|---------|
| `--bg` | `#f8f6f3` | Page background (warm off-white) |
| `--bg2` | `#fffefa` | Slide background |
| `--c1` | `#1a1816` | Headlines (warm black) |
| `--c2` | `#6b635a` | Body text (warm gray) |
| `--acc` | `#0066ff` | Accent (user-changeable) |

### Dark Theme
| Variable | Value | Purpose |
|----------|-------|---------|
| `--bg` | `#141210` | Page background |
| `--bg2` | `#1c1a17` | Slide background |
| `--c1` | `#f5f3f0` | Headlines |
| `--c2` | `#9a928a` | Body text |

---

## Tana Accent Colors

Available in the built-in color picker:

```
#d1086d  Pink
#a60717  Red
#ff9100  Orange
#d48c0d  Amber
#d6ba04  Yellow
#9db325  Lime
#1dbf8c  Teal
#0558ab  Navy
#0066ff  Blue (default)
#4303a8  Indigo
#8b299e  Purple
#f750d3  Magenta
```

---

## Purpose-Based Defaults

When generating, pick accent color based on purpose:

| Purpose | Suggested Accent |
|---------|------------------|
| Pitch/Sales | `#0066ff` Blue or `#a60717` Red |
| Teaching | `#0066ff` Blue or `#1dbf8c` Teal |
| Reports | `#0558ab` Navy or `#1dbf8c` Teal |
| Creative | `#8b299e` Purple or `#d1086d` Pink |
| Warning/Urgent | `#ff9100` Orange or `#a60717` Red |

---

## Style Adjustment Patterns

When user asks for changes:

**"More bold/dramatic"**
- Increase heading sizes in `:root`
- Darker backgrounds
- Slower animations: change `.28s` to `.4s`

**"More minimal/clean"**
- Increase `--pad` value
- Lighten `--c2`
- Faster animations: change `.28s` to `.2s`

**"More playful/warm"**
- Switch font to Plus Jakarta Sans or Nunito
- Add warmer tint to background colors

**"More corporate/professional"**
- Switch font to Source Sans 3 or DM Sans
- Use navy/teal accents instead of bright blue

---

## Custom Fonts

To use a different font, replace the Google Fonts link and `--font` variable:

```html
<link href="https://fonts.googleapis.com/css2?family=YourFont:wght@400;500;600;700&display=swap" rel="stylesheet">
```

```css
--font:'YourFont',system-ui,sans-serif;
```

Good alternatives to Outfit:
- **DM Sans** — Clean, geometric
- **Plus Jakarta Sans** — Modern, friendly
- **Manrope** — Geometric, warm
- **Source Sans 3** — Neutral, professional
