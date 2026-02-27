# Larry's Tana Workspace Map

Complete schema reference for every supertag, field, option, and relationship in Larry's Tana system.

---

## Workspaces

| Workspace | ID | Home Node | Purpose |
|-----------|-----|-----------|---------|
| Home | `1ZC0C98k2UkT` | `sZY5O2fP6NVV` | Primary workspace — all structured data lives here |
| Agent Space | `V4_ALHHkN5F2` | `d1GtioFitf0G` | Claude's workspace for context notes and quick reference |
| Readwise | `wHonjeScWb_3` | `kkCRP4dLrWq8` | Readwise sync target |
| Test Templates | `5m4v1f8_3neP` | `-_2dA8xXezQL` | Sandbox for template experiments |

### Structural Nodes (Home)

| Node | ID |
|------|-----|
| Inbox | `1ZC0C98k2UkT_CAPTURE_INBOX` |
| Library | `1ZC0C98k2UkT_STASH` |

### Agent Space Key Nodes

| Node | ID |
|------|-----|
| Quick Reference | `h_LAvcnCo2L1` |

---

## Inheritance Tree

Visual hierarchy of all tag inheritance relationships.

```
#task (base) (SYS_T100)
└── #Task (A89WpU8y7N6s)
    ├── #Conservatorship/Task (rI27_AzPd066)
    └── #Health Sprint Task (us4KGRqaQomo)

#person (base) (SYS_T99)
├── #Person (osBP97YsYZOx)
│   ├── #Doctor (CbpgRerm2nHY)
│   ├── #Family (WHIh9YNuaZjM)
│   ├── #Neighbor (ddICV86PFvh2)
│   └── #Conservatorship/Person (5DMQsvMy_LCp)
└── #Contact (xkmHSCTctjut)

#organization (base) (SYS_T101)
└── #Company (GMmMalDixLze)
    └── #Insurance (nroOC3jLs-Bb)

#location (base) (SYS_T102)
└── #Place (TiGk5rWIO7SV)

#meeting (base) (SYS_T98)
├── #Meeting (m5Wx9UdxArDb)
├── #Call (_dPTQ2MbX1Zs)
└── #Phonecall (BQzrIQovU4dA)

#memo (base) (SYS_T118)
└── #Quick Note (oOgRyu6vLtOU)

#reflection (base) (SYS_T119)
└── #Spark Note (p6OUQzxe74p6)

#Hungarian Sentence (kUTt57AxVOv0)
├── #Hungarian Interview (English) Question (HC7binIrD7Ae)
├── #Hungarian Interview (Hungarian) Question (lem5-daflknF)
├── #Hungarian Interview (Hungarian) Question (Kaviq3-T0DGi) [duplicate, has Person default=Both]
├── #Hungarian Interview (English) Answer (zoMSTL2AYedl)
└── #Hungarian Interview (Hungarian) Answer (-3RZZqnvkh1A)

#WellBase Note (i1L5L6cccaK4)
└── #WellBase Contract (cNrwr14bS6cl)

Standalone (no parent):
  #Project, #Appointment, #Document, #Subscription, #Financial Planning,
  #Financial Transaction, #Tax-Item, #2025 Tax Gathering, #Email,
  #Identification, #Personal Info, #Immigration, #Restaurant, #Shopping Item,
  #groceries, #Conservatorship/Entity, #Conservatorship/Log, #Hungarian Item,
  #Hungarian Study, #Hungarian Facts-History-Food, #Language Study,
  #Collection, #Artifact, #Idea, #Note, #Prompt, #Voice Memo, #Phonecall,
  #Movies (to watch), #TV Shows (to watch), #Books to Read, #YouTube
```

---

## Relationship Graph

How supertags reference each other through instance fields.

```
#Project ←──── Related Project ────→ #Task, #Company, #Meeting, #Appointment,
│                                     #Document, #Note, #Quick Note, #Idea,
│                                     #Immigration, #WellBase Note, #Tax-Item,
│                                     #Phonecall
├── Tasks ──→ #Task
└── Related Projects ──→ #Project (self-referential)

#Person ←──── Referenced by ────→ #Task (Related Person, Delegate To),
│                                  #Meeting (Attendees), #Appointment (Contact),
│                                  #Company (Contact), #Financial Transaction,
│                                  #Identification (Name), #Idea, #Quick Note,
│                                  #Immigration (Contact), #Phonecall (Attendees),
│                                  #Call (Participants)

#Company ←──── Referenced by ────→ #Task (Related Company), #Person (Company),
│                                   #Financial Transaction (From, To, Company),
│                                   #Insurance (Insurance Company → #Insurance Company),
│                                   #Immigration (Firm), #Phonecall, #Call

#Place ←──── Referenced by ────→ #Task (Related Place)

#Topic ←──── Referenced by ────→ #Task (Topic)

#Task ←──── Referenced by ────→ #Project (Tasks), #Meeting (Action items),
                                 #Phonecall (Tasks, Action Items),
                                 #Quick Note (Related Task),
                                 #Financial Transaction (Linked Tasks),
                                 #Immigration (Tasks)

#Collection ←──── Referenced by ────→ #Spark Note (Collection)

#Store ←──── Referenced by ────→ #groceries (Store)
#Food Type ←──── Referenced by ────→ #Restaurant (Type of Food)
#Grocery Type ←──── Referenced by ────→ #groceries (Grocery Type)
#Service Type ←──── Referenced by ────→ #Subscription (Service)
#Company Type ←──── Referenced by ────→ #Company (Type of Company)
#Insurance Company ←──── Referenced by ────→ #Insurance
#Type of Insurance ←──── Referenced by ────→ #Insurance (Type of Policy)
#Entity Type ←──── Referenced by ────→ #Conservatorship/Entity (Type of entity)
#Title ←──── Referenced by ────→ #Person (Title)
```

---

## 1. CORE SYSTEM

### #Project (`Mr-sHbJxOjAx`)

| Field | ID | Type | Details |
|-------|-----|------|---------|
| Related Projects | `n3YFBINTxPnP` | Instance of #Project | Self-referential |
| Categories | `_hfg7BaHG1uq` | Options | See below |
| Project Status | `JWJY5aJzrpR0` | Options | See below |
| Due date | `SYS_A61` | Date | |
| Resource Material | `rG_E4BqOh6w9` | Content | |
| Tasks | `Z3zjDKvJXGkk` | Instance of #Task | |
| Archived? | `URrXD0CCXC5H` | Checkbox | |
| Notes | `_Hf5XAxLfISS` | Content | |

**Project Status options:**

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

**Categories options:**

| Category | ID |
|----------|-----|
| Personal | `hItRVRYS0ZsT` |
| AI Experiment | `Me5j0MLPPVpm` |
| Finance | `0-zNJxWkM1Qv` |
| Leslie Related | `qTcNGlUmYi21` |
| Work | `lEz7_1XI2VH9` |

---

### #Task (`A89WpU8y7N6s`) — extends #task (SYS_T100)

| Field | ID | Type | Details |
|-------|-----|------|---------|
| Notes | `vJzzQh5okEhQ` | Content | Default value: "Notes" |
| Related Project | `b43UPwzhKJuO` | Instance of #Project | |
| Related Company | `lWpJWh8M768Q` | Instance of #Company | |
| Status | `Aa3RfvIGSss6` | Options | See below |
| Related Person | `2t2RtOQn9Ol_` | Instance of #Person | |
| Related Place | `-bcnqgZS8vHK` | Instance of #Place | |
| Topic | `ZcdvsN8Ei3-T` | Instance of #Topic | |
| Due date | `SYS_A61` | Date | |
| Delegate To | `48Izbx6XiXiA` | Instance of #Person | |
| Phonecalls | `r-2ceffOgDZs` | Instance of #Phonecall | |
| Attachments | `cjO0hMLQF3UV` | Content | |

**Task Status options:**

| Status | ID |
|--------|-----|
| 📥 Incoming | `MNwF7kvkdjZj` (default) |
| 📆 Planning | `mJTE_UhtqrxF` |
| 🏗️ In Progress | `4XESx6T9pVhj` |
| ⏳ Waiting | `7191Rf4WD5nC` |
| 🚗 Parked | `r3-BolQwyFUC` |
| ✅ Completed | `k6Cc_s3GCtLv` |
| 🚫 Cancelled | `xggDXjZiXcjK` |

**NOTE:** Task Status `🚗 Parked` ID is `r3-BolQwyFUC` — different from the Project Parked ID (`x6KhYbhAhigt`).

---

### #Person (`osBP97YsYZOx`) — extends #person (SYS_T99)

| Field | ID | Type |
|-------|-----|------|
| Title | `SLrMKsVs-dOn` | Instance of #Title |
| Company | `jGZi2l7_RcrW` | Instance of #Company |
| Email | `GY7kw3XMlkLL` | Instance of #E-Mail |
| Work Phone | `0_0honkQxYRJ` | Content |
| Cell Phone | `hlzHdR8S7AJw` | Content |
| WhatsApp | `4eQUMZgJD8dA` | Content |
| Address | `NF9LPChZFRci` | Content |
| Birthday | `PaT0qmOwslqO` | Date |
| Website | `9hrkYq1qEqDM` | Content |
| Email 2 | `S8zl-MaA01MH` | Instance of #E-Mail |
| Email 3 | `ZrgmFVJknRv3` | URL |

**Extended by:** #Doctor, #Family, #Neighbor, #Conservatorship/Person

---

### #Company (`GMmMalDixLze`) — extends #organization (SYS_T101)

| Field | ID | Type |
|-------|-----|------|
| Type of Company | `90-Q0dNwwjPO` | Instance of #Company Type |
| Related Project | `b43UPwzhKJuO` | Instance of #Project |
| Policy No | `8slJsPRi_GsP` | Content |
| Member ID | `ljhlGeXoIIls` | Content |
| Address | `NF9LPChZFRci` | Content |
| Phone Number | `HgLrl2u2ie5b` | Content |
| Fax Number | `F3M-i-RiU8-M` | Content |
| Website | `-oOn8EFmnsX1` | URL |
| Contact | `y9FfT5gzeHDF` | Instance of #Person |
| Notes | `Q4evY7YKhmMZ` | Content |
| Attachments | `cjO0hMLQF3UV` | Content |

**Extended by:** #Insurance

---

### #Place (`TiGk5rWIO7SV`) — extends #location (SYS_T102)

No custom fields. Label-only tag for locations.

---

## 2. CALENDAR & EVENTS

### #Meeting (`m5Wx9UdxArDb`) — extends #meeting (SYS_T98)

| Field | ID | Type |
|-------|-----|------|
| Description | `_pGoSkL17LfK` | Content |
| Related Project | `b43UPwzhKJuO` | Instance of #Project |
| Date | `4j_qz6af-7WQ` | Date |
| Attendees | `lmVZaKRBkA0g` | Instance of #Person |
| Meeting link | `HuFF3gzBIIvm` | URL |
| Event status | `bFiTLBV7Ylbt` | Options |
| Transcript | `QQ_PVd0QWVIJ` | Content |
| Location | `TyYixuLCvxwT` | Content |
| Discovered items | `MkqYtFTz8_It` | Content |
| Action items | `4NkKvi5bVwUk` | Instance of #Task |
| Notes | `tMBshOdUuYxn` | Content |

**Event status:** Declined (`SYS_V123`), Cancelled (`SYS_V122`), Tentative (`SYS_V121`), Confirmed (`SYS_V120`)

---

### #Appointment (`VCp1-yLGR2AL`)

| Field | ID | Type |
|-------|-----|------|
| Contact | `GdBI2gpX2yjn` | Instance of #Person |
| Date | `SYS_A90` | Date |
| Appt Reason | `2JzVKy5oQzdm` | Content |
| Location | `TyYixuLCvxwT` | Content |
| Work Phone | `0_0honkQxYRJ` | Content |
| Email | `GY7kw3XMlkLL` | Instance of #E-Mail |
| Preparation Needed | `ng9otTdLVcCm` | Content |
| Related Project | `b43UPwzhKJuO` | Instance of #Project |

---

### #Call (`_dPTQ2MbX1Zs`) — extends #meeting (SYS_T98)

Phone and computer calls with audio transcription.

| Field | ID | Type |
|-------|-----|------|
| Topic | `pq6BwKWFvY3E` | Content |
| Participants | `CqhoYwe_zw8g` | Instance of #Person |
| Company | `10qFEju9Rz7Q` | Instance of #Company |
| Call date | `yrmMyId3p4j6` | Date |
| Phone Number | `EZjUeO1zI3hU` | Content |
| Notes | `ZypmcRqjPbnT` | Content |
| Key Facts | `-DBR1ODqiiPi` | Content |
| Summary | `bW1Y8-Mxxq0i` | Content |
| Action Items | `9CQ5Fi0B-EB9` | Content |
| Discovered Items | `-rFv1t6UISo-` | Content |

---

### #Phonecall (`BQzrIQovU4dA`) — extends #meeting (SYS_T98)

Full call recording system with AI processing instructions.

| Field | ID | Type |
|-------|-----|------|
| Notes | `Q4evY7YKhmMZ` | Content |
| Attendees | `SYS_A142` | Instance of #person (base) |
| Topic | `GyraIyM4ZsdE` | Content |
| Tasks | `LCa2vjA8eKdG` | Instance of #Task |
| Company | `jGZi2l7_RcrW` | Instance of #Company |
| Project | `oArR7sGBo-L-` | Instance of #Project |
| Call date | `n_BIWKM10Ftj` | Date |
| Phone Number | `HgLrl2u2ie5b` | Content |
| Transcript | `QQ_PVd0QWVIJ` | Content |
| Key Facts | `p51ApMdSjQ_9` | Content |
| Details | `CNuuZl6ph-MU` | Content |
| Summary | `rwExcv2EzJOp` | Content |
| Action Items | `umExcjqohKR9` | Instance of #Task |
| Meeting link | `91kqWYa1lZGu` | URL |

**Optional:** Outcome (`a7RFs94-Yv_t`), Attachments (`cjO0hMLQF3UV`), Related Project (`pjiQPByZc7UA`), Discovered items (`guexXdMGzliD`)

**AI instructions:** Transcribe verbatim → Extract key facts → Write summary → Identify action items with owner/due date.

---

## 3. HUNGARIAN LEARNING SYSTEM

### #Hungarian Sentence (`kUTt57AxVOv0`) — BASE TAG

| Field | ID | Type |
|-------|-----|------|
| English Translation | `uzvCBKl0FAbE` | Instance of #Interview Q (EN) |
| Hungarian Translation | `hWpbH7eSHEdW` | Instance of #Interview Q (HU) |
| Hungarian Answer | `j9srPhFy8e1M` | Instance of #Interview A (HU) |
| English Answer | `AmwgZT6cA8F1` | Instance of #Interview A (EN) |
| Hungarian Grammar | `hqaNz9a6RK3I` | Content |
| Difficulty | `dGdVkzV1QhRO` | Options |
| Interview Priority | `ClDzK4Zcn_iC` | Options |

**Difficulty:** Beginner (`Y6i7M29Dnx6N`), Intermediate (`JcDYOFBQA3uJ`), Advanced (`v7Ny62cpgPU3`)

**Interview Priority:** Essential (`HiDtF1J29IS8`), Useful (`NW1PSCGEMuBG`), Nice-to-know (`b2pyMr8ps-FV`)

**Extended by:** All Interview Question and Answer tags

---

### #Hungarian Interview (English) Question (`HC7binIrD7Ae`) — extends #Hungarian Sentence

Inherits all Sentence fields plus:

| Field | ID | Type |
|-------|-----|------|
| Person | `xDC-19l6BxN4` | Options |

**Person:** Both (`QJjeNKSXo7QB`), Maria (`1LOrNFIIALk4`), Lawrence (`OAI3p_H81LdF`)

---

### #Hungarian Interview (Hungarian) Question — TWO VERSIONS

| Version | ID | Person Default |
|---------|-----|----------------|
| Version 1 | `lem5-daflknF` | None |
| Version 2 | `Kaviq3-T0DGi` | Both (default) |

Both extend #Hungarian Sentence and add the Person field (`xDC-19l6BxN4`).

---

### #Hungarian Interview (English) Answer (`zoMSTL2AYedl`) — extends #Hungarian Sentence

Inherits all Sentence fields plus:

| Field | ID | Type |
|-------|-----|------|
| Related Question | `cWXentPs-Z5a` | Content |

**AI instruction:** Autofill fields based on field names.

---

### #Hungarian Interview (Hungarian) Answer (`-3RZZqnvkh1A`) — extends #Hungarian Sentence

Inherits all Sentence fields plus:

| Field | ID | Type |
|-------|-----|------|
| Related Question | `K5MsnEXoWyMG` | Content |

**AI instruction:** Autofill fields based on field names.

---

### #Hungarian Item (`rj8BYIb0imfj`)

| Field | ID | Type |
|-------|-----|------|
| Item Type | `YY-OfkAKtgFk` | Options |
| English Translation | `uzvCBKl0FAbE` | Instance of #Interview Q (EN) |
| Hungarian Grammar | `hqaNz9a6RK3I` | Content |

**Item Type:** 📕 Text (`LxKdmvRhAfPo`), 📝 Cheatsheet (`Ay5Ge9y6qk9N`), 🏛️ History (`EXsO1Cucz6jt`), 🎉 Holiday (`Mg8CrilGQGjR`), 🧑🏼‍🦰 Important Person (`bD08FbbMe5Rj`)

---

### #Hungarian Facts-History-Food (`iRh-s8a8gdZv`)

| Field | ID | Type |
|-------|-----|------|
| English Translation | `4bFGwFkLoNb2` | Instance of #English Translation |
| Hungarian Translation | `KkFzPopkvfc0` | Instance of #Hungarian Translation |
| Category | `92Kx3yHi1jyq` | Options |
| Interview Importance | `XvZswSrH27wR` | Options |
| Memorized | `EYo2QgvmOLVO` | Checkbox |

**Category:** Geography (`sUI6QJzaTtjD`), Government (`HKLVQO8zQ_vM`), History (`eyK-JjjeRmfd`), Culture (`0nM2tAQ0ouN-`), Food (`outApsSzCeai`), Language (`wMaHJuGCqYwp`)

**Interview Importance:** Critical (`90G-T2zvK6As`), Important (`Ii1f67BDBM6Q`), Nice-to-know (`IiD7HyerE5dB`)

---

### #Hungarian Study (`-BdD0u4YZT-S`)

| Field | ID | Type |
|-------|-----|------|
| Platform | `L0-SoVURjmDl` | Options |
| Duration (min) | `IZG73GKwdN5b` | Number |
| Status | `Aa3RfvIGSss6` | Options (shared with Task) |
| Topic | `ilGlkMo8IgOW` | Options |
| Notes | `SmX-9Z5-PDks` | Content |
| Date (optional) | `zPwjaxC-PKPz` | Date |

**Platform:** Anna Lesson (`TClPteuurVDN`), Quizlet (`P0df0LHY7dqV`), Drops (`Bn7Q4mVRGFPx`), Duolingo (`-nKK1DGtTgfY`), HungarianPod101 (`nWqS6ZKXo6Lx`), MagyarOK (`vdsUuH3a30nV`)

---

### #Language Study (`LbE9l46Ls40M`)

| Field | ID | Type |
|-------|-----|------|
| Related Project | `zEtLv2na7qyQ` | Content |
| Lesson Type | `iSz3FhVYmr82` | Options |
| Completed | `JwNaeYNLP6mI` | Checkbox |
| Next Review | `qbH9rM5stOhM` | Date |
| Platform | `CfScTs88oOsN` | Options |
| Duration (min) | `krNe3v_XMb8K` | Number |
| Notes | `JciX5-cfNtNt` | Content |

**Lesson Type:** Grammar (`gY9C0rPYDExF`), Vocabulary (`jp7MYm4svz37`), Speaking (`LV45L9k_dDcD`), Exam Prep (`txzJYo-6TDo1`)

**Platform:** Anna Lesson (`TXFHMXgD7ljV`), Quizlet (`eQdshupmGxec`), Drops (`WXHGyfeRy88h`), Duolingo (`RwWI8C3FM64n`), HungarianPod101 (`qlkTzVe4S7Qd`), MagyarOK (`SvilQulauY6u`), Claude (`mhMjI5CSh8Tb`), Self Study (`RIA2I2SVR7ek`)

**NOTE:** Platform option IDs differ between #Hungarian Study and #Language Study even though names match.

---

## 4. CONSERVATORSHIP SYSTEM

### #Conservatorship/Person (`5DMQsvMy_LCp`) — extends #Person

Inherits all Person fields plus:

| Field | ID | Type |
|-------|-----|------|
| Role | `ydJVlEusSGe1` | Content |
| Notes | `MR9StzGH-hjm` | Content |

---

### #Conservatorship/Entity (`bJEeQ_PiJl_u`)

| Field | ID | Type |
|-------|-----|------|
| Entity name | `GaftJl5HSMal` | Content |
| Type of entity | `KbkOYVI2rCkn` | Instance of #Entity Type |
| Date established | `uXxQgRc4H8F3` | Date |
| Contact email | `09ZqxAiakAY4` | Instance of #E-Mail |
| Phone number | `qBSoVEWtCiHG` | Content |
| Account number | `iWIvo_dyPgUE` | Content |
| Routing number | `zDC-7oe2AW3W` | Content |
| Contact person | `I_uQA9yuuU0y` | Instance of #Person |
| Notes | `64XC7V2H5LZY` | Content |
| Related document | `ghH2qdH8swdD` | Instance of #Conservatorship/Document |

---

### #Conservatorship/Task (`rI27_AzPd066`) — extends #Task

Inherits all Task fields. No additional fields.

---

### #Conservatorship/Log (`wCnp7GwrT8m-`)

No fields. Label-only tag for log entries.

---

### #Conservatorship/Document (`eXHWAB_qHKYx`)

| Field | ID | Type |
|-------|-----|------|
| Date | `SYS_A90` | Date |
| Linked to Action | `9GLKB2BJx02r` | Instance of #Conservatorship (`EhR-MfwhnkRq`) |

---

## 5. FINANCE & INSURANCE

### #Financial Planning (`jModI3a0_Wde`)

| Field | ID | Type |
|-------|-----|------|
| Status | `XpSuQCmZTL5R` | Options |
| Amount | `8de6t64-t1O9` | Number |
| Source Account | `2ChDz_mPAwEK` | Content |
| Destination | `yIoBgsp1knUN` | Options |
| Advisor | `nFidip8Gda_t` | Options |
| Purpose | `3J8szyRRcG5s` | Options |
| HookMark Link | `xVi485NN66Z5` | Content |

**Status:** Waiting (`nrZY3qLKt6vD`), Received (`M1OEHfmIW6FX`), Allocated (`H4bBYYATJ1BZ`)

**Destination:** WFB - Checking (`B_svX1PJOVpD`), WFB - Savings (`Pl7_mWJiISdo`), WFB - Mortgage Acct (`3KI8YGJJgL6q`), Ally Bank (`XVrfNDxnfK0k`)

**Advisor:** Pam Chen (`OFhd-Mo7aF9l`), Robert (`tpPeef3SUzEb`), Gene (`QVLLG0Jze05Z`)

**Purpose:** General Expenses (`FgE0u74REFEZ`), Insurance Premium (`jWFLUyyptPzS`), Vacation (`uyo6kkfr3I_G`), Large Purchase (`yvqrpHoraWv8`)

---

### #Financial Transaction (`xGXusheIzDTk`)

| Field | ID | Type |
|-------|-----|------|
| Amount | `rtxAMIIa2GiD` | Number |
| From | `xzmfI4y-d5ui` | Instance of #Company |
| To | `plgrzmHfpyJJ` | Instance of #Company |
| Company | `ENZZVzx0BLhM` | Instance of #Company |
| Related Person | `2t2RtOQn9Ol_` | Instance of #Person |
| Category | `m31TiQA2IyB8` | Options |
| Transaction Area | `FCDXt8-5-JA9` | Instance of #Transaction Area |
| Payment Method | `wbc7Tn6RgcTX` | Options |
| Date | `SYS_A90` | Date |
| Linked Tasks | `hjS0Mmd9sbwM` | Instance of #Task |
| Notes | `MZqfPGK9jOzh` | Content |

**Category:** Expense (`TV4n_WD3CVNM`), Purchase (`tIl8OzyEN7oS`), Premium (`DPq8IWJzEJof`), Income (`QKF0VJIZ7M8g`), Investment (`m7c_sRRHBQUk`)

**Payment Method:** Credit Card - AmEx (`tXxepuoGduYm`), Credit Card - Visa (`l1vWsNlBvcM6`), Credit Card - Chase (`UQY2YH1dbmPM`), Venmo (`Zkyedrq8-6qK`), Zelle (`DkGn0vX5xPTk`), Paypal (`ENAfqrBtQkLe`), Online Website (`eCSAQ2nwh4zN`), Direct Pay WFB (`AV43AH3oNGcn`), Bill Pay WFB (`3CtA1ZpPLotY`), Check (`Mm-MK6cDyabE`), Cash (`xGMuuqJwzAkI`)

---

### #Insurance (`nroOC3jLs-Bb`) — extends #Company

Inherits all Company fields plus:

| Field | ID | Type |
|-------|-----|------|
| Insurance Company | `AFAY9p-sHVfP` | Instance of #Insurance Company |
| Type of Policy | `FSfELEZqmd0t` | Instance of #Type of Insurance |
| Policy Effective Date | `LhhfgC5OUH5h` | Date |
| Policy Expiration Date | `fn78VxBYkI_O` | Date |
| Group No | `EAmNZ-l1B7SI` | Content |
| Plan Code | `9PZqa1N_HOSD` | Content |
| RxBIN | `S2OevwA691Nr` | Content |
| RxPCN/RxGRP | `5aS0DL8uAd3J` | Content |
| Card | `Y-6fiRml_jo2` | Content |

---

### #Subscription (`Oswj5P2M9xWb`)

| Field | ID | Type |
|-------|-----|------|
| Service | `9rsJktv24tpq` | Instance of #Service Type |
| Times Charged | `IT9N-eshLwRT` | Number |
| Avg/Charge | `HX5cmUxcCBJZ` | Number |
| Monthly Cost | `4atKlmc676uJ` | Content |
| Annual Cost | `ktVICNbrNfai` | Number |
| Action Needed | `3d7LolSKNZnN` | Content |
| Start Date | `Yx0jCYQragc4` | Date |
| End Date | `nXv59n3TIupW` | Date |
| Subscriber name | `uOj6ZHXT9Oe6` | Content |
| Email address | `hSUmi4I6JWW6` | Instance of #E-Mail |
| Payment method | `VkE4xU6dH0hx` | Options |
| Status | `z-ExeLbXB3c8` | Options |
| Cancel Date | `YkwuHaV7hP8z` | Date |
| Cancellation URL | `-s1tuqAGuEuj` | Content |
| Invoice | `6p16RBPL1xY-` | Content |

**Payment method:** Credit card (`MrM8stSspC9F`), Paypal (`lxICFTCMisYe`), Bank transfer (`OCyFeshl_o22`)

**Status:** Active (`662Ge6p5Y3g0`), Inactive (`j5Bt8DH6s6Vi`), Pending (`NMoGnB4oY0RF`)

---

### #Tax-Item (`ETI1MRqaJxn5`)

| Field | ID | Type |
|-------|-----|------|
| Year | `klR-BgT6Ugmf` | Options (default: 2025) |
| Entity | `RxSFnf2TZOG7` | Options |
| Doc Type | `E5PrXmpMzYYv` | Options |
| Accountant | `4fEkIBlH9xXp` | Options |
| Received? | `4x0g5aFMheuu` | Checkbox |
| Mangler String | `5QwubmYgniiv` | Content |
| DEVONthink Link | `ZoE3l8qJFmRY` | URL |
| Related Projects | `n3YFBINTxPnP` | Instance of #Project (default: "Taxes-2025") |

**Year:** 2025 (`cux7UoNwf3mc` default), 2026 (`vQ3eBwTJ--YV`)

**Entity:** LGB (`PMWKoV-oZ-4x`), LGB_BROKERAGE (`ZeK1skVXwmZh`), LGB_IRA (`_bXZm2wVmmT0`), LGB_INH_IRA (`4LQQOWT8u3z2`), MRZ_INH_IRA (`ChNO3rFASPP2`), MRZ_BROKERAGE (`nkQk40EZBQJJ`), MRZ_IRA (`PJLqndMOMjTD`), MRZ_INH_IRA (Mom) (`qbLY9oix2B0E`), MRZ_INH_IRA (Dad) (`Bh8f0xjVE5zJ`), JOINT_TRUST (`zQr4I4EzIWh3`), Leslie_SNT (`vuMTMzhu7Y5b`)

**Doc Type:** 1099-R (`lpdZ1XKVWxCD`), 1099-INT (`_3Nlo6oNhLCq`), W-2 (`CoqcsCTXjTtk`), Statement (`jSx05LiT6rCt`)

**Accountant:** Brent Meyer (`IaXeye8AN24G`), Gene Gourdeau (`HJ5xvzhxiRxg`)

---

### #2025 Tax Gathering (`SZ0T0LA6fDII`)

| Field | ID | Type |
|-------|-----|------|
| Item Name | `wbbe8D66ELYe` | Content |
| Status | `0p1EzH-bIVJh` | Options |
| Owner | `OY2iqRlGinYi` | Options |
| Notes | `RHuwXCkLb7fs` | Content |

**Status:** Not collected (`IBJgcfRLtX41`), Waiting (`EYDL_fXgSoPM`), Review (`aV99rFqwf75X`), Collected (`diTdCGkHLH1I`)

**Owner:** Larry (`8WdMzJ0M8PLV`), Maria (`JkWiq1YLnAYL`), Joint (`AsxaYCv8Diic`), Leslie (`9merTmnSnU0z`)

---

## 6. WELLBASE / CIA

### #WellBase Note (`i1L5L6cccaK4`)

| Field | ID | Type |
|-------|-----|------|
| Related Project | `b43UPwzhKJuO` | Instance of #Project |
| Last edited date | `Sits86qfjO2o` | Date |
| Summary | `YZsyShtKAetN` | Content |
| Notes | `Q4evY7YKhmMZ` | Content |

**Extended by:** #WellBase Contract

---

### #WellBase Contract (`cNrwr14bS6cl`) — extends #WellBase Note

Inherits all WellBase Note fields plus:

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

### #WellBase Objects (`SuWn98iyAGdl`)

No fields. Label-only tag.

**Main WellBase Project Node:** `HSezrqebE5aZ`

---

## 7. DOCUMENTS & CONTENT

### #Document (`FcQDFvba_DMb`)

| Field | ID | Type |
|-------|-----|------|
| Related Project | `b43UPwzhKJuO` | Instance of #Project |
| Document Type | `Hym6Rt4nraqY` | Options |
| Status | `xvnnOZga4WWf` | Options |
| Location | `P4mIg84CN3Q1` | Options |
| Expiration Date | `YuPhC9lwxYFE` | Date |
| Document Format | `BXypjoBItUMQ` | Options |
| Authority Issued By | `vJv7iVRYpP_z` | Content |

**Document Type:** Marriage Certificate (`Jl1ik2AOIg0-`), Divorce Certificate (`gMvxPogbFE4z`), Death Certificate (`zg3-Kf5PPc59`), Birth Certificate (`C2qaMoN5mkVo`), Apostille (`vDurgmyfXyg3`), Translation (`RP6GTEL7HLp_`), Application Form (`v1VhBhUMI5H0`), Summary (`A1aZ7TFhXrf_`), Requirement Explanation (`6Agb9E6MsWjd`)

**Status:** Needed (`r2le3UhwMMZX`), Obtained (`ZuMKUIyfFnlJ`), Translated (`CmZD2G8L4xF6`), Apostilled (`OBZW6vP8nAne`), Submitted (`3B9l58VH3wCI`)

**Location:** DevonThink (`fNt-DLkhGexl`), iCloud Drive (`dJ_fvrl9SgWj`), Google Drive (`hh97f5a8dTlz`), Synology (`Ndw-nwfPlyVJ`), Physical File (`OpGvijRBlGNg`), Safe Deposit Box (`scFC5OETeEha`), Mailed to Hungarian Consulate (`eEQVxwRRXayF`), Mailed to Hungary Helpers (`kvJtJdata_6v`), Mailed to Secretary of State (`_oFKnHtLZKkK`), With translation service (`UPDOpPHpiDop`)

**Document Format:** Original (`aaragyol80zb`), Certified Copy (`-14KzLLLYZYA`), Translation (`p9lEfYeJtIui`), Apostilled Certified Copy (`C9-6DulOLkHY`), Apostilled Original (`x2INBd-fzp__`), Apostilled Translation (`JJ8LqRf0bxUn`)

---

### #Email (`PuFXqayG8HwF`)

| Field | ID | Type |
|-------|-----|------|
| Topic | `GyraIyM4ZsdE` | Content |
| HookMark Link | `xVi485NN66Z5` | Content |
| DEVONthink Link | `a5ttRdIyUlHF` | Content |
| Email Date | `9jING-ZWOxJl` | Date |

---

### #Note (`og7rUPdjmRty`)

| Field | ID | Type |
|-------|-----|------|
| Related Project | `oiwwYsylJJrT` | Instance of #Project |

---

### #Quick Note (`oOgRyu6vLtOU`) — extends #memo (SYS_T118)

| Field | ID | Type |
|-------|-----|------|
| Notes | `jFmnQs32yH7P` | Content |
| Related People | `OYHPQ1308Mnk` | Instance of #Person |
| Related Task | `9iQsKUkkmuHa` | Instance of #Task |
| Related Project | `b43UPwzhKJuO` | Instance of #Project |

---

### #Spark Note (`p6OUQzxe74p6`) — extends #reflection (SYS_T119)

| Field | ID | Type |
|-------|-----|------|
| Flavor | `VBylPVMbg68C` | Options |
| Candidate Claims | `OBaK3_x_UO2B` | Content |
| Notes | `Qudll2-HIRNK` | Content |
| Collection | `4euQSBm6wmzt` | Instance of #Collection |

**Flavor:** idea (`qtPaMAXsgYsy`), question (`uOewrdAZacJp`), tension (`OEzoUYujiKg_`), observation (`GznDGTmFy_4P`), analogy (`nNkPRe-zS_un`), design (`OXivM_pZBcs_`)

---

### #Collection (`E019RECqWVBM`)

| Field | ID | Type |
|-------|-----|------|
| Type | `KoG0wMOl12-W` | Options |

**Type:** Knowledge Collection (`hCIBk3i8uqsc`), Inspiration Collection (`Kf6xuWhRjRGQ`), Practical Collection (`HsdZ5V05jw0a`)

---

### #Artifact (`EM5MnkIV1xtC`)

| Field | ID | Type |
|-------|-----|------|
| Type | `o5VcEDbHLXCw` | Content |
| Source of truth | `YTJnZS0vlde_` | Content |
| Purpose | `NO4i2Qz-QJMf` | Content |
| Status | `-xftXPaLoQon` | Options |
| Blast Radius | `zARsnBsb18Oi` | Content |
| Phase | `vMvGtezEcID2` | Content |
| Notes | `Q4evY7YKhmMZ` | Content |

**Status:** Draft (`fzcSnVCaWi7h`), In review (`kE8p_SXVjneE`), Approved (`6YK5a2ttKYBz`), Rejected (`pykLro77jwXA`), Archived (`OlNPJxC2KDE7`)

---

### #Idea (`CH60U9gOcTke`)

| Field | ID | Type |
|-------|-----|------|
| Notes | `4qjEFroRSmL5` | Content |
| Related Project | `-EfD5w3Xh8X2` | Instance of #Project |
| Related Person | `8uruoivjzeI_` | Instance of #Person |

---

### #Prompt (`u6lErjdkpPhJ`)

| Field | ID | Type |
|-------|-----|------|
| Prompt text | `i6bO8fbL4wlD` | Content |

---

### #Voice Memo (`9wsuDT0WkCrL`)

| Field | ID | Type |
|-------|-----|------|
| Processed | `YTFNUq3IHVPl` | Checkbox (default: No) |

---

## 8. PERSONAL & LIFESTYLE

### #Identification (`dX0i8OjU88a0`)

| Field | ID | Type |
|-------|-----|------|
| Name | `XGSdOZKCiHPc` | Instance of #Person |
| Id number | `XQtd40wFPuxg` | Content |
| Expiration date | `S7wtIBood9a8` | Date |
| Customer Service | `0zrAWM8kkC6M` | Content |
| Phone Number | `HgLrl2u2ie5b` | Content |

---

### #Personal Info (`Eogau5CKojIh`)

Extensive family/biographical data for Hungarian citizenship interview prep. 47 fields covering: personal details, wife, sister, daughter, son, pets, education, parents, grandparents, and Hungarian ancestry/emigration history.

Key fields: Date of Birth (`vGlvCDv7pmQR`), Place of Birth (`GEY64cyXkbu8`), Occupation (`fm9ULfIQKe-s`), Hungarian Ancestor (`k8GxgxhZpVoI`)

---

### #Immigration (`x_kyVzGvVby8`)

| Field | ID | Type |
|-------|-----|------|
| Country | `qrBcvty0F7de` | Instance of #Country |
| Firm | `AQu312jENyiV` | Instance of #Company |
| Tasks | `LCa2vjA8eKdG` | Instance of #Task |
| Notes | `jEG8B272lsoU` | Content |
| date | `1x_qVKF59Nl-` | Content |
| Website | `-oOn8EFmnsX1` | URL |
| Phone Number | `HgLrl2u2ie5b` | Content |
| Contact | `K4f0fRGzUU7i` | Instance of #Person |

---

### #Doctor (`CbpgRerm2nHY`) — extends #Person

Inherits all Person fields. No additional fields.

---

### #Family (`WHIh9YNuaZjM`) — extends #person (base), #Person

Inherits all Person fields. No additional fields.

---

### #Neighbor (`ddICV86PFvh2`) — extends #person (base), #Person

Inherits all Person fields. No additional fields.

---

### #Contact (`xkmHSCTctjut`) — extends #person (base)

| Field | ID | Type |
|-------|-----|------|
| Service Type | `jzGTDSUkVU3z` | Options |
| Website | `nkb8Cw24H5a4` | URL (AI: auto-lookup) |
| Email | `ste3W_9m1GKs` | Instance of #E-Mail |
| Phone | `-aHfBcXpMx5j` | Content |
| Address | `PVytnshjNEym` | Content (AI: auto-lookup) |
| City | `z9v3CO_65SM5` | Instance of #City |
| State | `uCxe4lV5dlSl` | Instance of #State |
| Zip Code | `9FeMhpEkKm8J` | Content |
| Order | `Kcgmz4fftuG4` | Content |
| Notes | `Q4evY7YKhmMZ` | Content |

**Service Type:** Person (`2pThvJaaOfRW`), Restaurant (`m01V5PjiVaOo`), Plumber (`_wnrC1iSW4hq`), Electrician (`jkyozXNolElp`)

---

### #Restaurant (`4wf29V-NUZrP`)

| Field | ID | Type |
|-------|-----|------|
| Type of Food | `WF1O-52UDjw1` | Instance of #Food Type |
| City | `6Pynj4VFEb6B` | Instance of #City |

---

### #Shopping Item (`KZQQ9NaHmvdx`)

| Field | ID | Type |
|-------|-----|------|
| Store | `lNEjzo_kC4WL` | Options |

**Store:** Ralph's (`MqgaM7_W3M4F`), Trader Joe's (`oF9db0_nLM0H`), Whole Foods (`tGzWoyesBXkh`), CVS (`zEdrroD5bUCZ`), Home Depot (`TSfz1as2GWMc`), Costco (`A5yKsgqbHBSi`), Mother's (`NHdb_N1pb44m`), Gelson's (`HA1-oe_Y_vWf`)

---

### #groceries (`oMnG2VH6M2VN`)

| Field | ID | Type |
|-------|-----|------|
| Store | `G2I7xV17dqB-` | Instance of #Store |
| Grocery Type | `5D6_8npqWVnb` | Instance of #Grocery Type |

---

### #Property (`XEnN1To4DG6L`)

| Field | ID | Type |
|-------|-----|------|
| Escrowed | `O2cyg1VLi-Qt` | Content (default: "Yes") |

---

### #Immunization (`O94-X-sKF1Th`)

| Field | ID | Type |
|-------|-----|------|
| Date | `SYS_A90` | Date |

---

## 9. ENTERTAINMENT

### #Movies (to watch) (`nTHKQWv44GaT`)

| Field | ID | Type |
|-------|-----|------|
| Streaming Service | `pw83XE9o4hpS` | Content (AI: auto-lookup) |
| Genre | `jgu9lfaSPyUO` | Options |
| Release date | `q7WO6_5tEm-W` | Date |
| Runtime (minutes) | `K-faPPKvvJr9` | Number |
| Seen | `vaOee_Y_Tjmi` | Checkbox |
| Recommended by | `F2Bo2SBLKqQf` | Content |
| Comments | `MJEwPTsKBz2f` | Content |

**Genre:** Action (`2cvwEKfEW1gr`), Comedy (`vVujkLZ6Ia3n`), Drama (`k-tc9VgQLB71`), Thriller (`YgOxqz9QhJca`), Sci-fi (`8-GziyuwAibQ`), Documentary (`VNrLDgskj7zK`), Animation (`kdj1O3ULDfxF`)

---

### #TV Shows (to watch) (`2Bw8BIqTfbcH`)

| Field | ID | Type |
|-------|-----|------|
| Streaming Service | `pw83XE9o4hpS` | Content (AI: auto-lookup) |

---

### #YouTube (`GpKW13iDIzti`)

| Field | ID | Type |
|-------|-----|------|
| Video url | `nF1Cy9JThfLD` | URL (optional) |

---

### #Books to Read (`rxOmCY-GeTtB`)

No fields. Label-only tag.

---

## 10. SPECIALIZED TASK VARIANTS

### #Health Sprint Task (`us4KGRqaQomo`) — extends #Task

Hungarian Citizenship Prep & Health Reset 13-week sprint tasks. Inherits all Task fields. Excluded from the main Task Command Center searches.

### #Conservatorship/Task (`rI27_AzPd066`) — extends #Task

Inherits all Task fields. No additional fields.

---

## 11. REFERENCE / TYPE TAGS (label-only lookup tables)

| Tag | ID | Used By |
|-----|-----|---------|
| Topic | `-nz9BFDfNtIE` | Task.Topic |
| Title | `znnWcGmjBnf0` | Person.Title |
| Company Type | `dygUl9SVr0dn` | Company.Type of Company |
| Entity Type | `uE7dyAvBRJUK` | Conservatorship/Entity |
| Service Type | `7spuJ9jit2xV` | Subscription.Service |
| Food Type | `i5E3Xj69plk3` | Restaurant.Type of Food |
| Grocery Type | `HY5JvMzhT7gG` | groceries.Grocery Type |
| Insurance Company | `n6YTyh4c5PV4` | Insurance |
| Type of Insurance | `XNXOqRARZNso` | Insurance.Type of Policy |
| Transaction Area | `-aSyuKqEcTep` | Financial Transaction |
| State | `wHRNBTY-dRKx` | Contact.State |
| Store | `8zhKVgTPaoMf` | groceries.Store |
| English Translation | `jC23bsQZddU2` | Hungarian Facts-History-Food |
| Day | `Za5P8e6tMbn4` | Calendar system |

---

## 12. MISCELLANEOUS TAGS (no/minimal fields)

| Tag | ID | Notes |
|-----|-----|-------|
| Claude Related | `Tqn8UtAEDwt3` | Notes about working with Claude |
| Fix/Admin | `sWvHX4JlTIM9` | Admin/fix items |
| Morning Brief | `6IZCCRKKLT7C` | Daily briefings |
| Packing-List | `VSZODDd3r7F0` | Travel packing |
| Visa | `zYxwocNZFOIM` | Travel visas |
| Drill | `PHRIhPoLBqGi` | Practice drills |
| Weight Loss | `fOU8nv0aVYX8` | Health tracking |
| Medical Records | `QmNKSMDhUnTu` | Medical docs |
| Medical Society | `ymcH4UmGs433` | Medical orgs |
| Stereo | `k_D0z0Mozx2o` | Audio equipment |
| n8n Workflow | `ERZBj6J6_l4A` | Automation workflows |
| AI Model | `KQlFGCVavMfW` | AI model tracking |
| Resource | `qm64ho5JqmBf` | General resources |
| Product | `6Tm05-dGakRg` | Products |
| Code | `XH62dZ4Q8nLF` | Code snippets |
| Travel Hacks | `vhUGh8VaIXIU` | Travel tips |
| Meeting summary | `Qe5juELSVdB3` | Meeting summaries |
| Fleeting-Note | `O0MeuEyh293x` | Temporary captures |
| Waiting | `rUgYzstsBN1o` | Waiting items |
| Claude Weekly Context | `DlgojVImYRK6` | Context system |
| The Best | `xb96EJKipdHS` | Priority/favorite marker |
| Readwise | `kSkKDmBmlwaS` | Readwise imports |

---

## 13. SHARED FIELD IDS

Fields reused across multiple tags (same ID, different contexts):

| Field | ID | Tags |
|-------|-----|------|
| Related Project | `b43UPwzhKJuO` | Task, Company, Meeting, Appointment, Quick Note, Document, WellBase Note |
| Due date | `SYS_A61` | Task, Project |
| Date | `SYS_A90` | Appointment, Financial Transaction, Immunization, Conservatorship/Document |
| Company | `jGZi2l7_RcrW` | Person, Conservatorship/Person, Phonecall |
| Address | `NF9LPChZFRci` | Person, Company |
| Notes (Q4) | `Q4evY7YKhmMZ` | Company, Phonecall, WellBase Note, Contact, Artifact |
| Attachments | `cjO0hMLQF3UV` | Task, Company, Phonecall |
| Location | `TyYixuLCvxwT` | Meeting, Appointment |
| Status (Task) | `Aa3RfvIGSss6` | Task, Hungarian Study (shares same options) |
| Phone Number | `HgLrl2u2ie5b` | Company, Phonecall, Identification, Immigration |
| Website | `-oOn8EFmnsX1` | Company, Immigration |
| Email | `GY7kw3XMlkLL` | Person, Appointment |
| Work Phone | `0_0honkQxYRJ` | Person, Appointment |
| Transcript | `QQ_PVd0QWVIJ` | Meeting, Phonecall |
| HookMark Link | `xVi485NN66Z5` | Financial Planning, Email |
| English Translation | `uzvCBKl0FAbE` | Hungarian Sentence, Hungarian Item |
| Hungarian Grammar | `hqaNz9a6RK3I` | Hungarian Sentence, Hungarian Item |
| Streaming Service | `pw83XE9o4hpS` | Movies, TV Shows |
