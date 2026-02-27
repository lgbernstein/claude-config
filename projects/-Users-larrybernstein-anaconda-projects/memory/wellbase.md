# WellBase Dashboard Notes

## Pending: n8n workflow — skip logic for unresolved companies

When the EIN resolver can't match a company (e.g. "AIG" → `skipped: true`, `company_ein: null`), downstream Postgres query nodes (Get Consultants, etc.) fail with "there is no parameter $1" because EIN is null.

**Fix needed:** Add an IF node after the resolver that checks `{{ $json.skipped }}`. If true, skip detail queries and go straight to writing results back to MySQL. Only run Get Consultants, Get Brokers, etc. when `skipped` is false and EIN is available.

**Error:** `"there is no parameter $1"` in Get Consultants node — query uses `$1` for `ein_cleaned` but value is null.

## Pending: n8n resolver — improve name matching

The EIN resolver has poor name similarity matching when common prefixes/suffixes differ:
- "TORO COMPANY" → "THE TORO COMPANY" (EIN 410580470) — only 31% match, skipped
- "AIG" → best candidate 22% match, skipped

**Fix needed:** Strip "THE", "A", "AN" prefixes and common suffixes (INC, LLC, CORP, COMPANY, etc.) before calculating name similarity. This would bring "TORO COMPANY" vs "THE TORO COMPANY" close to 100%.

**Query Parameters note:** The Get Consultants node uses `$1` with Query Parameters set to `{{ $json.company_ein || '' }}`. When EIN is null, this passes empty string which Postgres rejects. The IF node fix (above) prevents this, but the resolver should also be matching these correctly.
