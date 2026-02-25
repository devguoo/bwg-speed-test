# 搬瓦工测速工具 BandwagonHost Speed Test

一键测试搬瓦工（BandwagonHost）全球 11 个机房的网络延迟，帮你找到最快的节点。

## 快速使用

```bash
bash <(curl -sL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/speed-test.sh)
```

或者克隆到本地：

```bash
git clone https://github.com/devguoo/bwg-speed-test.git
cd bwg-speed-test
chmod +x speed-test.sh
./speed-test.sh
```

## 测试覆盖机房

| 机房 | 位置 | 线路 | 推荐指数 |
|------|------|------|----------|
| DC6 USCA_6 | 洛杉矶 | CN2 GIA-E | ⭐⭐⭐⭐⭐ |
| DC9 USCA_9 | 洛杉矶 | CN2 GIA | ⭐⭐⭐⭐⭐ |
| 大阪 | 日本 | CN2 GIA | ⭐⭐⭐⭐⭐ |
| 东京 | 日本 | CN2 GIA | ⭐⭐⭐⭐ |
| DC3 USCA_3 | 洛杉矶 | CN2 | ⭐⭐⭐⭐ |
| DC8 USCA_8 | 洛杉矶 | CN2 | ⭐⭐⭐⭐ |
| 香港 HKHK_8 | 香港 | CMI | ⭐⭐⭐⭐ |
| 荷兰 EUNL_9 | 阿姆斯特丹 | 联通9929 | ⭐⭐⭐ |
| DC2 USCA_2 | 洛杉矶 | QN | ⭐⭐⭐ |
| DC4 USCA_4 | 洛杉矶 | MCOM | ⭐⭐⭐ |
| 迪拜 AEDXB_1 | 迪拜 | — | ⭐⭐ |

## 搬瓦工方案推荐

### 入门首选 — CN2 GIA-E（DC6）

中国大陆访问速度最快的线路，电信双向 CN2 GIA，联通/移动直连。性价比之王。

| 方案 | 配置 | 流量/月 | 带宽 | 价格 | 购买链接 |
|------|------|---------|------|------|----------|
| 20G CN2 GIA-E | 2核 1GB 20GB SSD | 1TB | 2.5Gbps | $49.99/季 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=87) |
| 40G CN2 GIA-E | 3核 2GB 40GB SSD | 2TB | 2.5Gbps | $89.99/季 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=88) |
| 80G CN2 GIA-E | 4核 4GB 80GB SSD | 3TB | 2.5Gbps | $55.99/月 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=89) |
| 160G CN2 GIA-E | 6核 8GB 160GB SSD | 5TB | 5Gbps | $109.99/月 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=90) |

### 预算方案 — KVM PROMO

多机房可选，购买后可在后台自由切换机房。适合预算有限的用户。

| 方案 | 配置 | 流量/月 | 带宽 | 价格 | 购买链接 |
|------|------|---------|------|------|----------|
| 20G KVM | 2核 1GB 20GB SSD | 1TB | 1Gbps | $49.99/年 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=44) |
| 40G KVM | 3核 2GB 40GB SSD | 2TB | 1Gbps | $52.99/半年 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=45) |
| 80G KVM | 4核 4GB 80GB SSD | 3TB | 1Gbps | $19.99/月 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=46) |

### 日本节点 — 大阪 CN2 GIA

日本 Equinix 机房，CN2 GIA 线路，适合需要日本 IP 的用户。

| 方案 | 配置 | 流量/月 | 带宽 | 价格 | 购买链接 |
|------|------|---------|------|------|----------|
| 40G 大阪 | 2核 2GB 40GB SSD | 500GB | 1.5Gbps | $49.99/月 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=134) |
| 80G 大阪 | 4核 4GB 80GB SSD | 1TB | 1.5Gbps | $86.99/月 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=135) |

### 香港节点 — CMI

香港 CMI 线路，延迟最低，适合对延迟极度敏感的场景。

| 方案 | 配置 | 流量/月 | 带宽 | 价格 | 购买链接 |
|------|------|---------|------|------|----------|
| 40G 香港 | 2核 2GB 40GB SSD | 500GB | 1Gbps | $89.99/月 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=95) |
| 80G 香港 | 4核 4GB 80GB SSD | 1TB | 2Gbps | $155.99/月 | [点击购买](https://bwh81.net/aff.php?aff=77647&pid=96) |

> 📋 完整 58 个方案对比请查看 [全部方案](PLANS.md)

## 优惠码

购买时输入优惠码可享额外折扣：

| 优惠码 | 折扣 | 适用范围 |
|--------|------|----------|
| `BWHCGLUKKB` | 6.78% | 所有常规方案 |
| `BWHCCNCXVV` | 5.97% | 高端方案（CN2 GIA-E / 日本 / 香港） |

建议先试 `BWHCGLUKKB`，折扣更大。

## 选购指南

### 怎么选机房？

1. **跑完测速脚本**，看哪个机房延迟最低
2. 一般来说：
   - 电信用户 → DC6（CN2 GIA-E）延迟最低
   - 联通用户 → DC6 或荷兰（联通9929）
   - 移动用户 → DC6 或香港（CMI）
3. 需要日本 IP → 大阪/东京
4. 预算有限 → KVM PROMO（DC2/DC3 等，可后台切换）

### 怎么选配置？

- 个人建站/代理：1GB 内存够用，选 20G 方案
- 多用途/跑服务：2-4GB 内存，选 40G-80G 方案
- 企业/高流量：8GB+ 内存，选 160G 以上

### CN2 vs CN2 GIA vs CN2 GIA-E 区别

| 线路 | 说明 | 速度 | 价格 |
|------|------|------|------|
| CN2 | 电信 CN2 GT，去程普通/回程 CN2 | ★★★ | 便宜 |
| CN2 GIA | 电信双向 CN2 GIA | ★★★★★ | 较贵 |
| CN2 GIA-E | CN2 GIA 企业版，多机房可切换 | ★★★★★ | 性价比最高 |

## 常见问题

**Q: 搬瓦工支持什么支付方式？**
A: 支付宝、PayPal、信用卡均可。

**Q: 买了之后可以换机房吗？**
A: CN2 GIA-E 系列支持在后台自由切换机房（DC6/DC9/日本/荷兰/香港等）。KVM PROMO 也支持切换。

**Q: 可以退款吗？**
A: 30 天内可申请退款（每个账户仅限一次）。

**Q: 搬瓦工被封 IP 怎么办？**
A: 后台可以付费更换 IP（$8.79），或者免费切换机房自动换 IP。

## License

MIT

## 免责声明

本项目仅提供网络测速工具和信息整理，不对任何购买行为负责。价格和方案以搬瓦工官网实际显示为准。本项目包含推广链接，通过这些链接购买不会增加您的费用。
