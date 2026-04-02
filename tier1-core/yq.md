---
type: toolchain
name: yq
language: Go
license: MIT
tags: [cli, yaml, processor, json]
added_date: 2026-04-01
---

# 🧰 yq - A portable command-line YAML, JSON, XML, CSV, TOML and properties processor

## 📝 1. Description

- **Core Use Case**: Programmatic manipulation, querying, and conversion of YAML and other structured data formats using a syntax compatible with `jq`.
- **Official Description**: "yq is a portable command-line YAML, JSON, XML, CSV, TOML and properties processor. It likes jq but for YAML/XML/TOML/etc."
- **Official Website**: [https://mikefarah.gitbook.io/yq/](https://mikefarah.gitbook.io/yq/)
- **Repository**: [https://github.com/mikefarah/yq](https://github.com/mikefarah/yq)
- **Build/Architecture Trait**: Statically linked Go binary (no external dependencies).
- **Activity Status**: High. Frequent releases, robust community adoption, and rapid resolution of issues regarding schema edge cases (e.g., YAML 1.2 nuances).

## ⚙️ 2. Recommended Installation Strategy

_(Rationale: As a Go-based tool, yq is best consumed as a single static binary to avoid conflicts with Python-based "yq" wrappers. Arch Linux's official repo provides the Go version, and Scoop handles the shim/path management on Windows perfectly.)_

### Linux (Arch Linux Optimized)

```bash
# Official Arch Community repository provides the Mike Farah (Go) version
sudo pacman -S yq
```

### Windows

```powershell
# Isolated installation via Scoop to avoid PATH pollution
scoop install yq
```

### Podman/WSL (If containerization is optimal)

```bash
# Useful for CI/CD pipelines where a local Go binary is not permitted
podman run --rm -v "${PWD}":/workdir mikefarah/yq [eval/command] [file]
```

## 📊 3. Standardized Capability Matrix

- **Performance & Resource Efficiency**: ⭐⭐⭐⭐⭐ - Near-instant execution; significantly faster than Python-based alternatives for large Kubernetes manifests.
- **Usability & Learning Curve**: ⭐⭐⭐⭐ - High for `jq` users; others may find the "path" syntax slightly abstract initially, but the documentation is excellent.
- **Ecosystem & Interoperability**: ⭐⭐⭐⭐⭐ - Handles YAML, JSON, XML, and TOML natively, making it the "Swiss Army Knife" of config migration.
- **Cross-Platform Consistency**: ⭐⭐⭐⭐⭐ - Behaves identically across Linux, macOS, and Windows due to the Go runtime.
- **Maintainability & Security**: ⭐⭐⭐⭐⭐ - Static binary reduces the attack surface; minimal runtime dependencies mean zero "dependency hell."

## 💡 4. Core Rationales for Adoption

1. **Format Agnosticism**: Unlike the original `jq`, `yq` allows for seamless conversion between formats (e.g., XML to JSON, YAML to TOML) using a single tool. This simplifies toolchains by removing the need for multiple specialized parsers.
2. **Schema Preservation**: `yq` is designed to preserve YAML comments and styling (indentation) during transformation. This is a strategic advantage for GitOps workflows where human-readable diffs in infrastructure-as-code are critical.
3. **Architectural Simplicity**: Being a single Go binary, it is trivial to inject into minimal CI/CD runners (like Alpine or Distroless) without managing a Python/Node runtime environment.

## ⚔️ 5. Competitor Landscape

| Competitor              | Primary Strength                   | Reason for Rejection / Deprioritization                                                     |
| :---------------------- | :--------------------------------- | :------------------------------------------------------------------------------------------ |
| **python-yq (kislyuk)** | Direct wrapper of `jq`.            | Requires a Python interpreter and `jq` binary; fails to preserve YAML comments reliably.    |
| **dasel**               | Extremely fast; zero dependencies. | Smaller community; syntax is less standardized than the `jq`-like expressions used by `yq`. |
| **jq**                  | Industry standard for JSON.        | Does not support YAML/TOML/XML; requires external conversion pre-processors.                |

## 🚪 6. Tool-Specific Deprecation Triggers

- **Trigger 1**: If a significant shift toward a new configuration standard (e.g., Type-safe CUE or Nickel) renders schema-less YAML manipulation obsolete in your stack.
- **Trigger 2**: If the `jq` project adopts native YAML 1.2 support with comment preservation, making a separate Go wrapper redundant.
- **Trigger 3**: If your architecture moves entirely to "Pulumi-style" infrastructure-as-code where configurations are strictly objects in a general-purpose programming language (TS/Python/Go) rather than static files.

## ⚡ 7. Quick Reference & Cheat Sheet

| Scenario                    | Command Pattern                                                                      |
| :-------------------------- | :----------------------------------------------------------------------------------- |
| **Read Value**              | `yq '.servers[0].url' config.yaml`                                                   |
| **Update Value (In-place)** | `yq -i '.metadata.labels.env = "prod"' deploy.yaml`                                  |
| **Convert YAML to JSON**    | `yq -o=json '.' input.yaml > output.json`                                            |
| **Merge Multiple Files**    | `yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' base.yaml patch.yaml` |
| **Deep Search (Recursive)** | `yq '..`                                                                             |
| **Extract XML to YAML**     | `yq -p=xml -o=yaml '.' data.xml`                                                     |
