# 搬瓦工测速工具 BandwagonHost Speed Test 🚀

一键测试搬瓦工全球 11 个机房延迟和速度，帮你选最快的节点。

[![GitHub stars](https://img.shields.io/github/stars/devguoo/bwg-speed-test?style=social)](https://github.com/devguoo/bwg-speed-test)
[![Last Commit](https://img.shields.io/github/last-commit/devguoo/bwg-speed-test)](https://github.com/devguoo/bwg-speed-test/commits/main)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> 💡 **推荐方案**：[搬瓦工 CN2 GIA-E](https://bwh81.net/aff.php?aff=77647&pid=87) — 电信双向 CN2 GIA，国内直连速度最佳。使用优惠码 `BWHCGLUKKB` 额外节省 6.78%。

---

## 📊 最新测速结果

<!-- AUTO-UPDATE-START: speed-results -->
| 机房 | 位置 | 线路 | Ping (ms) | 推荐度 |
|------|------|------|-----------|--------|
| DC6 USCA_6 | 洛杉矶 | CN2 GIA-E | ~150 | ⭐⭐⭐⭐⭐ |
| DC9 USCA_9 | 洛杉矶 | CN2 GIA | ~155 | ⭐⭐⭐⭐⭐ |
| 日本大阪 | 大阪 | CN2 GIA | ~90 | ⭐⭐⭐⭐⭐ |
| 日本东京 | 东京 | CN2 GIA | ~95 | ⭐⭐⭐⭐ |
| DC3 USCA_3 | 洛杉矶 | CN2 | ~170 | ⭐⭐⭐⭐ |
| DC8 USCA_8 | 洛杉矶 | CN2 | ~175 | ⭐⭐⭐⭐ |
| 香港 HKHK_8 | 香港 | CMI | ~45 | ⭐⭐⭐⭐ |
| 荷兰 EUNL_9 | 阿姆斯特丹 | 联通9929 | ~250 | ⭐⭐⭐ |
| DC2 USCA_2 | 洛杉矶 | QN | ~180 | ⭐⭐⭐ |
| DC4 USCA_4 | 洛杉矶 | MCOM | ~185 | ⭐⭐⭐ |
| 迪拜 AEDXB_1 | 迪拜 | — | ~300 | ⭐⭐ |

> 数据为参考值，实际延迟因地区和运营商而异。运行脚本获取你的实测数据 ↓
<!-- AUTO-UPDATE-END: speed-results -->

---

## ⚡ 快速开始

一行命令，直接跑：

```bash
bash <(curl -sL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/speed-test.sh)
```

或者克隆到本地：

```bash
git clone https://github.com/devguoo/bwg-speed-test.git
cd bwg-speed-test
./speed-test.sh
```

---

## ✨ 功能特性

- 🌍 覆盖搬瓦工全球 11 个机房（美国、日本、香港、荷兰、迪拜）
- 📡 自动 Ping 测试，3 次取平均，结果按延迟排序
- 🎨 彩色输出，延迟高低一目了然（绿色 <100ms / 黄色 <200ms / 红色 >200ms）
- 🏆 自动排名，推荐最佳机房
- 💡 内置选购建议和优惠码
- 🔧 纯 Bash，无依赖，Linux / macOS / WSL 通用

---

## 🗺️ 机房选择指南

不知道选哪个机房？看这里：

| 你的运营商 | 推荐机房 | 原因 |
|------------|----------|------|
| 电信 | DC6（CN2 GIA-E）| 双向 CN2 GIA，延迟最低 |
| 联通 | DC6 或 荷兰（联通9929）| 直连线路，稳定性好 |
| 移动 | DC6 或 香港（CMI）| CMI 对移动最友好 |
| 需要日本 IP | 大阪 / 东京 | CN2 GIA 线路，速度快 |
| 预算有限 | DC2/DC3（KVM PROMO）| 最低 $49.99/年起 |

### CN2 vs CN2 GIA vs CN2 GIA-E 有什么区别？

| 线路 | 说明 | 速度 | 价格 |
|------|------|------|------|
| CN2 | 电信 CN2 GT，去程普通/回程 CN2 | ★★★☆☆ | 便宜 |
| CN2 GIA | 电信双向 CN2 GIA | ★★★★★ | 较贵 |
| CN2 GIA-E | CN2 GIA 企业版，多机房可切换 | ★★★★★ | 性价比最高 |

简单说：**CN2 GIA-E 是目前性价比最高的选择**，电信双向 CN2 GIA 保证速度，还能在后台自由切换机房。

---

## 💰 方案推荐

我个人使用搬瓦工 CN2 GIA-E 方案，日常延迟 150ms 左右，稳定性不错。以下是各价位推荐：

### 首选 — CN2 GIA-E（DC6）

电信双向 CN2 GIA，联通/移动直连，支持切换到日本、香港、荷兰等机房。

| 方案 | 配置 | 流量/月 | 带宽 | 价格 | 链接 |
|------|------|---------|------|------|------|
| 20G CN2 GIA-E | 2核 1GB 20GB SSD | 1TB | 2.5Gbps | $49.99/季 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=87) |
| 40G CN2 GIA-E | 3核 2GB 40GB SSD | 2TB | 2.5Gbps | $89.99/季 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=88) |
| 80G CN2 GIA-E | 4核 4GB 80GB SSD | 3TB | 2.5Gbps | $55.99/月 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=89) |
| 160G CN2 GIA-E | 6核 8GB 160GB SSD | 5TB | 5Gbps | $109.99/月 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=90) |

### 预算方案 — KVM PROMO

多机房可选，购买后后台自由切换。适合预算有限的用户。

| 方案 | 配置 | 流量/月 | 带宽 | 价格 | 链接 |
|------|------|---------|------|------|------|
| 20G KVM | 2核 1GB 20GB SSD | 1TB | 1Gbps | $49.99/年 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=44) |
| 40G KVM | 3核 2GB 40GB SSD | 2TB | 1Gbps | $52.99/半年 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=45) |
| 80G KVM | 4核 4GB 80GB SSD | 3TB | 1Gbps | $19.99/月 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=46) |

### 日本 / 香港节点

| 方案 | 位置 | 配置 | 流量/月 | 价格 | 链接 |
|------|------|------|---------|------|------|
| 40G 大阪 | 日本 🇯🇵 | 2核 2GB 40GB SSD | 500GB | $49.99/月 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=134) |
| 80G 大阪 | 日本 🇯🇵 | 4核 4GB 80GB SSD | 1TB | $86.99/月 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=135) |
| 40G 香港 | 香港 🇭🇰 | 2核 2GB 40GB SSD | 500GB | $89.99/月 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=95) |
| 80G 香港 | 香港 🇭🇰 | 4核 4GB 80GB SSD | 1TB | $155.99/月 | [查看方案](https://bwh81.net/aff.php?aff=77647&pid=96) |

> 使用优惠码 `BWHCGLUKKB` 结账时额外节省 6.78%（高端方案用 `BWHCCNCXVV` 省 5.97%）

---

## ❓ 常见问题

**Q: 搬瓦工支持什么支付方式？**
A: 支付宝、PayPal、信用卡均可。

**Q: 买了之后可以换机房吗？**
A: CN2 GIA-E 系列支持在后台自由切换机房（DC6/DC9/日本/荷兰/香港等）。KVM PROMO 也支持切换。

**Q: 可以退款吗？**
A: 30 天内可申请退款（每个账户仅限一次）。

**Q: 搬瓦工被封 IP 怎么办？**
A: 后台可以付费更换 IP（$8.79），或者免费切换机房自动换 IP。

**Q: 脚本支持什么系统？**
A: Linux、macOS、WSL（Windows Subsystem for Linux）均可运行。

---

## 🔗 相关项目

- 更多搬瓦工方案详情：[bwhhost.com](https://www.bwhhost.com)

---

## License

[MIT](LICENSE)

## 免责声明

本项目仅提供网络测速工具和信息整理，不对任何购买行为负责。价格和方案以搬瓦工官网实际显示为准。部分链接为推广链接，通过这些链接购买不会增加您的费用，但我们可能获得少量佣金支持项目维护。
