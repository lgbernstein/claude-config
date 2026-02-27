---
name: tana-slide-deck
description: Create beautiful HTML presentations from Tana content. Generates slides fast, then iterates.
argument-hint: "[topic or Tana node]"
disable-model-invocation: true
---

# Skill: Tana Slide Deck

Create stunning, zero-dependency HTML presentations from Tana content. Generate something concrete fast, then refine through iteration.

## Philosophy

1. **Show, don't ask** — Generate slides immediately. Users react better to concrete artifacts than abstract questions.
2. **Iterate rapidly** — First version quickly. Refinements based on what they actually see.
3. **Source from Tana** — Pull real content from nodes, searches, or tagged items.
4. **Zero dependencies** — Single HTML file, runs forever.

---

## Quick Start

If user provides argument: `/tana-slide-deck "AI Strategy"` or `/tana-slide-deck my-project-node`
- Topic or description → Generate content or search Tana
- Tana node name/ID → Read with `read_node`

If no argument, proceed to Phase 1.

---

## Phase 1: Understand Intent

**Start open.** Ask naturally:

> "What would you like to create slides about? You can share a Tana node, describe a topic, or tell me what you're trying to communicate."

Let the user respond freely. Based on their response, determine:
- **Content source**: Tana node, search, topic description, or existing outline
- **Purpose**: Infer from context (pitch, teach, report, inspire)

**Use AskUserQuestion only when you need clarification**, such as:
- Ambiguous scope ("Should I include all sub-nodes or just the top level?")
- Multiple valid interpretations ("I found 3 nodes about this — which should I use?")
- Missing context ("Who's the audience for this?")

---

## Phase 2: Gather Content

Based on what the user shared:

### If they provided a Tana node
```
read_node(nodeId, maxDepth: 5)
```
Extract: title → title slide, children → slides, fields → metadata, tags → style hints.

### If they described a topic to search
Use a cheap subagent (e.g., Haiku) to search Tana:
```
search_nodes(query, limit: 20)
```
Present findings briefly, ask if they look right before proceeding.

### If they described a topic to generate
Create an outline based on their description. Confirm the structure makes sense.

### If they pasted content
Parse the structure and confirm before generating.

**Use AskUserQuestion when**:
- Search returns too many results and you need to narrow down
- The content structure is ambiguous
- You need to confirm which parts to include/exclude

---

## Phase 3: Generate Slides (Fast)

**Do not ask about style.** Pick intelligent defaults based on purpose:

| Purpose | Default Style |
|---------|---------------|
| Pitch/Sell | Dark, confident, bold typography |
| Teach/Explain | Light, clean, readable |
| Update/Report | Minimal, data-focused |
| Inspire/Story | Cinematic, atmospheric |

### File Location

Save to: `./[presentation-name].html`

Use slugified title: "Q4 Product Update" → `q4-product-update.html`

### Generate and Open

1. Create full HTML (see `html-template.md`)
2. Run `open [filename].html`
3. Tell user:

```
Your slides are ready: [filename].html

I've opened them in your browser. Navigate with arrow keys, press F for fullscreen.

This is just a starting point — everything is customizable:
- **Content**: Add/remove/reorder slides, rewrite text, change the narrative
- **Layout**: Different slide types, more/fewer cards, adjust spacing
- **Style**: Any colors, fonts, animations — not limited to presets

Tell me what to change, or describe the look you're going for.
```

---

## Phase 4: Iterate

Listen to feedback and refine. **Everything is changeable** — content, style, structure, flow.

### Content & Research

If they want more/different content:
- Search their Tana workspace for related notes, concepts, or references
- Use web search to find supporting information, quotes, or data
- Add new slides, rewrite existing ones, change the narrative arc
- Reorder slides to improve flow

Use a cheap subagent (e.g., Haiku) for Tana searches to keep iteration fast.

### Style Refinements

**If feedback is vague ("make it better"):**
- **Header:** "Improve"
- **Question:** "What aspect should I focus on?"
- Options:
  - "Visual style" — Colors, fonts, overall look
  - "Content/text" — Wording, structure, flow
  - "Animations" — Motion, transitions, timing
  - "Layout" — Spacing, arrangement, hierarchy

**If they want style changes:**
- **Header:** "Direction"
- **Question:** "What direction should I take the style?"
- Options:
  - "More bold/dramatic" — Darker, bigger type, more contrast
  - "More minimal/clean" — Simpler, more whitespace, subtle
  - "More playful/warm" — Friendlier, colorful, approachable
  - "More corporate/professional" — Conservative, trustworthy, polished

### Structure Changes

- Add/remove/reorder slides
- Change slide types (bullets → statement, grid → timeline)
- Adjust pacing and emphasis

After each change, re-open the file and ask for more feedback.

---

## Tana Content Mapping

| Tana Structure | Slide Treatment |
|----------------|-----------------|
| Root node name | Title slide |
| Root description | Subtitle |
| Top-level children | Individual slides |
| Nested children | Bullet points |
| Tags on root | Inform style choice |
| Fields | Metadata (date, author) |
| References | Links or mentioned entities |

---

## Reference Files

For implementation details, read these files in order:

1. **`html-template.md`** — Full HTML architecture and base template
2. **`style-presets.md`** — Color palettes, fonts, and theme variations
3. **`slide-types.md`** — Templates for different slide layouts

---

## Tips for Better Slides

### Content
- One idea per slide
- 6 words or fewer for headlines
- 3-5 bullets max
- Big statements > bullet lists

### Visual
- Generous whitespace
- Consistent rhythm
- Clear hierarchy (h1 > h2 > body)
- Accent color sparingly

### Animation
- Subtle > flashy
- 0.4-0.6s duration
- Stagger children
- Consistent direction

---

## When Not to Use

- Complex data visualizations → Use charting tools
- Interactive presentations → Use reveal.js
- Print handouts → Export to PDF
- Collaborative editing → Use Google Slides