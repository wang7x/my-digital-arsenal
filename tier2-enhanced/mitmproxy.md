---
type: toolchain
name: mitmproxy
language: Python
license: MIT
tags: [proxy, security, networking, interactive, debugging]
added_date: 2026-04-02
---

# 🧰 mitmproxy - The Swiss Army knife for HTTP/HTTPS traffic interception.

## 📝 1. Description

- **Core Use Case**: Acts as an intermediate "Man-in-the-Middle" to intercept, inspect, modify, and replay HTTP/1, HTTP/2, HTTP/3 (QUIC), and WebSocket traffic.
- **Official Description**: "A free and open source interactive HTTPS proxy."
- **Official Website**: [https://mitmproxy.org/](https://mitmproxy.org/)
- **Repository**: [https://github.com/mitmproxy/mitmproxy](https://github.com/mitmproxy/mitmproxy)
- **Build/Architecture Trait**: Python-based core with a high-performance Rust-based network stack (`mitmproxy-rs`). It offers three distinct interfaces: `mitmproxy` (Console), `mitmweb` (Web UI), and `mitmdump` (Command-line).
- **Activity Status**: **Hyper-Active**. As of 2026, it remains the gold standard for open-source proxying, with robust support for the latest TLS 1.3 and HTTP/3 standards.

## ⚙️ 2. Recommended Installation Strategy

_(Rationale: Since mitmproxy is Python-based but requires specific environment isolation to avoid dependency conflicts with system tools, using `uvx` is the most modern and efficient approach. It ensures the tool runs in its own ephemeral environment with near-instant startup.)_

### Linux (Arch Linux Optimized)

```bash
# Recommended: Isolated execution via uv (no global pollution)
uvx mitmproxy

# Alternative: Official Arch Linux community package
sudo pacman -S mitmproxy
```

### Windows

```powershell
# Isolated installation via Scoop
scoop install mitmproxy

# Recommended: Use Windows Terminal for best console UI rendering
```

### Podman/WSL (Containerized Deployment)

```bash
# Deployment for headless/automated environments
podman run --rm -it -p 8080:8080 mitmproxy/mitmproxy mitmdump
```

## 📊 3. Standardized Capability Matrix

- **Performance & Resource Efficiency**: ⭐⭐⭐⭐ - Significant improvements in 2026 due to the Rust-powered core, though Python overhead remains during complex script execution.
- **Usability & Learning Curve**: ⭐⭐⭐⭐ - The `mitmweb` interface is as intuitive as Chrome DevTools, while the `mitmproxy` console has a steeper, keyboard-driven curve.
- **Ecosystem & Interoperability**: ⭐⭐⭐⭐⭐ - Exceptional Python API for scripting; integrates perfectly with penetration testing tools like Frida and Objection.
- **Cross-Platform Consistency**: ⭐⭐⭐⭐⭐ - Identical functionality across Linux, macOS, and Windows.
- **Maintainability & Security**: ⭐⭐⭐⭐⭐ - Highly transparent MIT-licensed codebase with rapid security patching for new CVEs.

## 💡 4. Core Rationales for Adoption

1. **Unrivaled Scriptability**: Unlike GUI-bound proxies, mitmproxy allows you to write simple Python scripts to automate traffic manipulation (e.g., "Always inject this Auth header into requests to `api.dev.com`").
2. **Transparent Proxying**: Can be configured at the network level (using `iptables` or `nftables`) to intercept traffic from devices that don't support manual proxy settings, such as IoT hardware.
3. **Modern Protocol Support**: One of the few tools that handles the complexity of HTTP/3 and QUIC natively, ensuring visibility into the most modern mobile and web application stacks.

## ⚔️ 5. Competitor Landscape

| Competitor          | Primary Strength  | Reason for Rejection / Deprioritization                                                                           |
| :------------------ | :---------------- | :---------------------------------------------------------------------------------------------------------------- |
| **Fiddler Classic** | Windows-native UI | **Proprietary/Heavy.** Limited scripting compared to Python; Linux/macOS versions are less stable.                |
| **Burp Suite**      | Security auditing | **Expensive.** Professional version is costly; Free version throttles critical features like manual interception. |
| **Charles Proxy**   | User-friendly UI  | **Paid.** Slower release cycle for modern protocols like HTTP/3.                                                  |

## 🚪 6. Tool-Specific Deprecation Triggers

- **Trigger 1**: If browsers or mobile OSs enforce "Certificate Transparency" or "ECH" (Encrypted Client Hello) in a way that makes local CA injection fundamentally impossible.
- **Trigger 2**: If the project fails to maintain parity with the `mitmproxy-rs` Rust core, leading to performance bottlenecks on 10Gbps+ network links.
- **Trigger 3**: A shift toward mandatory eBPF-based traffic monitoring that renders traditional user-space proxies obsolete.

## ⚡ 7. Quick Reference & Cheat Sheet

| Scenario                  | Command / Key Binding                            |
| :------------------------ | :----------------------------------------------- |
| **Start Web Interface**   | `mitmweb`                                        |
| **Save Traffic to File**  | `mitmdump -w traffic.flow`                       |
| **Filter by Domain**      | Press `f`, then type `~d example.com`            |
| **Intercept (Pause)**     | Press `i`, then type `~u /api/v1`                |
| **Run Python Script**     | `mitmproxy -s filter_and_modify.py`              |
| **View Flows in Console** | Use `j`/`k` to navigate, `Enter` to view details |
| **Replay a Request**      | Press `r` on a focused flow                      |

---

> To intercept HTTPS on mobile, you _must_ visit `mitm.it` on the target device after setting the proxy to download and trust the mitmproxy CA certificate. On Android 11+, this often requires installing the cert as a **System** certificate via root or using a tool like _MagiskTrustUserCerts_.
