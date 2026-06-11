# 搬瓦工测速与机房选择

这个页面面向正在比较 BandwagonHost / 搬瓦工 VPS 的中文用户：先判断自己适合哪个套餐系列和机房，再用测速脚本辅助确认，最后回到套餐页核对库存、价格、付款周期和可选机房。

这里更像一个购买前的技术检查清单，帮助你少走“只看最低价、只看一次 ping、只盯一款缺货套餐”的弯路。最终库存、价格、可选机房和付款周期仍以购买页显示为准。

## 先做 3 个判断

| 你的状态 | 建议先看 | 目的 |
|---|---|---|
| 完全不知道买哪款 | [搬瓦工套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=pages_home_top_selector) | 按用途、访问区域、预算和使用周期缩小范围 |
| 已经有目标套餐 | [搬瓦工库存监控](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=pages_home_top_stock) | 判断是否有货，以及缺货时看哪些替代方案 |
| 纠结香港/东京/大阪/新加坡/CN2 GIA-E | [搬瓦工机房怎么选](zh-cn/datacenters.md) | 先理解机房和线路差异，再决定是否需要测速 |

## 新手推荐路径

1. 先用[套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=pages_home_flow_selector)判断一个主方向。
2. 再看[库存监控](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=pages_home_flow_stock)，确认热门套餐是否有货。
3. 如果还在 CN2 GIA-E、香港、东京、大阪、新加坡之间犹豫，阅读[机房选择说明](zh-cn/datacenters.md)。
4. 如果你想自己验证当前网络到各机房的延迟，回到 GitHub 仓库运行 `test.sh`。
5. 测完以后看[测速结果怎么对应套餐选择](zh-cn/result-to-plan.md)，把延迟、timeout、库存和预算放到同一个判断里。
6. 最后进入[套餐和机房选择页](https://www.bwhguide.com/plans/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=pages_home_flow_plans)核对价格、付款周期和可选机房。

## 常见搜索问题

| 问题 | 推荐阅读 |
|---|---|
| 搬瓦工哪个机房适合中国用户？ | [搬瓦工机房怎么选](zh-cn/datacenters.md) |
| 搬瓦工测速和测试 IP 怎么看？ | [搬瓦工测速和测试 IP 怎么用](zh-cn/speed-test-guide.md) |
| 测速结果出来后应该买哪款？ | [测速结果怎么对应套餐选择](zh-cn/result-to-plan.md) |
| CN2 GIA-E、香港、东京、大阪、新加坡有什么区别？ | [CN2 GIA-E 线路说明](zh-cn/cn2-gia.md) |
| 新加坡 SG_8 要不要买？ | [新加坡 CN2 GIA / SG_8 购买前怎么看](zh-cn/singapore.md) |
| 搬瓦工缺货时怎么看替代方案？ | [库存和补货怎么看](zh-cn/stock-monitor.md) |
| 推荐器为什么会给出这个套餐？ | [套餐推荐器怎么用](zh-cn/vps-selector.md) |
| 买完后 KiwiVM 可以做什么？ | [KiwiVM 常用功能](zh-cn/kiwivm.md) |

## 测速脚本能告诉你什么

测速脚本适合回答这些问题：

- 你当前网络到几个公开测试目标的延迟大概是多少；
- 哪些机房在你的网络下明显 timeout；
- 多次测试后，哪个方向更稳定；
- 是否需要把香港、东京、大阪、新加坡和 CN2 GIA-E 放在一起比较。

测速脚本不能直接回答这些问题：

- 当前套餐是否有货；
- 当前购买页最终价格是多少；
- 你的业务长期是否一定稳定；
- 某个新机房是否一定适合所有人。

## 中文文档

| 页面 | 适合场景 |
|---|---|
| [搬瓦工机房怎么选](zh-cn/datacenters.md) | 购买前比较机房、线路和访问区域 |
| [搬瓦工测速和测试 IP 怎么用](zh-cn/speed-test-guide.md) | 自己测试延迟前先理解测速结果怎么解读 |
| [测速结果怎么对应套餐选择](zh-cn/result-to-plan.md) | 跑完测速后，把延迟结果转成购买前判断 |
| [CN2 GIA-E、香港、东京、大阪、新加坡怎么理解](zh-cn/cn2-gia.md) | 解释常见线路和亚洲机房选择 |
| [新加坡 CN2 GIA / SG_8 购买前怎么看](zh-cn/singapore.md) | 判断新加坡新机房是否值得优先关注 |
| [库存和补货怎么看](zh-cn/stock-monitor.md) | 热门套餐缺货时准备替代方案 |
| [套餐推荐器怎么用](zh-cn/vps-selector.md) | 用工具缩小选择范围 |
| [KiwiVM 常用功能](zh-cn/kiwivm.md) | 购买后理解控制面板常用功能 |

## English Notes

This project provides a lightweight BandwagonHost latency test script and datacenter reference. English readers can start with:

- [Speed test notes](en/speed-test.md)
- [Datacenter overview](en/datacenters.md)
- [GitHub repository](https://github.com/devguoo/bwg-speed-test)

## 购买前提醒

- 不要只看最低价，线路和机房更重要。
- 不要只看一次 ping，多测几次更可靠。
- 缺货时先准备同系列或相邻机房替代方案。
- 最终库存、价格、退款条件和服务条款以购买页显示为准。

更多中文购买判断可以看：

- [搬瓦工套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=pages_home_bottom_selector)
- [搬瓦工库存监控](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=pages_home_bottom_stock)
- [搬瓦工套餐和机房选择](https://www.bwhguide.com/plans/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=pages_home_bottom_plans)
