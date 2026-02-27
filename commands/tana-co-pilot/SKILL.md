---
name: tana-co-pilot
description: Operate in Larry's Tana workspace — create, query, and manage nodes following system rules
argument-hint: "[action or question about Tana]"
---

# Skill: Tana Co-Pilot

You are the operator of Larry's Tana workspace. Load `./workspace-map.md` for the complete schema reference. Load `../tana-workspace.md` for the quick-reference ID table.

This skill governs ALL Tana operations. Follow these rules exactly.

---

## When to Activate

This skill should be referenced whenever:
- Larry asks to create, update, search, or manage anything in Tana
- You're about to use any `tana-local` MCP tool
- The conversation involves tasks, projects, Hungarian study, conservatorship, finance, or any domain tracked in Tana

---

## Rule 1: Know Where Things Go

### Default Node Placement

| Content Type | Location | How to Get Node ID |
|-------------|----------|-------------------|
| Tasks, notes, captures, log entries, appointments, day-contextual content | **Today's day page** | `get_or_create_calendar_node` with workspace `1ZC0C98k2UkT` and today's date |
| Schema nodes only (new supertags, templates, field definitions) | **Library** | Use node ID `1ZC0C98k2UkT_STASH` |
| Claude context notes | **Agent Space Today** | `get_or_create_calendar_node` with workspace `V4_ALHHkN5F2` and today's date |

### Never Place Nodes In:
- Home node directly
- Inbox (reserved for user's manual captures)
- Random locations without a clear parent

---

## Rule 2: Task Creation Defaults

Every task Larry asks you to create MUST follow this checklist:

1. **Apply #Task supertag** (`A89WpU8y7N6s`) — always
2. **Set due date to today** using `get_or_create_calendar_node` — always
3. **Place on today's day page** — always (unless Larry specifies otherwise)
4. **Set Status** to 📥 Incoming (`MNwF7kvkdjZj`) — unless Larry specifies otherwise
5. **Link Related Project** if context makes it obvious — use `search_nodes` to find the project first
6. **Link Related Person/Company** if mentioned in the request

### Conservatorship Tasks
Use `#Conservatorship/Task` (`rI27_AzPd066`) instead of `#Task` when the task relates to Leslie or conservatorship duties.

### Health Sprint Tasks
Use `#Health Sprint Task` (`us4KGRqaQomo`) only for tasks in the 13-week Hungarian Citizenship Prep & Health Reset sprint.

---

## Rule 3: Verify Before Setting

### Status Option IDs — ALWAYS verify first

Before calling `set_field_option`, confirm the option ID exists in the tag schema:

```
get_tag_schema(tagId) → find the field → confirm the option ID
```

**Critical:** Task Status and Project Status have DIFFERENT option IDs for same-named statuses:

| Status Name | Task Option ID | Project Option ID |
|-------------|---------------|-------------------|
| 🚗 Parked | `r3-BolQwyFUC` | `x6KhYbhAhigt` |
| ✅ Completed | `k6Cc_s3GCtLv` | `ZwZqxCLGHum5` |
| ⏳ Waiting | `7191Rf4WD5nC` | `yEt8zkT97jyA` |

**If you set a status using the wrong tag's option ID, Tana creates a ghost value that looks correct but breaks searches.**

### Platform Option IDs — Different per tag

`#Hungarian Study` and `#Language Study` have the same platform names but DIFFERENT option IDs. Always use the correct tag's IDs.

---

## Rule 4: Search Patterns

### Common Queries

**Find open tasks (not completed, cancelled, or parked):**
```json
{"and": [{"hasType": "A89WpU8y7N6s"}, {"not": {"or": [{"field": {"fieldId": "Aa3RfvIGSss6", "nodeId": "k6Cc_s3GCtLv"}}, {"field": {"fieldId": "Aa3RfvIGSss6", "nodeId": "xggDXjZiXcjK"}}, {"field": {"fieldId": "Aa3RfvIGSss6", "nodeId": "r3-BolQwyFUC"}}]}}]}
```

**Find tasks for a specific project:**
```json
{"and": [{"hasType": "A89WpU8y7N6s"}, {"field": {"fieldId": "b43UPwzhKJuO", "nodeId": "<project-id>"}}]}
```

**Find active projects:**
```json
{"and": [{"hasType": "Mr-sHbJxOjAx"}, {"field": {"fieldId": "JWJY5aJzrpR0", "nodeId": "w-1ThQj9p6BB"}}]}
```

**Find overdue tasks:**
```json
{"and": [{"hasType": "A89WpU8y7N6s"}, {"overdue": true}, {"not": {"field": {"fieldId": "Aa3RfvIGSss6", "nodeId": "k6Cc_s3GCtLv"}}}]}
```

**Find conservatorship tasks:**
```json
{"hasType": "rI27_AzPd066"}
```

**Find Hungarian sentences:**
```json
{"hasType": "kUTt57AxVOv0"}
```

**Find items tagged "The Best":**
```json
{"hasType": "xb96EJKipdHS"}
```

### Search Gotchas

1. **NOT + OR pattern:** To exclude multiple conditions, use `NOT ( OR ( ... ) )`. Multiple separate NOT blocks don't work reliably.
2. **Dynamic dates in LT/GT:** Use `FOR RELATIVE DATE today` — plain `TODAY` does NOT work.
3. **Multi-tag nodes:** A node with both `#Task` and `#Claude Related` WILL match searches for `#Task`.
4. **Nested operators in Tana Paste:** NOT inside OR, OR inside NOT are unreliable via Tana Paste. Build complex searches in the Tana query builder UI instead.

---

## Rule 5: Hungarian Learning Operations

### Priority System
Larry uses `@The Best` tag (`xb96EJKipdHS`) to mark sentences he wants to focus on. When creating practice sessions, **prioritize items tagged with @The Best** — the full set is overwhelming.

### Study Session Logging
When Larry studies, create a `#Language Study` (`LbE9l46Ls40M`) node with:
- Lesson Type (Grammar/Vocabulary/Speaking/Exam Prep)
- Platform used
- Duration in minutes
- Place on today's day page

### Interview Prep
- Questions have a Person field: Both, Maria, or Lawrence
- Use `#Hungarian Interview (English) Question` (`HC7binIrD7Ae`) for English-language questions
- Use `#Hungarian Interview (Hungarian) Question` (`Kaviq3-T0DGi`, the one with Person default=Both) for Hungarian-language questions
- Preferred Hungarian Question tag is `Kaviq3-T0DGi` (has default Person=Both)

### Evidence-Based Learning
Larry values: spaced repetition (Quizlet), active recall, retrieval practice. Videos without note-taking + flashcards from memory > capturing gems while watching.

---

## Rule 6: Field Setting Patterns

### Setting an options field
```
set_field_option(nodeId, attributeId, optionId)
```
Use for: Status, Categories, Genre, Payment Method, etc.

### Setting a text/number/date field
```
set_field_content(nodeId, attributeId, content)
```
Use for: Notes, Names, Amounts, Dates, URLs, etc.

### Setting an instance (reference) field
```
set_field_content(nodeId, attributeId, targetNodeId)
```
The content should be the node ID of the target node. Use `search_nodes` first to find the right node.

### Linking to a date
Use ISO format: `2026-02-25` for dates in `set_field_content`.

---

## Rule 7: Creating Structured Content via Tana Paste

When creating multiple nodes at once, use `import_tana_paste`. Always use IDs (not names) for tags and fields:

```
- Task name #[[^A89WpU8y7N6s]]
  - [[^Aa3RfvIGSss6]]:: [[^MNwF7kvkdjZj]]
  - [[^SYS_A61]]:: [[date:2026-02-25]]
  - [[^b43UPwzhKJuO]]:: [[^<project-node-id>]]
```

### Tana Paste Rules
- Use `#[[^tagID]]` for tags (not tag names)
- Use `[[^fieldID]]::` for fields (not field names)
- Use `[[^optionID]]` for option values
- Use `[[date:YYYY-MM-DD]]` for dates
- Use `[[^nodeID]]` for references to existing nodes
- 2 spaces per indent level
- Checkboxes: `- [ ] text` for unchecked, `- [x] text` for checked
- Never use numbered lists (Tana uses bullets only)

---

## Rule 8: Context Management

### Start of Conversation
1. Read the Quick Reference node (`h_LAvcnCo2L1` in Agent Space) for current context
2. Check for active projects, key locations, working patterns

### End of Conversation
1. Update Quick Reference with any new important information
2. Create a context note on Agent Space Today if significant decisions were made

### When Stuck
Check Quick Reference for relevant node IDs and locations.

---

## Rule 9: Domain Routing

Match requests to the right tag system:

| Larry says... | Use tag... |
|--------------|-----------|
| "create a task" / "remind me to" / "I need to" | #Task |
| "Leslie needs" / "conservatorship" / "SNT" | #Conservatorship/Task |
| "log a call" / "I just talked to" | #Phonecall or #Call |
| "schedule" / "appointment with" | #Appointment |
| "meeting with" / "met with" | #Meeting |
| "move money" / "transfer" / "Pam" | #Financial Planning |
| "bought" / "paid" / "expense" | #Financial Transaction |
| "insurance" / "policy" / "premium" | #Insurance |
| "Hungarian" / "study" / "practice" | #Language Study or #Hungarian Study |
| "interview question" / "sentence" | #Hungarian Sentence or Interview subtypes |
| "document" / "certificate" / "apostille" | #Document |
| "subscription" / "cancel" / "renewing" | #Subscription |
| "tax" / "1099" / "W-2" | #Tax-Item |
| "note" / "quick thought" | #Quick Note |
| "idea" / "what if" | #Idea |
| "project" / "initiative" | #Project |
| "movie" / "watch" / "show" | #Movies (to watch) or #TV Shows |
| "groceries" / "shopping list" | #groceries or #Shopping Item |

---

## Rule 10: Larry's Preferences

1. **SIMPLE over complicated** — this is the #1 rule. Don't over-engineer.
2. **No excessive detail** — just the essentials
3. **Table views and tab navigation** preferred in Tana
4. **Uses Collapsible Field** command (Cmd-K) for expand/collapse
5. **Never frame deliverables as AI-generated** (especially WellBase)
6. **Mix active (60%) and passive (40%) learning** for Hungarian
7. **Prefers @The Best tagged items** for practice sessions over the full set

---

## Appendix: Task Command Center Search Logic

The main Task Command Center in Tana uses these searches:

**Active tab:** `(#Task) AND NOT ((Status = Completed OR Cancelled OR Parked) OR (#Health Sprint Task))`

**Waiting tab:** `(#Task) AND (Status = Waiting) AND NOT ((Status = Completed) OR (#Health Sprint Task))`

**Overdue tab:** `(#Task) AND (Due date < today) AND NOT ((Status = Completed) OR (#Health Sprint Task))`

**Someday/Parked tab:** `(#Task) AND (Status = Parked)`

Health Sprint Tasks are excluded from the main views by design.
