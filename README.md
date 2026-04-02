# 🧰 Digital Arsenal (Toolchain as Code)

A highly opinionated collection of development tools and environment configurations, defined by my personal standards and organized by deployment rings.

## 🏗️ Tier Definition

- **Tier 1 (Core)**: Mission-critical tools. Must be installed on any new machine.
- **Tier 2 (Enhanced)**: Daily drivers for productivity and deep debugging.
- **Tier 3 (Specific)**: Domain-specific or heavy tools, installed on demand.
- **legacy**: Tools once loved but now replaced, kept for the record.

## 📝 Tool Metadata Schema

Every `.md` file must contain a YAML frontmatter:

```yaml
---
type: toolchain
name: [Tool Name]
language: [e.g., Rust, Go, Python, C++]
license: [e.g., MIT, GPL-3.0, Apache-2.0, Proprietary]
tags: [e.g., cli, search, performance]
added_date: [Auto-generate current date, YYYY-MM-DD format]
---
```

## 💡 How to Commit:

### 🛠️ For Tool Management

- `add: [tool-name] to tier1` (Adding a new tool)
- `update: [tool-name] installation command` (Changing a script)
- `move: [tool-name] from tier2 to tier1` (Recategorizing)
- `remove: [tool-name] from arsenal` (Deleting a tool)

### ⚙️ For Infrastructure/Scripts

- `refactor: simplify manage.sh validation logic`
- `fix: regex in generate_install.sh for spaces`
- `ci: update github action to remove yq`
- `docs: update README with new tier definitions`

### 🤖 For Automated Commits (Used in your CI)

- `chore: auto-sync generated setup scripts`
- `chore: regenerate installation artifacts`
