---
type: toolchain
name: dust
language: Rust
license: Apache-2.0
tags: [cli, disk-usage, rust, visualization]
added_date: 2026-04-05
---

# 🧰 dust - A more intuitive, graphical version of `du` in Rust

## 📝 1. Description

- **Core Use Case**: Provides an instant, visual overview of disk space distribution within a directory tree, eliminating the need for piping `du` into `sort` or `head`.
- **Official Description**: "dust is a tool that provides a file's type and metadata. It will report a directory's disk utilization in a couple of ways, providing a very informative graph that tells you which folder is using the most disk space."
- **Official Website**: [https://github.com/bootandy/dust](https://github.com/bootandy/dust)
- **Repository**: [https://github.com/bootandy/dust](https://github.com/bootandy/dust)
- **Build/Architecture Trait**: Statically linked Rust binary. Parallelized directory walking via `rayon`.
- **Activity Status**: **Stable/Maintained**. While the feature set for a disk utility is naturally finite, `dust` remains a staple of the Rust rewrite movement, with regular maintenance updates (latest stable v1.1.x series) to ensure compatibility with modern filesystems.

## ⚙️ 2. Recommended Installation Strategy

_(Rationale: `dust` is a self-contained binary. Arch Linux includes it in the official repositories, which handles pathing and manpages perfectly. For Windows, Scoop provides a clean shim. While not traditionally "service-based," a Podman approach is useful for analyzing mapped volumes in rootless environments.)_

### Linux (Arch Linux Optimized)

```bash
# Official Arch Extra repository maintains the latest build
sudo pacman -S dust

# Common alias for standard du replacement
alias du='dust'
```

### Windows

```powershell
# Isolated installation via Scoop
scoop install dust
```

### Podman/WSL (If containerization is optimal)

```bash
# Analyze a host directory from a rootless container
podman run --rm -v $(pwd):/data:z alpine:latest sh -c "apk add dust && dust /data"
```

## 📊 3. Standardized Capability Matrix

- **Performance & Resource Efficiency**: ⭐⭐⭐⭐⭐ - Uses multi-threading to scan directories; significantly faster than standard `du` on high-core systems.
- **Usability & Learning Curve**: ⭐⭐⭐⭐⭐ - No flags required for basic use. The terminal-based bar charts are instantly readable.
- **Ecosystem & Interoperability**: ⭐⭐⭐⭐ - Works as a standard CLI tool; output can be simplified for scripting, though it's primarily designed for human eyes.
- **Cross-Platform Consistency**: ⭐⭐⭐⭐⭐ - Works identically across Linux, macOS, and Windows.
- **Maintainability & Security**: ⭐⭐⭐⭐⭐ - Simple codebase, minimal dependencies, and memory-safe due to Rust.

## 💡 4. Core Rationales for Adoption

1. **Information Hierarchy**: Unlike `du -h`, which lists files chronologically or alphabetically, `dust` automatically bubbles the largest directories to the bottom (closest to your prompt) and uses ASCII bars to show relative size.
2. **Smart Recursion**: It intelligently decides how deep to go based on terminal height, showing you the "big hitters" without overwhelming you with thousands of lines of tiny files.
3. **Parallel Traversal**: On modern SSDs and NVMe drives, `dust`'s multi-threaded approach can scan deep hierarchies (like a `node_modules` or a massive C++ build folder) much faster than the single-threaded POSIX `du`.

## ⚔️ 5. Competitor Landscape

| Competitor         | Primary Strength          | Reason for Rejection / Deprioritization                                                                                      |
| :----------------- | :------------------------ | :--------------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| **du (coreutils)** | Pre-installed everywhere. | Output is hard to read; requires `du -h                                                                                      | sort -h` to be useful. |
| **ncdu**           | Interactive TUI.          | Excellent for _deleting_ files, but `dust` is better for a quick "glance" at a directory without entering a full-screen app. |
| **diskus**         | Faster than dust.         | Extremely minimal; lacks the visual tree and bar charts that make `dust` useful for analysis.                                |

## 🚪 6. Tool-Specific Deprecation Triggers

- **Trigger 1**: If **ncdu** or **diskus** adopt a "non-interactive" graphical tree mode that surpasses `dust`'s readability.
- **Trigger 2**: If modern filesystems (like Btrfs or ZFS) provide a near-instant metadata-based "top-X largest folders" API that renders manual scanning obsolete.
- **Trigger 3**: If you move toward a "Cloud Native" storage model (S3, EFS) where local disk utilities cannot accurately represent usage or costs.

## ⚡ 7. Quick Reference & Cheat Sheet

| Scenario             | Command Pattern                                 |
| :------------------- | :---------------------------------------------- |
| **Standard View**    | `dust`                                          |
| **Specific Depth**   | `dust -d 2`                                     |
| **Ignore Content**   | `dust -X .git` (Ignore folders)                 |
| **Show Only Top 10** | `dust -n 10`                                    |
| **Full Path View**   | `dust -p` (Show full paths instead of relative) |
