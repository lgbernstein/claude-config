# Tana Workspace Map

Last verified: 2026-02-05

## Workspaces

| Workspace | ID | Home Node |
|-----------|-----|-----------|
| Home | `1ZC0C98k2UkT` | `sZY5O2fP6NVV` |
| Test Templates | `5m4v1f8_3neP` | `-_2dA8xXezQL` |

## Structural Nodes

| Node | ID | Notes |
|------|-----|-------|
| Home | `sZY5O2fP6NVV` | Top of tree |
| Inbox | `1ZC0C98k2UkT_CAPTURE_INBOX` | Deterministic: `{workspaceId}_CAPTURE_INBOX` |
| Library | `1ZC0C98k2UkT_STASH` | Deterministic: `{workspaceId}_STASH` |
| Daily Notes | `3iNKKhbFzsPF` | Contains year nodes (2025, 2026) |
| 2026 Daily | `uw7Z6skaV8DG` | Week-based structure (Week 01-06 so far) |
| Today (2026-02-05) | `RfsoSOaWdiP9` | Via `get_or_create_calendar_node` |

## Home Node Tree (depth 1)

```
Home (sZY5O2fP6NVV)
├── Inbox (1ZC0C98k2UkT_CAPTURE_INBOX)
├── Daily notes (3iNKKhbFzsPF)
│   ├── 2025 (uf_K56whMX9b)
│   └── 2026 (uw7Z6skaV8DG) → Week 01..06 → Day nodes
├── Setup (7jb6KQi7dRiq)
├── The Live Search Starter Guide (O3KCvSPcRpr6)
└── The Commons (OEKC08p5lSWI)
```

---

## Core Supertags (Active Systems)

### Task/Project System

**#Task** (`A89WpU8y7N6s`) extends `#task` base (`SYS_T100`)

| Field | ID | Type |
|-------|-----|------|
| Status | `Aa3RfvIGSss6` | Options (default: Incoming) |
| Related Project | `b43UPwzhKJuO` | Instance |
| Related Company | `lWpJWh8M768Q` | Instance |
| Related Person | `2t2RtOQn9Ol_` | Instance |
| Related Place | `-bcnqgZS8vHK` | Instance |
| Topic | `ZcdvsN8Ei3-T` | Instance |
| Due date | `SYS_A61` | Date |
| Delegate To | `48Izbx6XiXiA` | Instance |
| Phonecalls | `r-2ceffOgDZs` | Instance |
| Notes | `vJzzQh5okEhQ` | Content |
| Attachments | `cjO0hMLQF3UV` | Content |

Task Status Options:

| Status | ID |
|--------|-----|
| 📥 Incoming (default) | `MNwF7kvkdjZj` |
| 📆 Planning | `mJTE_UhtqrxF` |
| 🏗️ In Progress | `4XESx6T9pVhj` |
| ⏳ Waiting | `7191Rf4WD5nC` |
| ✅ Completed | `k6Cc_s3GCtLv` |
| 🚫 Cancelled | `xggDXjZiXcjK` |

---

**#Project** (`Mr-sHbJxOjAx`)

| Field | ID | Type |
|-------|-----|------|
| Project Status | `JWJY5aJzrpR0` | Options |
| Categories | `_hfg7BaHG1uq` | Options |
| Related Projects | `n3YFBINTxPnP` | Instance |
| Tasks | `Z3zjDKvJXGkk` | Instance |
| Due date | `SYS_A61` | Date |
| Resource Material | `rG_E4BqOh6w9` | Content |
| Archived? | `URrXD0CCXC5H` | Checkbox |
| Notes | `_Hf5XAxLfISS` | Content |

Project Status Options:

| Status | ID |
|--------|-----|
| 💡 Idea | `VD5_eeKDHVQv` |
| 🚧 Not Started | `uWsOohQlPrgM` |
| 📆 Planning | `2H6HcSBJE2mF` |
| 🏭 Active | `w-1ThQj9p6BB` |
| 🏗️ In Progress | `H4NuBMpg55Gj` |
| 🏃 Ongoing | `UTGIUI2fNSya` |
| ⏳ Waiting | `yEt8zkT97jyA` |
| 🛑 Cancelled | `7i_DVKjepXex` |
| 🚗 Parked | `x6KhYbhAhigt` |
| ✅ Completed | `ZwZqxCLGHum5` |

Project Categories:

| Category | ID |
|----------|-----|
| Personal | `hItRVRYS0ZsT` |
| AI Experiment | `Me5j0MLPPVpm` |
| Finance | `0-zNJxWkM1Qv` |
| Leslie Related | `qTcNGlUmYi21` |
| Work | `lEz7_1XI2VH9` |

---

### People & Organizations

**#Person** (`osBP97YsYZOx`) extends `#person` base (`SYS_T99`)

| Field | ID | Type |
|-------|-----|------|
| Title | `SLrMKsVs-dOn` | Instance |
| Company | `jGZi2l7_RcrW` | Instance |
| Email | `GY7kw3XMlkLL` | E-Mail |
| Work Phone | `0_0honkQxYRJ` | Content |
| Cell Phone | `hlzHdR8S7AJw` | Content |
| WhatsApp | `4eQUMZgJD8dA` | Content |
| Address | `NF9LPChZFRci` | Content |
| Birthday | `PaT0qmOwslqO` | Date |
| Website | `9hrkYq1qEqDM` | Content |
| Email 2 | `S8zl-MaA01MH` | E-Mail |
| Email 3 | `ZrgmFVJknRv3` | URL |

**#Company** (`GMmMalDixLze`) extends `#organization` base (`SYS_T101`)

| Field | ID | Type |
|-------|-----|------|
| Type of Company | `90-Q0dNwwjPO` | Instance |
| Related Project | `b43UPwzhKJuO` | Instance |
| Policy No | `8slJsPRi_GsP` | Content |
| Member ID | `ljhlGeXoIIls` | Content |
| Address | `NF9LPChZFRci` | Content |
| Phone Number | `HgLrl2u2ie5b` | Content |
| Fax Number | `F3M-i-RiU8-M` | Content |
| Website | `-oOn8EFmnsX1` | URL |
| Contact | `y9FfT5gzeHDF` | Instance |
| Notes | `Q4evY7YKhmMZ` | Content |
| Attachments | `cjO0hMLQF3UV` | Content |

**#Meeting** (`m5Wx9UdxArDb`) extends `#meeting` base (`SYS_T98`)

| Field | ID | Type |
|-------|-----|------|
| Description | `_pGoSkL17LfK` | Content |
| Related Project | `b43UPwzhKJuO` | Instance |
| Date | `4j_qz6af-7WQ` | Date |
| Attendees | `lmVZaKRBkA0g` | Instance |
| Meeting link | `HuFF3gzBIIvm` | URL |
| Event status | `bFiTLBV7Ylbt` | Options |
| Transcript | `QQ_PVd0QWVIJ` | Content |
| Location | `TyYixuLCvxwT` | Content |
| Discovered items | `MkqYtFTz8_It` | Content |
| Action items | `4NkKvi5bVwUk` | Instance |
| Notes | `tMBshOdUuYxn` | Content |

Event Status: Declined (`SYS_V123`), Cancelled (`SYS_V122`), Tentative (`SYS_V121`), Confirmed (`SYS_V120`)

---

### Hungarian Learning System

**#Hungarian Sentence** (`kUTt57AxVOv0`)

| Field | ID | Type |
|-------|-----|------|
| English Translation | `uzvCBKl0FAbE` | Instance |
| Hungarian Translation | `hWpbH7eSHEdW` | Instance |
| Hungarian Answer | `j9srPhFy8e1M` | Instance |
| English Answer | `AmwgZT6cA8F1` | Instance |
| Hungarian Grammar | `hqaNz9a6RK3I` | Content |

**#Hungarian Item** (`rj8BYIb0imfj`)

| Field | ID | Type |
|-------|-----|------|
| Item Type | `YY-OfkAKtgFk` | Options |
| English Translation | `uzvCBKl0FAbE` | Instance |
| Hungarian Grammar | `hqaNz9a6RK3I` | Content |

Item Types: 📕 Text (`LxKdmvRhAfPo`), 📝 Cheatsheet (`Ay5Ge9y6qk9N`), 🏛️ History (`EXsO1Cucz6jt`), 🎉 Holiday (`Mg8CrilGQGjR`), 🧑🏼‍🦰 Important Person (`bD08FbbMe5Rj`)

**#Hungarian Interview (English) Question** (`HC7binIrD7Ae`) extends #Hungarian Sentence

| Field | ID | Type |
|-------|-----|------|
| Person | `xDC-19l6BxN4` | Options: Both (`QJjeNKSXo7QB`), Maria (`1LOrNFIIALk4`), Lawrence (`OAI3p_H81LdF`) |
| English Translation | `uzvCBKl0FAbE` | Instance |
| Hungarian Grammar | `hqaNz9a6RK3I` | Content |
| English Answer | `AmwgZT6cA8F1` | Instance |

**#Hungarian Interview (Hungarian) Question** (`lem5-daflknF`) extends #Hungarian Sentence
- Same fields as English Question above
- NOTE: Duplicate tag exists with id `Kaviq3-T0DGi` (same name) — use `lem5-daflknF`

**#Hungarian Interview (English) Answer** (`zoMSTL2AYedl`) — standalone tag
**#Hungarian Interview (Hungarian) Answer** (`-3RZZqnvkh1A`) — standalone tag
**#Hungarian Facts-History-Food** (`iRh-s8a8gdZv`) — standalone tag (CLAUDE.md calls it "Hungarian Facts/History")

**#Language Study** (`LbE9l46Ls40M`)

| Field | ID | Type |
|-------|-----|------|
| Related Project | `zEtLv2na7qyQ` | Content |
| Lesson Type | `iSz3FhVYmr82` | Options |
| Completed | `JwNaeYNLP6mI` | Checkbox |
| Next Review | `qbH9rM5stOhM` | Date |

Lesson Types: Grammar (`gY9C0rPYDExF`), Vocabulary (`jp7MYm4svz37`), Speaking (`LV45L9k_dDcD`), Exam Prep (`txzJYo-6TDo1`)

---

### Conservatorship System

**#Conservatorship/Person** (`5DMQsvMy_LCp`) extends #Person

| Field | ID | Type |
|-------|-----|------|
| Company | `jGZi2l7_RcrW` | Instance |
| Role | `ydJVlEusSGe1` | Content |
| Birthday | `PaT0qmOwslqO` | Date |
| Notes | `MR9StzGH-hjm` | Content |

**#Conservatorship/Entity** (`bJEeQ_PiJl_u`)

| Field | ID | Type |
|-------|-----|------|
| Entity name | `GaftJl5HSMal` | Content |
| Type of entity | `KbkOYVI2rCkn` | Instance |
| Date established | `uXxQgRc4H8F3` | Date |
| Contact email | `09ZqxAiakAY4` | E-Mail |
| Phone number | `qBSoVEWtCiHG` | Content |
| Account number | `iWIvo_dyPgUE` | Content |
| Routing number | `zDC-7oe2AW3W` | Content |
| Contact person | `I_uQA9yuuU0y` | Instance |
| Notes | `64XC7V2H5LZY` | Content |
| Related document | `ghH2qdH8swdD` | Instance |

**#Conservatorship/Task** (`rI27_AzPd066`) extends #Task — inherits all Task fields
**#Conservatorship/Log** (`wCnp7GwrT8m-`) — no custom fields

---

### CIA Project System

**#CIA Note** (`i1L5L6cccaK4`)

| Field | ID | Type |
|-------|-----|------|
| Related Project | `b43UPwzhKJuO` | Instance |
| Last edited date | `Sits86qfjO2o` | Date |
| Summary | `YZsyShtKAetN` | Content |
| Notes | `Q4evY7YKhmMZ` | Content |

**#CIA Contract** (`cNrwr14bS6cl`) extends #CIA Note

| Field | ID | Type |
|-------|-----|------|
| Root Contract | `qTpfK3pgZioB` | Content |
| Core Decision | `Wo7Oh4p-P8zz` | Content |
| Authoritative Source | `WDsGgktGfLc0` | Content |
| Eligibility Gate | `Pksl8zRCa-ef` | Content |
| Compensation Disclosure Rules | `5-dEwBrAdwBr` | Content |
| Tiering Rules | `YPWapmBh6uDu` | Content |
| Canonical Display Format | `bmLrLPHmYakR` | Content |
| Language Discipline | `C2fOtE-FYzOl` | Content |
| Explicit Non-Goals | `HGS8jBVwr1o2` | Content |
| Stability & Change Control | `haw6vC2LuYFm` | Content |

**#CIA Objects** (`SuWn98iyAGdl`) — no custom fields
**CIA Main Project Node:** `HSezrqebE5aZ`

---

### Other Active Tags

**#Appointment** (`VCp1-yLGR2AL`)

| Field | ID |
|-------|-----|
| Contact | `GdBI2gpX2yjn` |
| Date | `SYS_A90` |
| Appt Reason | `2JzVKy5oQzdm` |
| Location | `TyYixuLCvxwT` |
| Work Phone | `0_0honkQxYRJ` |
| Email | `GY7kw3XMlkLL` |
| Preparation Needed | `ng9otTdLVcCm` |
| Related Project | `b43UPwzhKJuO` |

**#Phonecall** (`BQzrIQovU4dA`)

| Field | ID |
|-------|-----|
| Notes | `Q4evY7YKhmMZ` |
| Participants | `YiPLU12WRSrt` |
| Topic | `GyraIyM4ZsdE` |
| Tasks | `LCa2vjA8eKdG` |
| Company | `jGZi2l7_RcrW` |
| Project | `oArR7sGBo-L-` |
| Call date | `n_BIWKM10Ftj` |
| Phone Number | `HgLrl2u2ie5b` |

**#Document** (`FcQDFvba_DMb`) — has Document Type, Status, Location, Format, Authority fields (immigration docs)

**#Subscription** (`Oswj5P2M9xWb`) — tracks services, costs, dates, payment methods, status

**#Morning Brief** (`6IZCCRKKLT7C`) — no custom fields
**#Note** (`og7rUPdjmRty`) — Related Project field only
**#Quick Note** (`oOgRyu6vLtOU`)
**#Fleeting-Note** (`O0MeuEyh293x`)
**#Place** (`TiGk5rWIO7SV`) extends `#location` base
**#Conservatorship** (`EhR-MfwhnkRq`) — parent tag for the system

---

## Shared Field IDs (reused across tags)

| Field Name | ID | Used By |
|------------|-----|---------|
| Related Project | `b43UPwzhKJuO` | Task, Company, CIA Note, Document, Appointment |
| Due date | `SYS_A61` | Task, Project |
| Company | `jGZi2l7_RcrW` | Person, Conservatorship/Person, Phonecall |
| Address | `NF9LPChZFRci` | Person, Company |
| Notes | `Q4evY7YKhmMZ` | Company, CIA Note, Phonecall |
| Attachments | `cjO0hMLQF3UV` | Task, Company |
| Email | `GY7kw3XMlkLL` | Person, Appointment |
| Work Phone | `0_0honkQxYRJ` | Person, Appointment |
| Phone Number | `HgLrl2u2ie5b` | Company, Phonecall |
| Location | `TyYixuLCvxwT` | Meeting, Appointment |
| English Translation | `uzvCBKl0FAbE` | Hungarian Sentence, Hungarian Item, Interview Questions |
| Hungarian Grammar | `hqaNz9a6RK3I` | Hungarian Sentence, Hungarian Item, Interview Questions |
| English Answer | `AmwgZT6cA8F1` | Hungarian Sentence, Interview Questions |
| Birthday | `PaT0qmOwslqO` | Person, Conservatorship/Person |

---

## Common Queries

```
# Open tasks (not completed)
{"and": [{"hasType": "A89WpU8y7N6s"}, {"not": {"field": {"fieldId": "Aa3RfvIGSss6", "nodeId": "k6Cc_s3GCtLv"}}}]}

# Tasks for a specific project
{"and": [{"hasType": "A89WpU8y7N6s"}, {"field": {"fieldId": "b43UPwzhKJuO", "nodeId": "<project-id>"}}]}

# Active projects
{"and": [{"hasType": "Mr-sHbJxOjAx"}, {"field": {"fieldId": "JWJY5aJzrpR0", "nodeId": "w-1ThQj9p6BB"}}]}

# Overdue tasks
{"and": [{"hasType": "A89WpU8y7N6s"}, {"overdue": true}]}

# Recent meetings (last 7 days)
{"and": [{"hasType": "m5Wx9UdxArDb"}, {"created": {"last": 7}}]}

# Hungarian study items
{"hasType": "kUTt57AxVOv0"}

# Conservatorship tasks
{"hasType": "rI27_AzPd066"}

# Today's calendar node
Use get_or_create_calendar_node with date and granularity="day"
```

---

## CLAUDE.md Discrepancies Found

1. **Hungarian Facts tag name**: CLAUDE.md says "Hungarian Facts/History" (`iRh-s8a8gdZv`) — live data shows "Hungarian Facts-History-Food"
2. **Duplicate Hungarian Interview (HU) Question tag**: `Kaviq3-T0DGi` also exists with the same name as `lem5-daflknF` — use `lem5-daflknF`
3. **Interview Answer tags are standalone**: `zoMSTL2AYedl` and `-3RZZqnvkh1A` are full supertags, not just field IDs (CLAUDE.md lists them under "Key IDs" which could be misleading)
4. **Missing from CLAUDE.md**: #Subscription (`Oswj5P2M9xWb`), #Document (`FcQDFvba_DMb`) with full schema, #Conservatorship parent tag (`EhR-MfwhnkRq`)
5. **Task fields missing from CLAUDE.md**: Related Company (`lWpJWh8M768Q`), Related Person (`2t2RtOQn9Ol_`), Related Place (`-bcnqgZS8vHK`), Topic (`ZcdvsN8Ei3-T`), Phonecalls (`r-2ceffOgDZs`)
6. **Project fields missing from CLAUDE.md**: Related Projects (`n3YFBINTxPnP`), Resource Material (`rG_E4BqOh6w9`)

---

## Legacy Tags (Roam import / hashtags — low priority)

Approximately 80+ tags from Roam Research import: `roamcult`, `Zettelkasten`, `PKM`, `PowerBI`, `STEM`, etc. These are hashtag-style tags with no schemas, likely from Readwise/Twitter imports.
