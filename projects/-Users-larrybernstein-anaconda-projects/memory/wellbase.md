# WellBase Dashboard Notes

## Session Handoff — Feb 27, 2026

### What WellBase Is

A sales intelligence dashboard at `https://ambersight.com/wellbase/` for Peter Zambrano (WebMD Health Services). It shows company data enriched from Form 5500 filings (2.9M rows in Postgres on Mac Mini). The dashboard PHP runs on shared hosting (HostRocket/ambersight.com) with MySQL. n8n orchestrates the data pipeline between Postgres and MySQL.

### Architecture

```
Browser → Dashboard (PHP + MySQL on HostRocket shared hosting, ambersight.com)
                ↕ webhooks (HTTPS via Cloudflare tunnel)
           n8n (Docker on Mac Mini 192.168.7.244)
                ↕ SQL queries (local Docker network)
           Postgres (Docker on Mac Mini, "form5500-db" container, DB "form5500")
```

- **HostRocket** (sh1.hostrocket.com): Shared web hosting running PHP + MySQL. Dashboard reads/writes MySQL.
- **Mac Mini** (192.168.7.244): Docker host running n8n + Postgres. n8n enriches data from Postgres (2.9M Form 5500 filings) and POSTs results to dashboard's `api.php` on ambersight.com.
- **Cloudflare Tunnel**: Makes Mac Mini's n8n accessible at `n8n.ambersight.com` without port forwarding.

**3 n8n Workflows** (all running in Docker on Mac Mini):

| Workflow | Webhook Path | File | Purpose |
|----------|-------------|------|---------|
| WellBase (main) | `/webhook/ea770f8b-657c-4837-8984-696679f30d33` | `Active Workflows/WellBase_Workflow.json` | Company enrichment pipeline: EDS Resolver → EIN lookup → broker/vendor/consultant data → write to dashboard MySQL |
| Prospect Search | `/webhook/prospect-search` | `03_Workflows/prospect-search.json` | Territory Prospector: searches f5500_filing for companies matching filters, returns JSON |
| Find Similar | `/webhook/find-similar` | `03_Workflows/Find Similar.json` | Finds companies with similar industry/size in Pete's territory |

**n8n access:** `https://n8n.ambersight.com` (via Cloudflare tunnel to Mac Mini Docker)

**Web hosting:** HostRocket (shared hosting) — `ambersight.com`
- Dashboard lives at `https://ambersight.com/wellbase/`
- Server files at `~/public_html/wellbase/`
- **MySQL** runs locally on the HostRocket server (localhost): DB `ambersi_wellbase`, user `ambersi_wellbase`, pass `vnaYX7uzCShmYJ7LppT3`
- File manager accessible via HostRocket Client Area (cPanel) at `sh1.hostrocket.com`
- SCP: `scp file larrybernstein@ambersight.com:~/public_html/wellbase/` (may require password)

### Dashboard Pages

| Page | File | Purpose |
|------|------|---------|
| Dashboard | `index.php` | Main company list + detail view |
| Refresh All | `refresh_all.php` | Batch re-enrichment of all companies via n8n |
| Prospector | `prospect.php` | Search the full 5500 universe to find new prospects |
| Analytics | `analytics.php` | Summary stats |
| Territory Map | `map.php` | Geographic visualization |

### Git Repo

- **Local:** `/Users/larrybernstein/Documents/WellBase/`
- **Remote:** `https://github.com/lgbernstein/wellbase.git`
- **Branch:** `main` — fully pushed, clean working tree as of Feb 27 2026

---

## What Was Done This Session (Feb 27, 2026)

### 1. EDS Resolver — Name-First Scoring (COMPLETED)

**Problem:** The EDS Resolver (SQL in n8n's "EDS Resolver1" node) was scoring matches by company SIZE first, causing wrong EIN matches. Example: "Bath & Body Works" (retail, ~8K employees) was matching to "BATH IRON WORKS" (shipbuilder, 5,600 employees) because size similarity ranked higher than name similarity.

**Fix:** Rewrote scoring to be **name-first**: `name_score * 0.70 + size_score * 0.20 + recency * 0.10`. Added `word_similarity()` and `LIKE '%name%'` containment checks for asymmetric name lengths (e.g., "American Express" vs "AMERICAN EXPRESS COMPANY RETIREMENT SAVINGS PLAN").

**File:** `03_Workflows/eds_resolver_FIXED.sql` — the complete SQL to paste into n8n EDS Resolver1 node.

### 2. filing_name Pipeline (COMPLETED locally, needs n8n deploy)

**Problem:** The dashboard has code to show the official Form 5500 filing name (e.g., "AMERICAN EXPRESS COMPANY" as subtitle under "American Express") but it NEVER appeared because the n8n pipeline never sent `filing_name` to the API.

**Root cause chain:**
1. EDS Resolver SQL never outputted `filing_name` ← FIXED in eds_resolver_FIXED.sql
2. "Code - Write to Dashboard" n8n node explicitly mapped fields WITHOUT `filing_name` ← Larry added it manually in n8n
3. `api.php` already had the `filing_name` mapping (lines 92, 123) ← no change needed
4. `index.php` already had display code (lines 701-703) with `is_filing_match_valid()` guard ← no change needed

**What Larry did in n8n:**
- Pasted updated SQL into EDS Resolver1 node (adds `(SELECT sponsor_name FROM top) AS filing_name`)
- Added to "Code - Write to Dashboard" node: `filing_name: cleanField(item.filing_name || $('EDS Resolver1').first().json.filing_name || ''),`
- Exported updated workflow to `Active Workflows/WellBase_Workflow.json`

### 3. Refresh All — Force Refresh (COMPLETED locally, needs upload)

**Problem:** `refresh_all.php` shows "Nothing to refresh" when all companies were recently refreshed. The original `?skip=9999` workaround didn't work because the math goes backwards (9999 hours ago is Sept 2024; companies refreshed today are AFTER that cutoff, so they're excluded).

**Fix:** Added `?force=1` parameter that selects ALL companies regardless of `last_refreshed`. Updated the "Force Re-Refresh All" link to use `?force=1`.

### 4. Dashboard Fixes (COMPLETED locally, needs upload)

- `$MAINTENANCE_MODE = false` (was true during work)
- Refresh spinner timing: shows spinner immediately on click, hides after response
- Committed and pushed to GitHub

### 5. Prospector State Expansion (PARTIALLY DONE)

**Background:** Pete's territory is 18 states. Larry wanted the Prospector to search ALL 50 states + DC, not just Pete's territory.

**What was done (in prior sessions, already committed):**
- `prospect.php` dropdown expanded from 18 to all 50 states + DC (commit `387820f`)
- Default "Territory (18 states)" option sends the 18-state comma list
- Individual state selection works for any state

**What's broken NOW:** The n8n `prospect-search` webhook returns HTTP 200 with **0 bytes** (empty body). This causes the JS error: "Failed to execute 'json' on 'Response': Unexpected end of JSON input".

**Diagnosis:** Tested with curl — even the simplest query returns 200 with 0 bytes:
```bash
curl -s -w "HTTP %{http_code}, size: %{size_download}" -X POST \
  "https://n8n.ambersight.com/webhook/prospect-search" \
  -H "Content-Type: application/json" \
  -d '{"state":"NY","min_participants":50000,"max_participants":99999999,"min_year":2022,"limit":5}'
# Returns: HTTP 200, size: 0
```

**Likely cause:** The prospect-search workflow in n8n is either **inactive** (turned off), or the Postgres SQL node is failing silently. The workflow JSON shows `"active": true` in the export, but the live n8n instance may differ.

**PHP-side fix done:** Added empty response handling in `prospect.php` so it shows "n8n returned empty response — the prospect-search workflow may be inactive" instead of a JS crash.

**The prospect-search SQL** (in the n8n workflow) filters with:
```sql
sponsor_state = ANY(string_to_array('STATE_VALUE', ','))
```
This should handle both single states ("NY") and comma-separated lists ("CO,ID,IL,..."). If the SQL itself is the problem, it might be the `string_to_array` wrapping — the n8n expression `{{ "'" + $json.body.state + "'" }}` adds literal quotes that become part of the SQL string parameter.

---

## What Was Done — Feb 27 Evening Session

### Completed This Session
- **filing_name always shows**: Simplified display condition to just `!empty($company['filing_name'])` — no more case-insensitive matching that filtered valid names
- **Prospector confirmed working**: Tested from Mac Mini with curl for NY and CA
- **Find Similar territory toggle**: Built PHP config `$TERRITORY_GROUPS` + dropdown in panel. New n8n workflow `find-similar-FIXED.json` with Code node for dynamic SQL. Imported, activated, tested.
- **Renamed**: "Request Company" → "Add Company", "Pete's Territory" → "PJZ Territory"
- **Find Contacts feature (Hunter.io)**: Full feature with slide-out panel, contact cards with initials avatars, department/seniority badges, LinkedIn + email links
  - **Hunter API strategy**: Resolve domain first (try fullslug.com → firstword.com → company param), then pull HR department contacts, pad with unfiltered if < 5 HR results, keyword-sort in PHP (not JS)
  - **Keyword filter**: human resources, wellness, well-being, benefits, total rewards, CHRO, CPO, talent, employee experience, labor relations, compensation, workforce, training, L&D, payroll, etc.
  - **Feature flags**: `$SHOW_CONTACTS` + `$HUNTER_API_KEY` at top of index.php
  - Larry's Hunter key is on Starter plan (6000 searches, ~4700 remaining)

### UNRESOLVED / NEXT SESSION

### 🟡 1. Upload index.php to HostRocket
Has ALL changes from both sessions. Larry uploads manually via file manager.

### 🟡 2. Verify filing_name After Refresh All
Check companies like Abbott, American Express — filing name should show beneath company name.

### 🟡 3. Git Commit
Local changes haven't been committed/pushed this session.

---

## Key File Locations

| What | Path |
|------|------|
| Dashboard PHP files | `/Users/larrybernstein/Documents/WellBase/dashboard/` |
| Main workflow (n8n export) | `/Users/larrybernstein/Documents/WellBase/Active Workflows/WellBase_Workflow.json` |
| Prospect-search workflow | `/Users/larrybernstein/Documents/WellBase/03_Workflows/prospect-search.json` |
| Find Similar workflow | `/Users/larrybernstein/Documents/WellBase/03_Workflows/Find Similar.json` |
| EDS Resolver SQL (latest) | `/Users/larrybernstein/Documents/WellBase/03_Workflows/eds_resolver_FIXED.sql` |
| Server hosting | ambersight.com (HostRocket), files at `~/public_html/wellbase/` |
| n8n URL | `https://n8n.ambersight.com` |
| Postgres | Mac Mini 192.168.7.244, Docker container `form5500-db`, DB `form5500`, user `larry` |
| MySQL (dashboard) | localhost on web server, DB `ambersi_wellbase`, user `ambersi_wellbase` |

## n8n Main Workflow Data Flow

```
Webhook (POST with company_name, action, ein)
  → Input Seed
  → EDS Resolver1 (Postgres: matches company to EIN using name similarity)
  → Enterprise EIN Selector (picks best EIN, passes through all fields via ...data spread)
  → If (checks if resolver succeeded)
  → Parameter Builder
  → DB-Orchestrator (Postgres: gets broker/vendor/consultant data)
  → Merge
  → Format & Validate (passes through via ...out spread)
  → Code - Write to Dashboard (EXPLICIT field mapping — must include filing_name!)
  → Write to Dashboard (HTTP POST to api.php on ambersight.com)
```

**Critical:** "Code - Write to Dashboard" does NOT use spread — it explicitly maps each field. Any new field (like `filing_name`) must be added here manually.
