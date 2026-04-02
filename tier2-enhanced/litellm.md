---
type: toolchain
name: LiteLLM
language: Python
license: MIT
tags: [ai, proxy, gateway, llm-ops, backend]
added_date: 2026-04-02
---

# 🧰 LiteLLM - The universal adapter for 100+ LLMs with OpenAI-compatible output.

## 📝 1. Description

- **Core Use Case**: Acting as a centralized gateway or SDK to call any LLM provider (OpenAI, Anthropic, VertexAI, Bedrock, etc.) using the standardized OpenAI input/output format.
- **Official Description**: "Call 100+ LLMs using the OpenAI Input/Output Format. Use LiteLLM to simplify your LLM integrations."
- **Official Website**: [https://www.litellm.ai/](https://www.litellm.ai/)
- **Repository**: [https://github.com/BerriAI/litellm](https://github.com/BerriAI/litellm)
- **Build/Architecture Trait**: Python-based proxy server or library. It can be deployed as a standalone high-performance gateway or imported as a lightweight SDK.
- **Activity Status**: **Highly Active / Under Security Scrutiny**. As of **March 24, 2026**, LiteLLM experienced a major supply chain compromise (v1.82.7 and v1.82.8 were backdoored on PyPI). The team has since reclaimed the project, and version **1.82.6** or the latest post-incident patches are currently considered the stable path forward.

## ⚙️ 2. Recommended Installation Strategy

_(Rationale: Due to the recent 2026 supply chain incident, **strict version pinning** and **hash verification** are mandatory. Using `uv` ensures reproducible environments with built-in speed and safer dependency resolution.)_

### Linux (Arch Linux Optimized)

```bash
# Install litellm using uv with strict version pinning
# The --require-hashes flag ensures the package matches the 2026 security baseline
uv pip install litellm==1.82.6 \
    --require-hashes \
    --verify-hashes
```

### Windows

```powershell
# Use uv for rapid, isolated environment management
# This avoids 'externally-managed-environment' errors and keeps the host clean
uv pip install litellm==1.82.6 --require-hashes
```

### Podman/WSL (Recommended Deployment)

```bash
# Run the official proxy using Podman for network and resource isolation
# This is the safest way to deploy the gateway in 2026
podman run -d \
  --name litellm-proxy \
  -v $(pwd)/config.yaml:/app/config.yaml \
  -p 4000:4000 \
  ghcr.io/berriai/litellm:main-latest \
  --config /app/config.yaml
```

## 📊 3. Standardized Capability Matrix

- **Performance & Resource Efficiency**: ⭐⭐⭐ - Being Python-based, it introduces roughly 5-10ms of overhead. High-concurrency environments may require scaling multiple instances behind a load balancer.
- **Usability & Learning Curve**: ⭐⭐⭐⭐⭐ - If you know the OpenAI API, you already know LiteLLM. Integration takes minutes.
- **Ecosystem & Interoperability**: ⭐⭐⭐⭐⭐ - Unrivaled support for obscure and enterprise providers (Azure, IBM WatsonX, AWS Bedrock).
- **Cross-Platform Consistency**: ⭐⭐⭐⭐⭐ - Runs anywhere Python or Containers run.
- **Maintainability & Security**: ⭐⭐⭐ - While MIT licensed and easy to fork, the recent March 2026 PyPI compromise highlights a need for rigorous dependency auditing in your toolchain.

## 💡 4. Core Rationales for Adoption

1. **Provider Agnostic Infrastructure**: Switch from `gpt-5` to `claude-4-sonnet` by changing a single line in a YAML config, without touching your application code.
2. **Enterprise Features for Free**: Built-in support for **Rate Limiting**, **Fallbacks** (if OpenAI is down, automatically use Anthropic), and **Cost Tracking** across all providers.
3. **Unified Logging**: Pipes logs from every model into one format for tools like Langfuse, Helicone, or standard Prometheus/Grafana stacks.

## ⚔️ 5. Competitor Landscape

| Competitor          | Primary Strength           | Reason for Rejection / Deprioritization                                        |
| :------------------ | :------------------------- | :----------------------------------------------------------------------------- |
| **Bifrost**         | Go-based; <1ms latency.    | Smaller provider ecosystem; harder to customize with Python hooks.             |
| **Portkey**         | Full-stack Observability.  | SaaS-heavy; more "opinionated" than the lightweight LiteLLM proxy.             |
| **Kong AI Gateway** | Enterprise API management. | Overkill for many AI-specific projects; requires existing Kong infrastructure. |

## 🚪 6. Tool-Specific Deprecation Triggers

- **Trigger 1**: **Security Recurrence**: If another supply chain compromise occurs within 6 months, signaling systemic failure in the project's CI/CD security.
- **Trigger 2**: If major providers (OpenAI/Anthropic) release a native "Multi-Model Proxy" protocol that becomes a web standard.
- **Trigger 3**: If the latency overhead exceeds 50ms due to feature bloat, making it unsuitable for real-time agentic workflows.

## ⚡ 7. Quick Reference & Cheat Sheet

| Scenario                        | Command Pattern                                                         |
| :------------------------------ | :---------------------------------------------------------------------- |
| **Spin up Proxy (Quick)**       | `litellm --model anthropic/claude-3-5-sonnet`                           |
| **Unified Completion (Python)** | `response = completion(model="azure/gpt-4", messages=...)`              |
| **Test Config**                 | `litellm --config config.yaml --test`                                   |
| **Check Cost**                  | `curl http://localhost:4000/key/info -H "Authorization: Bearer sk-..."` |
| **Add Fallbacks**               | Set `fallbacks: [{"gpt-4o": ["claude-3-5-sonnet"]}]` in config.         |

> [!CAUTION]
> **Security Advisory (April 2026):** Ensure your environment does not have `litellm` versions `1.82.7` or `1.82.8` installed. If found, rotate all API keys immediately and audit for lateral movement in your Kubernetes/AWS environment.
