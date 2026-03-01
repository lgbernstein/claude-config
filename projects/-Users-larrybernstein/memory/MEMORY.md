# Memory

## Tana MCP Connection
- Tana desktop runs MCP server on `http://127.0.0.1:8262/mcp` when Tana is running
- Uses **Personal Access Token** authentication (generated in Tana Settings → API Tokens)
- Token configured in `~/.mcp.json` with Accept header: `application/json, text/event-stream`
- 19 tools available: search_nodes, import_tana_paste, read_node, list_tags, get_tag_schema, etc.
- If Tana tools aren't loading, check: 1) Is Tana running? (`lsof -i :8262`) 2) Is token valid? 3) Restart Claude Code session to reload MCP config
- Workspace ID: `1ZC0C98k2UkT` (Home)
- **Home node ID: `sZY5O2fP6NVV`** — use this (not workspace ID) when importing under Home. The workspace ID is the invisible root *above* the Home node; imports there won't be visible in the Home UI.
- Dashboards node: `4-fqpB9xn9cP` (child of Home node, `%%view:tabs%%`)
- Full workspace map (all tags, schemas, field IDs, structural nodes): see `tana-workspace-map.md`

## TypingMind MCP Connector
- **Purpose**: Bridges TypingMind (web AI chat) to local MCP servers (Tana + n8n)
- **Location**: `~/.typingmind-mcp/` — local npm install of `@typingmind/mcp` (v1.3.2)
- **Port**: 50880, **Auth token**: `tGGlI1oKwbMWnhdjXbPWN`
- **Auto-starts on login** via LaunchAgent: `~/Library/LaunchAgents/com.typingmind.mcp-connector.plist`
- **Headers patch**: `~/.typingmind-mcp/patch.js` — fixes bug where connector ignores `headers` config for HTTP transports (needed for Tana auth). Re-run after `npm update`.
- **Startup script**: `~/.typingmind-mcp/start.sh` — applies patch, starts connector, registers tana-local (HTTP+auth) and n8n (stdio)
- **Registered servers**: tana-local (19 tools), n8n (7 tools)
- **TypingMind config**: saved at `~/.typingmind-mcp/typingmind-config.json` (paste into TypingMind MCP settings)
- **Known bug**: TypingMind fails on tools with no parameters (e.g. `list_workspaces`) — sends empty string instead of `{}`. Tools with parameters (search_nodes, read_node, etc.) work fine.
- **Logs**: `~/.typingmind-mcp/connector.log`
- **Manual control**: `launchctl stop/start com.typingmind.mcp-connector`
- **n8n instance**: `http://192.168.7.244:5678`

## TypingMind Tana Assistant Agent
- Custom agent in TypingMind named **"Tana Assistant"**
- **System prompt**: `~/.typingmind-mcp/tana-agent-prompt.md` — contains workspace IDs, tag/field IDs, Tana Paste examples, and instructions to default all content to today's page
- **Enabled plugins**: tana-local, n8n (keep others off for focus/speed)
- **Conversation starters**: "Create a task to...", "Search Tana for...", "What's on my today page?", "Create a note about...", "Show me my open tasks", "Schedule a meeting for..."
- **Known behavior**: Requires clicking "Continue" button between tool calls (no auto-continue setting found in TypingMind)
- **Model compatibility**: Must use tool-capable models (Claude, GPT-4/5, Llama 3.1+, Qwen 2.5 non-vision). Does NOT work with: qwen2.5vl, llama3:8b, vision models, or small local models
- **Best results with**: Claude Sonnet or GPT-5.2 — local LLMs are slower and less reliable with tool calls

## Mac Mini Hardware & Storage
- **Chip**: Apple M4 Pro, **RAM**: 48GB
- **Internal drive**: 512GB (small — don't fill it up)
- **External drive**: Crucial 4TB SSD at `/Volumes/Crucial` — main data drive (ownership enabled via `diskutil enableOwnership`)
- **Docker compose**: `/Volumes/Crucial/self-hosted-ai-starter-kit/`
- **Docker containers**: n8n, n8n-mcp, chainlit, form5500-db (postgres), another postgres, qdrant, open-webui (ollama-cpu stopped — replaced by native)
- **Eero mesh networking**: iMac connects via Eero; direct LAN connectivity is BROKEN (outbound TCP from iMac blocked by unknown cause). Use Tailscale instead.

## Ollama (Native, GPU-Accelerated)
- **Runs natively** on Mac Mini (not Docker) — full Metal GPU acceleration on M4 Pro
- **Models stored at**: `/Volumes/Crucial/ollama/models` (env: `OLLAMA_MODELS`)
- **Listening on**: `0.0.0.0:11434` (env: `OLLAMA_HOST`)
- **CORS**: `OLLAMA_ORIGINS=*` (required for TypingMind)
- **LaunchAgent**: `~/Library/LaunchAgents/com.ollama.serve.plist` on Mini (auto-starts on boot with KeepAlive)
- **Installed models**: deepseek-r1:32b (19GB, Q4_K_M) — others still need pulling (qwen2.5:14b, mixtral, llama3:8b)
- **Performance**: All 65 layers on GPU, Flash Attention enabled, ~30-40 tok/s (vs ~2-5 tok/s in Docker CPU mode)
- **Old Docker container** `ollama-cpu` is stopped but not removed; docker-compose still needs updating to point services at `host.docker.internal:11434`

## Tailscale VPN (iMac ↔ Mini ↔ MacBook)
- **iMac IP**: `100.81.206.109` (larry-imac-pro)
- **Mini IP**: `100.116.70.17` (larrys-mac-mini)
- **MacBook IP**: `100.88.188.43` (lgbs-macbook-pro)
- **Account**: `lbern57@gmail.com` (free tier)
- **iMac**: installed via `brew install tailscale`, daemon started via `sudo bash -c 'tailscaled > /tmp/tailscale.log 2>&1 &'`
- **Mini**: installed via `brew install tailscale`, started via `sudo brew services start tailscale`
- **MacBook**: installed via `brew install tailscale`, started via `sudo brew services start tailscale`
- **SSH works**: passwordless SSH via keys (`ssh larrybernstein@100.116.70.17`)
- **MacBook SSH key**: `~/.ssh/id_ed25519` (ed25519, added to Mini's authorized_keys 2026-03-01)
- **SSH tunnel LaunchAgent** on iMac: `~/Library/LaunchAgents/com.ollama.tunnel.plist` — forwards `localhost:11434` → Mini's Ollama via Tailscale
- **TypingMind endpoint**: `http://localhost:11434/v1/chat/completions` (goes through SSH tunnel → Tailscale → Mini)

## Claude Config Sync (All 3 Machines)
- `~/.claude/` is a git repo synced to `https://github.com/lgbernstein/claude-config.git`
- **Auto-sync LaunchAgent** installed on all 3 machines: `~/Library/LaunchAgents/com.claude.sync.plist`
- Runs `~/.claude/sync.sh` every hour + on login — fully automatic, no manual steps needed
- Manual sync anytime: `~/.claude/sync.sh` (pull + push), or `sync.sh pull` / `sync.sh push`
- `sync.log` is gitignored (machine-specific)
- Syncs: CLAUDE.md, tana-ids.md, memory/, settings, commands, agents, hooks, plugins

## Networking Issue (Unresolved)
- iMac cannot make new outbound TCP/ICMP connections to any LAN device (192.168.7.x)
- Existing connections (e.g., SMB on port 445) continue to work
- Not caused by: macOS firewall, Little Snitch, NordVPN, pf, network location, Eero
- UDP/traceroute works; only TCP/ICMP new connections fail
- Workaround: Tailscale VPN bypasses the issue entirely