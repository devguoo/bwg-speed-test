# 搬瓦工测速和测试 IP 怎么用

很多人在购买搬瓦工 VPS 前会搜索“搬瓦工测速”“搬瓦工测试 IP”“搬瓦工哪个机房快”。测速确实有用，但它只能回答一部分问题：你当前网络到某些公开测试目标的延迟和连通性大概怎么样。

真正下单前，还需要把测速结果和套餐系列、可选机房、库存、价格、月流量、付款周期一起判断。这个页面给一个更稳的使用顺序。

## 先明确测速能解决什么

| 问题 | 测速能不能回答 | 更好的做法 |
|---|---|---|
| 我当前网络到哪个方向延迟更低 | 可以辅助判断 | 多测几次，比较香港、东京、大阪、新加坡、洛杉矶 |
| 某个套餐现在有没有货 | 不能 | 看[库存监控](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_speed_guide_stock_table) |
| 我应该买哪一款套餐 | 不能单独决定 | 先用[套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_speed_guide_selector_table)缩小范围 |
| 当前购买页最终价格是多少 | 不能 | 进入套餐页核对最终显示 |
| 哪个机房长期一定最稳定 | 不能保证 | 结合线路、用途、预算和多次测试结果判断 |

## 推荐判断顺序

如果你还没有明确目标，建议按这个顺序来：

1. 先判断用途：学习 Linux、建站、亚洲访问、长期项目还是备用节点。
2. 再判断预算：是先控制成本，还是更重视线路和稳定性。
3. 用[套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_speed_guide_flow_selector)拿到一个主方向。
4. 看[库存监控](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_speed_guide_flow_stock)，确认目标套餐是否有货。
5. 再用本仓库的 `test.sh` 或公开测试 IP 做延迟参考。
6. 测完后看[测速结果怎么对应套餐选择](result-to-plan.md)，把延迟结果转成购买前判断。
7. 最后到[套餐和机房选择页](https://www.bwhguide.com/plans/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_speed_guide_flow_plans)核对可选机房、价格和付款周期。

## 使用 test.sh 快速测速

在你自己的网络环境里运行：

```bash
curl -fsSL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/test.sh | bash
```

如果想减少单次波动，可以增加 ping 次数：

```bash
curl -fsSL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/test.sh | bash -s -- -c 6
```

如果想把结果整理成 Markdown 表格，方便记录：

```bash
curl -fsSL https://raw.githubusercontent.com/devguoo/bwg-speed-test/main/test.sh | bash -s -- -m
```

## 怎么看测速结果

### 不要只看第一名

一次测试的最低延迟不等于长期最好。更有价值的是看同一组方向里是否稳定靠前，比如香港、东京、大阪、新加坡和洛杉矶 CN2 GIA-E 哪些方向长期更适合你的网络。

### timeout 不等于不能买

有些测试目标可能禁 ping、过滤 ICMP、只支持 IPv6，或者临时不可达。timeout 说明当前测试目标不可达，不等于套餐缺货，也不等于这个机房完全不能用。

### 多测几次比一次结果更重要

建议在不同时间段测几次，比如白天、晚上高峰期、周末。中文用户访问体验经常会受运营商、地区和时间段影响。

### 测你真正关心的网络

如果你的用户主要在国内，就尽量从接近目标用户的网络测。你在海外服务器上测出来的结果，不能直接代表国内用户体验。

## 常见机房怎么放进比较里

| 方向 | 测速时怎么看 | 购买前还要确认 |
|---|---|---|
| 香港 CN2 GIA | 延迟通常更有优势，适合重视亚洲访问 | 价格、库存和月流量压力 |
| 东京 CN2 GIA | 日本方向常见备选 | 不同运营商表现可能不同 |
| 大阪 CN2 GIA | 日本方向补充选择 | 当前套餐是否可选大阪 |
| 新加坡 CN2 GIA / SG_8 | 亚洲新方向，可和香港、东京、大阪一起比较 | 稳定公开测试目标和库存变化 |
| 洛杉矶 CN2 GIA-E | 成熟系列，适合入门和综合平衡 | 延迟不一定最低，但系列更成熟 |
| KVM PROMO | 预算优先时可看 | 不要按高端线路预期判断 |

更多机房解释可以看：[搬瓦工机房怎么选](datacenters.md)。

## 购买前检查清单

下单前至少核对这些信息：

- 套餐系列是否适合你的用途；
- 当前是否有货；
- 是否能选择你想要的机房；
- 月流量和带宽是否够用；
- 付款周期是否适合长期使用；
- 如果首选缺货，有没有替代方案；
- 优惠码是否在结账页实际生效；
- 最终价格以购买页显示为准。

如果你不确定从哪里开始，可以先打开[搬瓦工套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_speed_guide_bottom_selector)，把用途、访问区域、预算和使用周期填一遍，再回来看测速结果会更容易理解。

## 相关入口

- [测速结果怎么对应套餐选择](result-to-plan.md)
- [搬瓦工套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_speed_guide_related_selector)
- [搬瓦工库存监控](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_speed_guide_related_stock)
- [搬瓦工套餐和机房选择](https://www.bwhguide.com/plans/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_speed_guide_related_plans)
- [CN2 GIA-E、香港、东京、大阪、新加坡怎么理解](cn2-gia.md)
- [新加坡 CN2 GIA / SG_8 购买前怎么看](singapore.md)
