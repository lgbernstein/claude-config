# Larry's Workspace Context

## Key People

| Person | Role | Notes |
|--------|------|-------|
| Pam Chen | Financial Advisor (Refresh Investments) | Manages Larry & Leslie's accounts. Email her to move funds between accounts (e.g., Leslie's Schwab → Chase). |
| David Noma | Home Insurance Agent | Handles homeowners, umbrella, auto policies. |
| Leslie Bernstein | Larry's disabled sister | Larry is her conservator. Has Schwab + Chase accounts. |
| Peter Zambrano | Sales Director, WebMD Health Services | Primary WellBase stakeholder. See WellBase section for full details. |

---

## Tech Infrastructure

- **Mac Mini (100.116.70.17):** Docker, Ollama, local LLMs. Hosts the WellBase/CIA Postgres DB (`form5500-db` container). SSH accessible from iMac — see WellBase section for connection details.
- **iMac:** Larry's primary workstation (where Claude Code runs)
- **Voicebox:** Local TTS app (voicebox.sh) — open source, runs locally, exploring for Hungarian pronunciation practice

---

## Working Style & Preferences

- **Be proactive:** When you notice Larry repeating himself or establishing a pattern, suggest saving it to CLAUDE.md so future sessions remember it
- **Have fun:** Keep the tone conversational and human. Don't be stiff or overly formal.
- **Keep it simple:** Larry prefers SIMPLE over complicated. Don't over-engineer solutions.

---

## Tana MCP Integration

Tana local MCP is available when Tana desktop is running. Use tana-local tools to read/write to the workspace.

**Workspace ID:** `1ZC0C98k2UkT` (Home)

**Agent Space Workspace ID:** `V4_ALHHkN5F2`

**IMPORTANT:** Use the **Today page** in Agent Space for context notes. At the start or end of each conversation, create a note on Today to capture:
- Key decisions made
- Important context to remember
- What worked / didn't work
- Larry's preferences (he prefers SIMPLE, not complicated)

Use `get_or_create_calendar_node` with the Agent Space workspace ID and current date to access Today. This keeps Agent Space clean and organized.

**DEFAULT NODE LOCATION:** When creating new nodes in Tana, use these rules:
- **Today/day page** (default): tasks, notes, captures, log entries, appointments, and any time-contextual content. Use `get_or_create_calendar_node` with workspace ID `1ZC0C98k2UkT` and today's date.
- **Library** (`1ZC0C98k2UkT_STASH`): structural/schema nodes only — new supertags, templates, field definitions.

**TASK CREATION DEFAULTS:** When Larry asks to create a task in Tana:
- Always apply the `#Task` supertag (id: `A89WpU8y7N6s`)
- Always set the due date to **today** using `get_or_create_calendar_node`
- Place the task on today's day page (default node location)

**Quick Reference Node ID:** `h_LAvcnCo2L1` (in Agent Space)

**WORKFLOW:**
- **At conversation start:** Read the Quick Reference node to get current context (active projects, key locations, important patterns)
- **At conversation end:** Update the Quick Reference node with any new important information
- **When stuck:** Check Quick Reference for relevant node IDs and locations

This node contains: Active projects and their status, Key node IDs and locations across workspaces, Larry's preferences and working patterns, Important resources and Tana best practices.

---

## Tana Task/Project System

### Structure

```
#Project (id: Mr-sHbJxOjAx)
    ├── Categories: Personal, AI Experiment, Finance, Leslie Related, Work
    ├── Project Status: 💡Idea → 🚧Not Started → 📆Planning → 🏭Active → 🏗️In Progress → 🏃Ongoing → ⏳Waiting → ✅Completed
    ├── Tasks field (links to #Task instances)
    ├── Due date
    └── Archived? checkbox

#Task (id: A89WpU8y7N6s) extends #task (base)
    ├── Status: 📥Incoming → 📆Planning → 🏗️In Progress → ⏳Waiting → ✅Completed → 🚫Cancelled → 🚗Parked
    ├── Related Project (links to #Project)
    ├── Related Company, Person, Place
    ├── Due date
    └── Delegate To, Notes, Attachments
```

### Key IDs (most-used — full tables in `~/.claude/tana-ids.md`)

| Element | ID |
|---------|-----|
| Task tag | `A89WpU8y7N6s` |
| Project tag | `Mr-sHbJxOjAx` |
| Task Status field | `Aa3RfvIGSss6` |
| Project Status field | `JWJY5aJzrpR0` |
| Related Project field | `b43UPwzhKJuO` |
| Due date field | `SYS_A61` |
| Completed (Task) | `k6Cc_s3GCtLv` |
| Completed (Project) | `ZwZqxCLGHum5` |
| Active (Project) | `w-1ThQj9p6BB` |

For all status option IDs, category IDs, Hungarian IDs, Conservatorship IDs, People/Org tag IDs, and other tag IDs, see `~/.claude/tana-ids.md`.

---

## Hungarian Learning System

Larry is learning Hungarian for citizenship interview purposes. The system tracks sentences, vocabulary, and interview Q&A.

### Structure

```
#Hungarian Sentence (id: kUTt57AxVOv0)
    ├── English Translation, Hungarian Translation
    ├── Hungarian Answer / English Answer
    └── Hungarian Grammar (notes)

#Hungarian Item (id: rj8BYIb0imfj)
    ├── Item Type: 📕Text, 📝Cheatsheet, 🏛️History, 🎉Holiday, 🧑🏼‍🦰Important Person
    ├── English Translation
    └── Hungarian Grammar

#Hungarian Interview (English) Question (id: HC7binIrD7Ae) extends #Hungarian Sentence
    ├── Person: Both, Maria, Lawrence
    └── English Answer

#Language Study (id: LbE9l46Ls40M)
    ├── Lesson Type: Grammar, Vocabulary, Speaking, Exam Prep
    ├── Completed checkbox
    └── Next Review date
```

All Hungarian IDs → `~/.claude/tana-ids.md`

---

## Conservatorship System

Manages conservatorship responsibilities for Leslie. Tags: `#Conservatorship/Person`, `#Conservatorship/Entity`, `#Conservatorship/Task` (extends #Task), `#Conservatorship/Log`.

All Conservatorship IDs → `~/.claude/tana-ids.md`

---

## WellBase Project System

WellBase - a work project tracking brokers, consultants, companies, vendors, wellness offerings, and events. (Previously called CIA / Company Intelligence Automation.)

**Project directory:** `~/Documents/WellBase/` (has its own CLAUDE.md with full details)

### Stakeholder: Peter Zambrano

- **Contact:** pjzambrano@gmail.com, 612-868-6563
- **Role:** Sales Director at WebMD Health Services — sells Wellness & Well-Being Benefits packages to large employers
- **Territory (18 states):** CO, ID, IL, IN, IA, KS, KY, MI, MN, MO, MT, NE, NY, ND, OH, SD, WI, WY
- **What he values most:** Current wellness vendor, current broker, decision-maker contacts with human names (not just firm names)
- **Key flags:** Self-funded companies preferred. Never frame deliverables as AI-generated.
- **Team:** Has a BDR for territory development

### WellBase Postgres Database (Read-Only Access)

The data lives in a Postgres database on the Mac Mini, running in Docker.

**Connection:**
```bash
ssh 100.116.70.17 "export PATH=/usr/local/bin:/opt/homebrew/bin:\$PATH && docker exec form5500-db psql -U larry -d form5500 -c \"<SQL>\""
```

**Helper script** (create at session start if needed):
```bash
cat << 'EOF' > /tmp/pgquery.sh
#!/bin/bash
ssh 100.116.70.17 "export PATH=/usr/local/bin:/opt/homebrew/bin:\$PATH && docker exec form5500-db psql -U larry -d form5500 -c \"$1\""
EOF
chmod +x /tmp/pgquery.sh
# Usage: /tmp/pgquery.sh "SELECT count(*) FROM entity_master;"
```

**NOTE:** Docker isn't in default SSH PATH — must export `/usr/local/bin:/opt/homebrew/bin` or the command fails with "docker: command not found".

**Key Tables (134 total):**

| Table | Rows | Purpose |
|---|---|---|
| `f5500_filing` | ~2.9M | Raw Form 5500 filings |
| `entity_master` | ~1,591 | Classified entities (vendors, EAPs, brokers, wellness) |
| `workset_companies` | 162 | Target company list |
| `vendor_evidence` | 67 | Verified vendor-employer evidence |
| `vendor_employer_intel` | small | Vendor-employer relationships with confidence scores |

**Other notable tables:** `f5500_sched_c_*` (broker commissions), `f5500_schedule_a` (insurance), `entity_alias_map` / `broker_alias_map` / `company_alias_map` (name resolution), `broker_parent_rollup` (corporate families), `competitive_intel`, `pete_report_prefs`.

**Excel Export:** `~/Desktop/Company_Wellness_Info_1.xlsx` — 138 companies × 30 columns (Feb 2026)

WellBase Tana IDs → `~/.claude/tana-ids.md`

---

## Common Queries

**Find open tasks:**
```json
{"and": [{"hasType": "A89WpU8y7N6s"}, {"not": {"field": {"fieldId": "Aa3RfvIGSss6", "nodeId": "k6Cc_s3GCtLv"}}}]}
```

**Find tasks for a project:**
```json
{"and": [{"hasType": "A89WpU8y7N6s"}, {"field": {"fieldId": "b43UPwzhKJuO", "nodeId": "<project-id>"}}]}
```

**Find active projects:**
```json
{"and": [{"hasType": "Mr-sHbJxOjAx"}, {"field": {"fieldId": "JWJY5aJzrpR0", "nodeId": "w-1ThQj9p6BB"}}]}
```

**Find Hungarian study items:**
```json
{"hasType": "kUTt57AxVOv0"}
```

**Find conservatorship tasks:**
```json
{"hasType": "rI27_AzPd066"}
```

---

## Tana Lessons Learned

### Search Node Gotchas

**Status option IDs must exist before use**
- NEVER set a field to a status option ID unless you've verified it exists in the tag schema first
- Use `get_tag_schema` to confirm option IDs before calling `set_field_option`
- If you set a status using an ID that doesn't match an existing option, Tana creates a ghost value that looks correct but won't match searches
- FIX: Always re-set the status on affected nodes after the real option is confirmed

**Task Status — 🚗 Parked is a Task status option (not just Project)**
- Parked option ID for Task Status: `x6KhYbhAhigt`
- Must exist in the Task tag schema options before using it

### Search Filter Logic

**NOT + OR pattern for exclusions**
- To exclude multiple conditions, use: `NOT ( OR ( condition1, condition2 ) )`
- DO NOT use multiple separate NOT blocks — they don't work reliably

**Dynamic date in LT/GT — use FOR RELATIVE DATE**
- `TODAY` as plain text does NOT work in LT/GT
- Correct syntax: `FOR RELATIVE DATE today`
- Example: `LT: Due date: FOR RELATIVE DATE today`

**Multi-tag nodes in searches**
- A node with BOTH `#Task` AND `#Claude Related` WILL match a search for `#Task`
- If a multi-tag node isn't showing up, check for STATUS option mismatch (see above)

### Task Command Center — Current Search Logic

**Active tab:** `(Tagged:Task) AND (NOT ((Status MATCHES ANY OF ✅ Completed, 🚫 Cancelled, 🚗 Parked) OR (Tagged:Health Sprint Task)))`

**Waiting tab:** `(Tagged:Task) AND (Status==⏳ Waiting) AND (NOT ((Status==✅ Completed) OR (Tagged:Health Sprint Task)))`

**Overdue tab:** `(Tagged:Task) AND (Due date < FOR RELATIVE DATE today) AND (NOT ((Status==✅ Completed) OR (Tagged:Health Sprint Task)))`

**Someday/Parked tab:** `(Tagged:Task) AND (Status==🚗 Parked)`

### Tana Paste Search Syntax Tips
- Nested operators (NOT inside OR, OR inside NOT) are unreliable via Tana Paste
- For complex search logic, build it manually in the Tana query builder UI instead
- Simple searches (single tag, single field) work fine via Tana Paste
