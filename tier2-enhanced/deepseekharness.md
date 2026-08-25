---
type: toolchain
name: DeepSeek Harness (dsh)
language: TypeScript / Node.js
license: MIT
tags:
  [ai-agent, coding-agent, orchestration, plugin-system, cordis, llm-tooling]
added_date: 2026-08-24
---

# 🧰 DeepSeek Harness (dsh) - A microkernel plugin architecture for fully inspectable, composable AI coding agents

## 📝 1. Description

- **Core Use Case**: Replaces monolithic, vendor-locked coding assistants with a modular microkernel where every layer—from context injection and tool calling to the agent loop itself and sub-agent delegates—is a composable, hot-swappable plugin.
- **Official Description**: DeepSeek Harness (`dsh`) is an open-source agent harness developed by DeepSeek AI. It uses an architecture where everything is a plugin, powered by the Cordis framework based on the paradigm of spatiotemporal composability.
- **Official Website**: `[https://deepseek.com/harness/en/](https://deepseek.com/harness/en/)`
- **Repository**: `[https://github.com/deepseek-ai/deepseek-harness](https://github.com/deepseek-ai/deepseek-harness)`
- **Build/Architecture Trait**: Modular Node.js/TypeScript architecture running on top of the Cordis IoC/plugin lifecycle engine; exposes a local HTTP/WebSocket backend with an integrated Web UI and CLI orchestration surface.
- **Activity Status**: Explosive growth in developer preview; over 160k+ GitHub stars in its first launch cycle, active daily release iterations, and high issue/PR velocity backed directly by the DeepSeek AI core team.

## ⚙️ 2. Recommended Installation Strategy

_(Rationale: As a rapidly evolving TypeScript project currently in active developer preview with frequent upstream breaking changes, managing Node.js runtimes via `mise` alongside `pnpm` or sandboxed container execution via `podman` prevents global environment pollution while offering complete access to custom plugins and local source edits.)_

### Linux (Arch Linux Optimized)

```bash
# Manage isolated Node.js environment via mise, then execute or install via pnpm/npx
mise use -g node@22
pnpm add -g @deepseek-ai/dsh

# Alternatively, execute zero-install developer preview on demand
npx @deepseek-ai/dsh web --no-open

```

### Windows

```powershell
# Manage Node runtime via Scoop and run the isolated binary/npx instance
scoop install nodejs-lts pnpm
npx @deepseek-ai/dsh web

```

### Podman/WSL (If containerization is optimal)

```bash
# Run isolated rootless container exposing the Harness Web UI with mounted workspace & API config
podman run -d \
  --name deepseek-harness \
  --security-opt label=disable \
  -p 3080:3080 \
  -v "${PWD}:/workspace:Z" \
  -e DEEPSEEK_API_KEY="${DEEPSEEK_API_KEY}" \
  ghcr.io/deepseek-ai/deepseek-harness:latest \
  dsh web --host 0.0.0.0 --port 3080

```

## 📊 3. Standardized Capability Matrix

_(Score each dimension from 1 to 5 stars, followed by a concise, objective critique)_

- **Performance & Resource Efficiency**: ⭐⭐⭐⭐☆ - Lightweight microkernel footprint, but large multi-turn context chains and unconstrained parallel sub-agent plugins can rapidly consume system RAM and prompt token caches.
- **Usability & Learning Curve**: ⭐⭐⭐☆☆ - The web interface is clean, but understanding the Cordis plugin lifecycle, trajectory graphs, and custom agent loop modification requires solid architectural maturity.
- **Ecosystem & Interoperability**: ⭐⭐⭐⭐⭐ - Outstanding; treats external proprietary assistants (Claude Code, OpenAI Codex) as swappable sub-agents and connects seamlessly to any OpenAI-compatible provider or OpenRouter endpoint.
- **Cross-Platform Consistency**: ⭐⭐⭐⭐⭐ - Full parity across POSIX and Windows environments via Node.js runtime and browser-based control dashboard.
- **Maintainability & Security**: ⭐⭐⭐⭐☆ - High transparency and step-by-step trajectory auditability, though arbitrary shell/sandbox execution plugins require careful isolation via container boundaries.

## 💡 4. Core Rationales for Adoption

1. **Microkernel "Everything-is-a-Plugin" Paradigm**: Unlike monolithic coding CLIs where agentic behavior is hardcoded, `dsh` exposes tools, sandboxes, prompt synthesizers, session states, and the core reasoning loop as individual, modifiable plugins managed by Cordis.
2. **Deterministic Trajectory Auditability**: Features a full execution trajectory inspector that attributes every single shell execution, file modification, and context injection step directly to the triggering plugin for zero-black-box debugging.
3. **Multi-Agent Meta-Orchestration**: Serves as a vendor-agnostic supervisory layer capable of orchestrating external sub-agents, local LLMs, and hosted frontier models under a unified task pipeline.

## ⚔️ 5. Competitor Landscape

| Competitor                      | Primary Strength                                                                | Reason for Rejection / Deprioritization                                                                                            |
| ------------------------------- | ------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| **Claude Code**                 | Deep integration with Anthropic reasoning features and seamless CLI ergonomics. | Closed-source, proprietary harness; hard-locked to Claude models with no architectural access to customize the internal loop.      |
| **Aider**                       | Excellent git-aware terminal pair programmer with lightweight Python runtime.   | Monolithic loop design focused primarily on direct file edits; lacks a modular plugin microkernel and visual trajectory inspector. |
| **OpenAI Operator / Codex CLI** | Tight ecosystem alignment with OpenAI enterprise models and tooling.            | Rigid vendor boundaries; cannot natively delegate tasks to alternate model architectures or custom on-premise LLMs.                |

## 🚪 6. Tool-Specific Deprecation Triggers

- **Trigger 1**: If the upstream project introduces proprietary lock-ins or deprecates the Cordis open plugin architecture in favor of a closed SaaS control plane.
- **Trigger 2**: If major language server protocols (LSP) and IDE toolchains natively integrate standardized, open agentic microkernels, making standalone harness daemons redundant.
- **Trigger 3**: If breaking changes between developer preview iterations fail to stabilize, resulting in a fractured and unmaintainable third-party plugin ecosystem.

## ⚡ 7. Quick Reference & Cheat Sheet

| Scenario                           | Command Pattern                                                                       |
| ---------------------------------- | ------------------------------------------------------------------------------------- |
| **Launch Local Web Interface**     | `dsh web --port 3080`                                                                 |
| **Run Headless Daemon (CI/SSH)**   | `dsh web --no-open --host 127.0.0.1`                                                  |
| **Execute Autonomous Batch Run**   | `dsh run --mode yolo --prompt "Refactor DB connection pool to use deadpool-postgres"` |
| **Inspect Plugin Trajectory Logs** | `dsh trajectory view --latest --filter="plugin:shell-sandbox"`                        |
| **Launch in Custom Creator Mode**  | `dsh mode creator --scaffold-plugin my-custom-linter`                                 |
| **Target Custom LLM Endpoint**     | `dsh --model openrouter/deepseek-v3.1 --api-key $OPENROUTER_KEY`                      |
