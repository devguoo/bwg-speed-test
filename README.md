# 搬瓦工测速与机房选择 / BandwagonHost Speed Test

面向中文用户的 BandwagonHost / 搬瓦工 VPS 测速、机房选择和购买前判断仓库。它不是广告页，也不代替最终购买页；它的价值是让你先用本地网络测一遍线路，再结合库存、套餐系列和预算做选择，减少买错机房或买错套餐的概率。

## 10 秒快速判断

| 你现在的问题 | 先看这里 | 作用 |
|---|---|---|
| 不知道买哪款 | [套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_top_decision) | 按用途、区域、预算先给一个方向 |
| 担心缺货 | [库存监控](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_top_stock) | 看热门套餐和替代方案 |
| 不懂机房 | [机房选择说明](docs/zh-cn/datacenters.md) | 对比 CN2 GIA-E、香港、东京、大阪、新加坡、KVM |
| 想自己测速 | [测速和测试 IP 使用说明](docs/zh-cn/speed-test-guide.md) | 先理解测速能回答什么，再运行 `test.sh` |
| 测完不知道买哪款 | [测速结果怎么对应套餐选择](docs/zh-cn/result-to-plan.md) | 把延迟、timeout、库存和预算连成购买判断 |

## 中文用户快速入口

如果你正在准备购买搬瓦工，建议按这个顺序看：

1. [先用套餐推荐器缩小选择范围](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_cn_top_selector)
2. [查看当前库存和补货状态](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_cn_top_stock)
3. [阅读套餐和机房选择说明](https://www.bwhguide.com/plans/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_cn_top_plans)
4. [需要购买流程时看中文购买教程](https://www.bwhguide.com/buy/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_cn_top_buy)

常用中文文档：

- [搬瓦工机房怎么选](docs/zh-cn/datacenters.md)
- [搬瓦工测速和测试 IP 怎么用](docs/zh-cn/speed-test-guide.md)
- [测速结果怎么对应套餐选择](docs/zh-cn/result-to-plan.md)
- [CN2 GIA-E、香港、东京、大阪、新加坡怎么理解](docs/zh-cn/cn2-gia.md)
- [新加坡 CN2 GIA / SG_8 购买前怎么看](docs/zh-cn/singapore.md)
- [库存和补货怎么看](docs/zh-cn/stock-monitor.md)
- [套餐推荐器怎么用](docs/zh-cn/vps-selector.md)

## English Summary

One-click latency test and datacenter reference for BandwagonHost VPS. This repository is maintained as a lightweight route-testing and datacenter reference project. It favors practical testing notes, public test targets and calm buying research over promotional copy.

Useful links:

- Documentation site: <https://devguoo.github.io/bwg-speed-test/>
- Chinese plan selector: <https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_en_selector>
- Stock monitor: <https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_en_stock>

## What This Repository Solves

This repository helps you:

- test latency to selected BandwagonHost public test IPs;
- compare reachable datacenters before making a VPS decision;
- understand common BandwagonHost routes such as CN2 GIA-E, Hong Kong, Tokyo, Osaka, Singapore and Dubai;
- keep a lightweight reference for Chinese BandwagonHost buying decisions without turning this repository into an ad page.

It is not an official BandwagonHost repository. Pricing, stock and final product availability should always be checked on the actual order page before purchase.

## Quick Start

Run the test from the network you care about:

```bash
curl -fsSL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/test.sh | bash
```

Verbose mode:

```bash
curl -fsSL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/test.sh | bash -s -- -v
```

Clone and run locally:

```bash
git clone https://github.com/devguoo/bwg-speed-test.git
cd bwg-speed-test
chmod +x test.sh
./test.sh
```

Options:

```bash
./test.sh -c 6       # ping count
./test.sh -t 3       # timeout seconds
./test.sh -v         # verbose ping output
./test.sh -m         # markdown table output
```

## Example Output

The script prints progress first, then sorts reachable targets by latency. A real run will depend on your own ISP, region and time of day:

```text
Results sorted by latency
Datacenter               Location       Latency          Status
----------               --------       -------          ------
Hong Kong CN2 GIA        Hong Kong      76.8ms           Great
Tokyo CN2 GIA            Tokyo          185.4ms          Fair
DC6 CN2 GIA-E            Los Angeles    228.6ms          Fair
DC2 QNET                 Los Angeles    -                Timeout
```

For issue reports or route notes, use Markdown output:

```bash
./test.sh -c 3 -t 2 -m
```

## Supported Test Targets

These are public test targets collected for route and latency comparison. Some locations may block ICMP or change test IPs over time, so timeout does not always mean the product is unavailable. New locations are added only after a public test target is verified.

| Datacenter | Location | Test target | Protocol | Notes |
|---|---|---:|---|---|
| DC2 QNET | Los Angeles | `104.194.76.1` | IPv4 | KVM / legacy route reference |
| DC3 CN2 | Los Angeles | `23.252.96.1` | IPv4 | CN2 legacy reference |
| DC4 MCOM | Los Angeles | `98.142.136.1` | IPv4 | MCOM route reference |
| DC6 CN2 GIA-E | Los Angeles | `162.244.241.103` | IPv4 | Common CN2 GIA-E reference |
| DC8 ZNET | Los Angeles | `65.49.128.1` | IPv4 | ZNET route reference |
| DC9 CN2 GIA | Los Angeles | `65.49.135.97` | IPv4 | CN2 GIA reference |
| Fremont | Fremont | `184.106.214.1` | IPv4 | US west coast reference |
| New Jersey | New Jersey | `23.29.138.5` | IPv4 | US east coast reference |
| New York | New York | `208.167.227.1` | IPv4 | US east coast reference |
| Osaka SoftBank | Osaka | `185.212.59.1` | IPv4 | Japan route reference |
| Tokyo CN2 GIA | Tokyo | `2607:f130:0:17e::3b2a` | IPv6 | Requires IPv6 connectivity |
| Hong Kong CN2 GIA | Hong Kong | `93.179.124.161` | IPv4 | Common Asia reference |
| Dubai | Dubai | `45.154.3.1` | IPv4 | Middle East reference |

Recently announced product locations, such as Singapore SG_8, are not added here until a stable public test target is verified. For buying research notes, see [新加坡 CN2 GIA / SG_8 购买前怎么看](docs/zh-cn/singapore.md).

## How To Read Results

Latency is only one signal. Before choosing a VPS plan, compare:

- latency from your own network;
- packet loss and stability, not only average ms;
- product series, bandwidth and monthly transfer;
- stock status and available billing cycle;
- whether the plan allows the datacenter you want.

For Chinese users, lower latency usually matters, but stock, route stability and plan series can matter more than a single ping result.

## 中文用户入口

如果你是中文用户，建议按这个顺序判断：

1. 先看预算和用途，不要只看最低价。
2. 再按访问区域选择机房方向。
3. 用测速结果确认大致延迟。
4. 最后进入套餐页核对库存、价格、付款周期和可选机房。

中文文档：

- [搬瓦工机房怎么选](docs/zh-cn/datacenters.md)
- [搬瓦工测速和测试 IP 怎么用](docs/zh-cn/speed-test-guide.md)
- [测速结果怎么对应套餐选择](docs/zh-cn/result-to-plan.md)
- [CN2 GIA-E、香港、东京、大阪、新加坡怎么理解](docs/zh-cn/cn2-gia.md)
- [新加坡 CN2 GIA / SG_8 购买前怎么看](docs/zh-cn/singapore.md)
- [库存和补货怎么看](docs/zh-cn/stock-monitor.md)
- [套餐推荐器怎么用](docs/zh-cn/vps-selector.md)
- [KiwiVM 常用功能](docs/zh-cn/kiwivm.md)

购买前工具：

- [搬瓦工套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_zh_selector)
- [搬瓦工库存监控](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_zh_stock)
- [搬瓦工套餐和机房选择](https://www.bwhguide.com/plans/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_zh_plans)

## English Docs

- [Speed test notes](docs/en/speed-test.md)
- [BandwagonHost datacenter overview](docs/en/datacenters.md)

## Benchmark And Snapshot Files

- [LATEST.md](LATEST.md) keeps a manually recorded route snapshot. It is a reference sample, not a guarantee for every network.
- [BENCHMARK.md](BENCHMARK.md) shows an anonymized benchmark format. Do not publish your own server IP, hostname, account data or backend screenshots in benchmark notes.

## Maintenance Policy

- Add public test targets only after they are manually verified.
- Keep buying links secondary to testing and documentation.
- Do not publish API keys, account data, private dashboards or affiliate backend screenshots.
- Use issues or pull requests for datacenter updates, broken targets or documentation fixes.

## FAQ

### Is this an official BandwagonHost project?

No. This is an independent community-style reference for testing and buying research.

### Does the fastest ping always mean the best plan?

No. The fastest reachable target is useful, but you still need to check product series, stock, monthly transfer, price and billing cycle.

### Why are some targets unreachable?

Some networks block ICMP, some datacenters may filter ping, and some targets may require IPv6. Timeout is a signal to investigate, not a final product status.

### Can I use this before buying?

Yes. Run the test from a network close to your target users. Then compare the result with plan availability and real order-page stock.

## Related Resources

- [BandwagonHost Chinese VPS buying guide](https://www.bwhguide.com/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_related)
- [BandwagonHost articles and reviews](https://www.bwhhost.com/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=readme_related)

## Disclaimer

This repository is independently maintained and is not affiliated with BandwagonHost. Network routes, pricing, stock and datacenter availability can change. Always verify final product details on the order page before purchasing.

## Contributing

Small corrections are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening an issue or pull request.

## License

[MIT](LICENSE)
