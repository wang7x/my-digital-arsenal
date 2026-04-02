---
type: toolchain
name: Maple Mono (Normal NL NF CN Variant)
language: Font (N/A)
license: OFL-1.1
tags: [font, monospace, nerd-font, cjk, typography]
added_date: 2026-04-02
---

# 🧰 Maple Mono - A modern, rounded monospace font optimized for the global developer.

## 📝 1. Description

- **Core Use Case**: High-legibility coding and terminal environment, specifically designed to handle English and Chinese (CJK) characters with a consistent 2:1 width ratio.
- **Official Description**: "Open source monospace font with round corner, ligatures and Nerd-Font icons for IDE and terminal, fine-grained customization options."
- **Official Website**: [https://font.subf.dev/](https://font.subf.dev/)
- **Repository**: [https://github.com/subframe7536/maple-font](https://github.com/subframe7536/maple-font)
- **Build/Architecture Trait**: Multi-variant font family (TTF/OTF/WOFF2). The **Normal NL NF CN** variant specifically refers to:
  - **Normal**: Standard character width/spacing.
  - **NL**: No Ligatures (essential for users who find `=>` or `==` transforms distracting).
  - **NF**: Nerd Font integrated (built-in icons like , , ).
  - **CN**: Chinese language optimization (proper CJK glyph coverage and alignment).
- **Activity Status**: **Hyper-Active**. Version 7.x (late 2025/early 2026) introduced significant rendering improvements and variable font support.

## ⚙️ 2. Recommended Installation Strategy

_(Rationale: Fonts are system-level assets but should be managed via package managers to ensure clean uninstalls and updates without manual cache rebuilding or path pollution.)_

### Linux (Arch Linux Optimized)

```bash
# Install the specific Nerd Font + CN variant from the AUR
yay -S maple-mono-nf-cn-unhinted

# Alternatively, for the 'Normal' style (standard ligatures enabled)
# yay -S maple-mono-normal-nf-cn
```

### Windows

```powershell
# Use Scoop's 'nerd-fonts' bucket for seamless integration
scoop bucket add nerd-fonts
scoop install Maple-Mono-NF-CN

# Note: For the 'NL' (No Ligature) variant, manual download from
# GitHub Releases is often required if the Scoop manifest isn't granular.
```

### Font Cache Refresh (Post-Install)

```bash
# Linux only: Force a refresh of the font cache
fc-cache -fv
```

## 📊 3. Standardized Capability Matrix

- **Performance & Resource Efficiency**: ⭐⭐⭐⭐⭐ - Highly optimized glyph outlines; minimal memory impact even with the massive CJK character set.
- **Usability & Learning Curve**: ⭐⭐⭐⭐⭐ - Instant visual upgrade. The "round corner" design reduces eye fatigue during long sessions.
- **Ecosystem & Interoperability**: ⭐⭐⭐⭐⭐ - Flawless integration with modern terminals (Alacritty, Kitty, WezTerm) and IDEs (VS Code, JetBrains).
- **Cross-Platform Consistency**: ⭐⭐⭐⭐⭐ - Identical rendering on Linux, macOS, and Windows thanks to careful hinting.
- **Maintainability & Security**: ⭐⭐⭐⭐ - Solid OFL licensing. Managed by a dedicated developer with strong community feedback loops.

## 💡 4. Core Rationales for Adoption

1.  **Perfect CJK Alignment**: Most monospace fonts break their grid when displaying Chinese characters. Maple Mono's **CN** variant maintains a strict 2:1 ratio, ensuring that code indentation remains perfectly aligned regardless of comments or strings in Chinese.
2.  **"No Ligature" Clarity**: While ligatures (like `->` turning into an arrow) are trendy, the **NL** variant is a strategic choice for technical rigor, ensuring the user sees exactly what is typed—critical for debugging and regex work.
3.  **Hybrid Aesthetics**: It bridges the gap between the professional rigidity of _JetBrains Mono_ and the cursive warmth of _Operator Mono_, providing a "best of both worlds" aesthetic that feels modern without being unprofessional.

## ⚔️ 5. Competitor Landscape

| Competitor         | Primary Strength          | Reason for Rejection / Deprioritization                                                         |
| :----------------- | :------------------------ | :---------------------------------------------------------------------------------------------- |
| **Sarasa Gothic**  | Industry standard for CJK | Lacks the distinctive "rounded" personality of Maple; Nerd Font integration is often secondary. |
| **JetBrains Mono** | Exceptional readability   | CJK support is handled by fallbacks, which often leads to inconsistent vertical alignment.      |
| **Fira Code**      | Pioneer of ligatures      | Its "NL" (No Ligature) options are less refined than Maple's native NL builds.                  |

## 🚪 6. Tool-Specific Deprecation Triggers

- **Trigger 1**: If the project stops merging upstream Nerd Font icon updates for more than two major release cycles.
- **Trigger 2**: If a major breaking change in the OS font engine (e.g., Windows 11 font rendering engine shift) causes the "round corners" to alias poorly.
- **Trigger 3**: Emergence of a "Universal Variable Font" that handles CJK and icons with better compression/performance than Maple's static variants.

## ⚡ 7. Quick Reference & Cheat Sheet

| Scenario               | Configuration Setting (Example)                               |
| :--------------------- | :------------------------------------------------------------ | ------------- |
| **Zed Setting**        | `"buffer_font_family": "Maple Mono Normal NL NF CN"`          |
| **VS Code Setting**    | `"editor.fontFamily": "'Maple Mono NF CN', monospace"`        |
| **WezTerm Config**     | `config.font = wezterm.font 'Maple Mono NF CN'`               |
| **Check Installation** | `fc-list : family                                             | grep "Maple"` |
| **Feature Check**      | Use `otffonts.com` to verify `calt` and `ss01-ss05` features. |
