<div align="center">

```
  ╔══════════════════════════════════════════════════════════╗
  ║                                                          ║
  ║    ⚡ BandwagonHost Speed Test                           ║
  ║    搬瓦工全球机房一键测速                                ║
  ║                                                          ║
  ╚══════════════════════════════════════════════════════════╝
```

**One-click speed test for all BandwagonHost (搬瓦工) data centers worldwide.**

Find your fastest datacenter in seconds — CN2 GIA, Hong Kong, Japan, US, Dubai.

[![Shell](https://img.shields.io/badge/Shell-Bash-green?logo=gnu-bash&logoColor=white)](test.sh)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/devguoo/bwg-speed-test?style=social)](https://github.com/devguoo/bwg-speed-test/stargazers)

</div>

---

## ⚡ Quick Start

**One command. No installation. Works on any Linux server, macOS, or WSL.**

```bash
curl -fsSL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/test.sh | bash
```

Verbose mode (shows individual ping times & packet loss):

```bash
curl -fsSL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/test.sh | bash -s -- -v
```

Or clone and run locally:

```bash
git clone https://github.com/devguoo/bwg-speed-test.git
cd bwg-speed-test
./test.sh
```

---

## 📡 Latest Real-World Route Snapshot

<!-- AUTO-UPDATE-START: speed-results -->
Latest manual snapshot from Changchun Telecom: **2026-04-15 03:35 CST**

- HKHK_8 (CMI): **72.1ms** — best route, big improvement
- Tokyo (CN2 GIA): **196.3ms** — stable
- DC6 (CN2 GIA-E): **229.5ms** — recovered to prior range
- DC4 (MCOM): **230.7ms** — reachable again, but jittery
- DC2 (QN): **279.7ms** — reachable, clearly slower
- DC9 (CN2 GIA): **unreachable** in this sample
<!-- AUTO-UPDATE-END: speed-results -->

Full notes: [LATEST.md](LATEST.md)

---

## ✨ Features

- 🌍 **13 datacenters** — Tests all BandwagonHost locations worldwide
- 📡 **ICMP ping** — 4-packet average for reliable latency measurement
- 📊 **Sorted results** — Lowest latency first, fastest highlighted with 🏆
- 🎨 **Color-coded output** — Green/yellow/red status at a glance
- 🔧 **Zero dependencies** — Pure Bash, needs only `ping`
- 🖥️ **Cross-platform** — Linux, macOS, WSL
- 🌐 **IPv6 aware** — Automatically skips IPv6 targets if unsupported
- 📋 **Verbose mode** — `-v` flag shows individual ping times & packet loss

---

## 📋 Output Example

```
  ╔══════════════════════════════════════════════════════════╗
  ║                                                          ║
  ║    ⚡ BandwagonHost Speed Test                           ║
  ║    搬瓦工全球机房一键测速                                ║
  ║                                                          ║
  ║    github.com/devguoo/bwg-speed-test                     ║
  ║                                                          ║
  ╚══════════════════════════════════════════════════════════╝

  Testing 13 datacenters...

  [ 1/13] DC2 QNET                      Los Angeles        152.34 ms
  [ 2/13] DC3 CN2                        Los Angeles        148.21 ms
  ...

  ─────────────────────────────────────────────────────────
  📊 Results (sorted by latency, lowest first)
  ─────────────────────────────────────────────────────────

  Datacenter                    Location            Latency  Status
  ──────────────────────────    ────────────────    ────────  ──────────────
  Hong Kong CN2 GIA             Hong Kong           42.5 ms  🏆 Fastest!
  Dubai                         Dubai, UAE          65.3 ms  ● Great
  Japan Osaka Softbank          Osaka, Japan       102.8 ms  ● Good
  DC6 CN2 GIA-E                 Los Angeles        148.2 ms  ● Good
  DC3 CN2                       Los Angeles        152.3 ms  ● Good
  DC9 CN2 GIA                   Los Angeles        155.1 ms  ● Good
  DC2 QNET                      Los Angeles        158.7 ms  ● Good
  DC8 ZNET                      Los Angeles        162.4 ms  ● Good
  DC4 MCOM                      Los Angeles        165.9 ms  ● Good
  Fremont                       Fremont, CA        172.3 ms  ● Good
  New Jersey                    New Jersey         238.5 ms  ● Fair
  New York                      New York           245.1 ms  ● Fair
  Japan Tokyo CN2 GIA           Tokyo, Japan             —   ⊘ Skipped (IPv6)

  💡 还没有搬瓦工？查看购买指南 → https://www.bwhhost.com
  📊 更多 VPS 速度评测 → https://www.vps-best.com
```

> ⚠️ Sample output for illustration. Your actual results will vary by location and ISP.

---

## 🗺️ Supported Datacenters

| # | Datacenter | Location | Test IP | Protocol |
|---|-----------|----------|---------|----------|
| 1 | DC2 QNET | Los Angeles, US | `104.194.76.1` | IPv4 |
| 2 | DC3 CN2 | Los Angeles, US | `23.252.96.1` | IPv4 |
| 3 | DC4 MCOM | Los Angeles, US | `98.142.136.1` | IPv4 |
| 4 | DC6 CN2 GIA-E | Los Angeles, US | `162.244.241.103` | IPv4 |
| 5 | DC8 ZNET | Los Angeles, US | `65.49.128.1` | IPv4 |
| 6 | DC9 CN2 GIA | Los Angeles, US | `65.49.135.97` | IPv4 |
| 7 | Fremont | Fremont, CA, US | `184.106.214.1` | IPv4 |
| 8 | New Jersey | New Jersey, US | `23.29.138.5` | IPv4 |
| 9 | New York | New York, US | `208.167.227.1` | IPv4 |
| 10 | Japan Osaka Softbank | Osaka, Japan | `185.212.59.1` | IPv4 |
| 11 | Japan Tokyo CN2 GIA | Tokyo, Japan | `2607:f130:0:17e::3b2a` | IPv6 |
| 12 | Hong Kong CN2 GIA | Hong Kong | `93.179.124.161` | IPv4 |
| 13 | Dubai | Dubai, UAE | `45.154.3.1` | IPv4 |

---

## ❓ FAQ

**Q: What does this script actually do?**
A: It sends ICMP ping packets (4 pings per datacenter) to each BandwagonHost test IP and measures the average round-trip time.

**Q: Is it safe to run via `curl | bash`?**
A: The script is open source — you can [inspect it here](test.sh) before running. It only uses `ping` and standard shell utilities. No data is collected or sent anywhere.

**Q: Why is a datacenter showing "Timeout"?**
A: Some datacenters may block ICMP from certain networks, or there may be routing issues. This doesn't necessarily mean the datacenter is down.

**Q: What about the IPv6 datacenter (Tokyo CN2 GIA)?**
A: The script auto-detects IPv6 support. If your server doesn't have IPv6 connectivity, Tokyo CN2 GIA will be skipped automatically.

**Q: Can I run this on macOS?**
A: Yes! The script works on Linux, macOS, and WSL.

**Q: How do I choose the right datacenter?**
A: Run this test from your target server's network. The lowest latency datacenter is generally the best choice for your location.

---

## ⭐ Star History

If you find this useful, give it a Star! It helps others discover the tool.

[![Star History Chart](https://api.star-history.com/svg?repos=devguoo/bwg-speed-test&type=Date)](https://star-history.com/#devguoo/bwg-speed-test&Date)

---

## 📚 Related Resources

- 💡 搬瓦工购买指南和方案对比 → [bwhhost.com](https://www.bwhhost.com)
- 📊 VPS 速度评测与推荐 → [vps-best.com](https://www.vps-best.com)
- 🌐 搬瓦工中文教程 → [world-vps.com](https://www.world-vps.com)

---

## 📝 Topics

`bandwagonhost` `bwg` `speed-test` `ping-test` `vps` `cn2-gia` `datacenter` `latency` `network-tools` `server-tools` `china-optimized` `bash-script` `one-click` `hong-kong` `japan` `los-angeles` `linux-tools` `devops` `cloud` `benchmark`

---

## License

[MIT](LICENSE) — Use it, fork it, improve it.

---

> 📅 Last maintained: 2026-04-26
