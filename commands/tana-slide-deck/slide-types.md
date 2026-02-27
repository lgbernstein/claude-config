# Slide Types

Templates for different content layouts. Mix and match based on content.

---

## Title Slide

Opening or closing slide with large title and accent bar.

```html
<section class="s st"><div>
<h1 class="r">Presentation Title</h1>
<p class="sub r">Subtitle or tagline</p>
</div></section>
```

---

## Content Slide (Bullets)

Standard slide with heading and bullet points.

```html
<section class="s"><div>
<h2 class="r">Section Title</h2>
<ul>
<li class="r"><strong>First point</strong> — Supporting detail here</li>
<li class="r"><strong>Second point</strong> — Supporting detail here</li>
<li class="r"><strong>Third point</strong> — Supporting detail here</li>
</ul>
</div></section>
```

---

## Big Statement

Single impactful message, centered with gradient background. Use `<em>` for accent-colored words.

```html
<section class="s ss"><div>
<h2 class="r">A powerful statement with <em>emphasis</em> on key words.</h2>
</div></section>
```

---

## Quote

Featured quotation with large decorative quote mark and citation.

```html
<section class="s sq"><div>
<blockquote class="r">The quote text goes here. Keep it punchy and memorable.</blockquote>
<cite class="r">— Speaker Name, Role</cite>
</div></section>
```

---

## Date-Tagged Content

Use `.dt` pill for temporal context on any slide.

```html
<section class="s"><div>
<p class="dt r">January 2026</p>
<h2 class="r">Something Important Happened</h2>
<p class="r">Description of what happened at this point in time.</p>
</div></section>
```

---

## Cards (g3)

Grid of related points with staggered layout and left accent border. Use 2-4 cards based on content.

```html
<!-- 2 cards -->
<section class="s"><div>
<h2 class="r">Two Options</h2>
<div class="g3 r">
<div><h3>Option A</h3><p>Description of first option.</p></div>
<div><h3>Option B</h3><p>Description of second option.</p></div>
</div>
</div></section>

<!-- 3 cards -->
<section class="s"><div>
<h2 class="r">Three Pillars</h2>
<div class="g3 r">
<div><h3>First</h3><p>Description.</p></div>
<div><h3>Second</h3><p>Description.</p></div>
<div><h3>Third</h3><p>Description.</p></div>
</div>
</div></section>

<!-- 4 cards -->
<section class="s"><div>
<h2 class="r">Four Areas</h2>
<div class="g3 r">
<div><h3>Area 1</h3><p>Description.</p></div>
<div><h3>Area 2</h3><p>Description.</p></div>
<div><h3>Area 3</h3><p>Description.</p></div>
<div><h3>Area 4</h3><p>Description.</p></div>
</div>
</div></section>
```

---

## Two Columns (cols)

Side-by-side comparison with faded background icons. Use `data-icon` for the icon character.

```html
<section class="s"><div>
<h2 class="r">Comparison Title</h2>
<div class="cols r">
<div data-icon="~"><h3>Before</h3><p>Description of the previous state or first option.</p></div>
<div data-icon="→"><h3>After</h3><p>Description of the new state or second option.</p></div>
</div>
</div></section>
```

---

## Timeline (tl)

Horizontal timeline with numbered circles. Use `data-n` for the step number. Use 3-5 items based on content.

```html
<!-- 3 steps -->
<section class="s"><div>
<h2 class="r">Three Steps</h2>
<div class="tl r">
<div class="ti" data-n="1"><h3>Start</h3><p>Beginning phase</p></div>
<div class="ti" data-n="2"><h3>Middle</h3><p>Core work</p></div>
<div class="ti" data-n="3"><h3>End</h3><p>Completion</p></div>
</div>
</div></section>

<!-- 5 steps -->
<section class="s"><div>
<h2 class="r">The Journey</h2>
<div class="tl r">
<div class="ti" data-n="1"><h3>Phase One</h3><p>Description</p></div>
<div class="ti" data-n="2"><h3>Phase Two</h3><p>Description</p></div>
<div class="ti" data-n="3"><h3>Phase Three</h3><p>Description</p></div>
<div class="ti" data-n="4"><h3>Phase Four</h3><p>Description</p></div>
<div class="ti" data-n="5"><h3>Phase Five</h3><p>Description</p></div>
</div>
</div></section>
```

**Note:** On mobile (< 768px), timeline automatically switches to vertical layout.

---

## Number Highlight

Single metric or statistic as focal point.

```html
<section class="s ss"><div>
<p class="r" style="font-size:clamp(4rem,15vw,10rem);font-weight:700;color:var(--acc);line-height:1">73%</p>
<p class="r" style="font-size:clamp(1rem,2.5vw,1.4rem);margin-top:1rem">of users prefer this approach</p>
</div></section>
```

---

## Slide Selection Guidelines

| Content Type | Best Slide Type |
|--------------|-----------------|
| Opening/Closing | Title Slide (`.st`) |
| Key message | Statement (`.ss`) |
| List of points | Content (bullets) |
| Testimonial | Quote (`.sq`) |
| Key metric | Number Highlight |
| Features/Benefits | Cards (`.g3`) |
| Before/After | Columns (`.cols`) |
| Process/Journey | Timeline (`.tl`) |
| Dated event | Date-tagged (`.dt`) |

---

## Content Density Guidelines

Starting points — adjust based on content:

- **Title slides:** 1-2 lines title + optional subtitle
- **Bullet slides:** 3-5 bullets, each under 15 words
- **Statement slides:** Under 20 words
- **Cards:** 2-4 cards, 1-2 sentences each
- **Timeline:** 3-5 items

If content feels crowded, split into multiple slides. These are defaults — the user can request denser or sparser layouts.
