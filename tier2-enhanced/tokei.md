---
type: toolchain
name: tokei
language: Rust
license: MIT / Apache-2.0
tags: [cli, utility, statistics, code-analysis, rust]
added\_date: 2026-04-05
---

# 🧰 tokei - The high-performance code statistician for the modern terminal

## 📝 1. Description

- **Core Use Case**: Rapidly counts lines of code, comments, and blanks across massive codebases, providing grouped statistics by language.
- **Official Description**: "Tokei (時計) is a program that displays statistics about your code. Tokei will show the number of files, total lines within those files and code, comments, and blanks grouped by language."
- **Official Website**: [https://tokei.rs/](https://www.google.com/search?q=https://tokei.rs/)
- **Repository**: [https://github.com/XAMPPRocky/tokei](https://github.com/XAMPPRocky/tokei)
- **Build/Architecture Trait**: Statically linked Rust binary. Uses a state-machine based lexer rather than RegEx for accuracy.
- **Activity Status**: **Stable/Mature**. While the core feature set is complete, it remains the standard for performance-critical LOC counting in 2026, often used as a library by other tools (e.g., `git-loc`).

## ⚙️ 2. Recommended Installation Strategy

_(Rationale: `tokei` is a zero-dependency Rust binary. Arch Linux maintains a high-quality package in the official repos. For Windows, Scoop provides a clean shim. Podman is recommended for CI pipelines or environments where you want to analyze code without installing local toolchains.)_

### Linux (Arch Linux Optimized)

```bash
# Available in the official extra repository
sudo pacman -S tokei
```

### Windows

```powershell
# Clean user-space installation via Scoop
scoop install tokei
```

### Podman/WSL (If containerization is optimal)

```bash
# Analyze the current directory using the official Alpine-based image
podman run --rm -v $(pwd):/src:z -w /src xampprocky/tokei .
```

## 📊 3. Standardized Capability Matrix

- **Performance & Resource Efficiency**: ⭐⭐⭐⭐⭐ - Blazing fast; leverages Rust's concurrency to analyze millions of lines in milliseconds.
- **Usability & Learning Curve**: ⭐⭐⭐⭐⭐ - Simplistic CLI interface; honors `.gitignore` by default.
- **Ecosystem & Interoperability**: ⭐⭐⭐⭐⭐ - Supports 150+ languages and outputs in JSON, YAML, and CBOR for programmatic consumption.
- **Cross-Platform Consistency**: ⭐⭐⭐⭐⭐ - Identical behavior across all platforms.
- **Maintainability & Security**: ⭐⭐⭐⭐ - Mature codebase with minimal surface area for vulnerabilities.

## 💡 4. Core Rationales for Adoption

1.  **Accuracy over Heuristics**: Unlike older tools that use regular expressions, `tokei` uses a finite state machine. This allows it to correctly handle complex edge cases like nested comments and comment syntax inside string literals.
2.  **Library-First Design**: Beyond the CLI, `tokei` is a highly efficient Rust crate. This makes it the engine of choice for developers building custom dashboarding or CI/CD auditing tools.
3.  **Low-Friction Auditing**: By respecting `.gitignore` and `.ignore` files automatically, it provides a "real-world" count of your source code without including build artifacts or vendor bloat.

## ⚔️ 5. Competitor Landscape

| Competitor | Primary Strength         | Reason for Rejection / Deprioritization                                                                         |
| :--------- | :----------------------- | :-------------------------------------------------------------------------------------------------------------- |
| **cloc**   | Maximum ubiquity (Perl). | Significantly slower on large codebases; requires a Perl runtime.                                               |
| **scc**    | Complexity estimation.   | Excellent performance, but `tokei` remains the "cleaner" choice for pure line-counting and library integration. |
| **gocloc** | Go-based simplicity.     | Usually slower than `tokei` and supports fewer edge cases in language detection.                                |

## 🚪 6. Tool-Specific Deprecation Triggers

- **Trigger 1**: If the repository fails to support new, major programming languages or paradigms (e.g., highly specialized AI-generated DSLs) within a reasonable timeframe.
- **Trigger 2**: If **scc** (Sloc Cloc and Code) achieves a significant leap in "Dryness" or "COCOMO" accuracy that renders pure line counting obsolete for your project management.
- **Trigger 3**: If your development environment shifts entirely to a Cloud IDE (like GitHub Codespaces) where LOC metrics are natively integrated into the file explorer.

## ⚡ 7. Quick Reference & Cheat Sheet

| Scenario              | Command Pattern                |
| :-------------------- | :----------------------------- |
| **Basic Analysis**    | `tokei .`                      |
| **Sort by Code**      | `tokei . --sort code`          |
| **File-Level Detail** | `tokei . --files`              |
| **JSON Export**       | `tokei . -o json > stats.json` |
| **Exclude Folders**   | `tokei . --exclude tests/`     |
