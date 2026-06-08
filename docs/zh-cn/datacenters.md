# 搬瓦工机房怎么选

很多中文用户在买搬瓦工 VPS 前最纠结的不是“能不能买”，而是“到底选哪个机房”。CN2 GIA-E、香港、东京、大阪、新加坡、KVM PROMO 和 ECOMMERCE SLA 看起来都能用，但适合的场景并不一样。

这个页面给一个购买前的判断顺序：先看用途，再看访问区域，再看预算和库存，最后用测速结果辅助确认。

## 一句话结论

如果你还没有明确方向，可以先按下面的顺序缩小范围：

1. 新手、预算适中、想少纠结：先看 CN2 GIA-E 入门方案。
2. 更重视亚洲访问和低延迟：比较香港、东京、大阪、新加坡。
3. 预算敏感或备用节点：看 KVM PROMO，但要接受线路差异。
4. 长期项目、商业用途：看 ECOMMERCE SLA 或更高规格方案。
5. 热门套餐缺货：先准备同系列、相邻机房或相近预算的替代方案。

如果你仍不确定，先用[搬瓦工套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_datacenters_top_selector)按用途和预算生成一个方向，再回到本页理解原因。

## 机房选择表

| 方向 | 更适合谁 | 优势 | 注意点 |
|---|---|---|---|
| CN2 GIA-E 洛杉矶 | 新手入门、预算和线路平衡 | 系列成熟，适合作为首选入口 | 不是最低延迟，仍要看库存和可选机房 |
| 香港 CN2 GIA | 更重视低延迟和亚洲访问 | 地理位置近，体验通常更直接 | 价格和库存压力通常更高 |
| 东京 CN2 GIA | 日本方向、亚洲访问、香港替代 | 适合亚洲访问备选 | 不同运营商表现可能不同 |
| 大阪 CN2 GIA | 日本方向补充选择 | 可作为东京之外的备选 | 购买前确认当前套餐是否可选 |
| 新加坡 CN2 GIA / SG_8 | 东南亚和亚洲方向补充 | 新增亚洲方向选择 | 公开测试目标仍需确认，库存变化快 |
| KVM PROMO | 预算敏感、轻量用途、备用节点 | 成本门槛低 | 线路和体验不要按高端系列预期 |
| ECOMMERCE SLA | 长期项目、商业用途 | 更偏稳定性和业务用途 | 不适合只追求最低价格的用户 |
| Dubai | 中东方向需求 | 区域特殊，适合特定访问场景 | 中文用户常规购买优先级较低 |

## 按使用场景选择

### 新手第一次买

优先把选择范围缩小到 CN2 GIA-E 入门方案或当前推荐器给出的主方向。新手最容易犯的错误是只看最低价，结果买到不适合自己访问区域的机房。

推荐动作：

- 先用[套餐推荐器](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_datacenters_newbie_selector)确定预算和用途；
- 再看[库存监控](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_datacenters_newbie_stock)确认是否有货；
- 最后用本仓库 `test.sh` 对公开测试目标做延迟参考。

### 面向中文用户访问

如果你的访问用户主要在中文网络环境，建议重点比较：

1. 香港 CN2 GIA
2. 东京 CN2 GIA
3. 大阪 CN2 GIA
4. 新加坡 CN2 GIA / SG_8
5. 洛杉矶 CN2 GIA-E

这个顺序不是固定排名。不同省份、运营商和时间段可能差异很大。真正下单前，应该结合自己的网络测试、库存和价格判断。

### 预算敏感或备用节点

如果只是轻量建站、学习 Linux、临时测试或备用节点，KVM PROMO 可以纳入比较。但它更像成本优先的选择，不应该拿它和香港 CN2 GIA、东京 CN2 GIA 或 ECOMMERCE SLA 按同一标准比较。

### 长期项目和商业用途

长期项目不能只看首月或首年价格。应同时核对：

- 付款周期；
- 月流量；
- 带宽；
- 可选机房；
- 是否有合适的升级空间；
- 缺货时有没有替代方案。

## 怎么使用测速结果

运行本仓库的 `test.sh` 后，不要只看排第一的机房。更好的判断方式是：

| 看什么 | 怎么判断 |
|---|---|
| 前 3 个低延迟机房 | 判断当前网络更适合亚洲方向还是美国西海岸 |
| timeout | 说明当前网络到该测试目标可能不可达，不等于套餐卖完 |
| 多次测试波动 | 波动大时不要只看一次最优结果 |
| IPv6 结果 | 如果你的网络没有 IPv6，东京 IPv6 目标可能会跳过 |
| 目标用户位置 | 你的测试网络越接近目标用户，结果越有参考价值 |

测速只是辅助。最终购买仍要看套餐页是否有货、是否可选目标机房、价格和付款周期是否合适。

## 新加坡 SG_8 怎么看

新加坡 CN2 GIA / SG_8 是亚洲方向的新选择，适合和香港、东京、大阪、洛杉矶 CN2 GIA-E 一起比较。它的意义是多一个亚洲备选，而不是天然替代所有老机房。

当前处理原则：

- 可以把它列入购买前比较范围；
- 不因为“新加坡”或“新套餐”就盲目优先；
- 等公开、稳定、可复核的测试目标确认后，再加入 `test.sh`；
- 如果香港、东京、大阪缺货，新加坡可以作为同一组亚洲备选看待。

详细说明见：[新加坡 CN2 GIA / SG_8 购买前怎么看](singapore.md)。

## 缺货时怎么选替代方案

热门套餐缺货时，不建议反复刷新只等一个方案。可以按这个顺序准备替代：

1. 同系列不同容量；
2. 同地区相邻机房；
3. CN2 GIA-E 入门方案；
4. KVM PROMO；
5. ECOMMERCE SLA 或更高规格方案。

你也可以直接看[库存监控](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_datacenters_stock_section)，它会把热门套餐和替代方向放在一起比较。

## 购买前检查清单

- 用途：学习、建站、长期项目还是备用节点？
- 访问区域：主要用户在中国大陆、香港、日本、新加坡、美国还是其他地区？
- 预算：更重视低价，还是更重视线路和稳定性？
- 库存：目标套餐现在是否有货？
- 机房：当前套餐是否能选到你想要的机房？
- 付款周期：月付、季付、年付的成本是否能接受？
- 替代方案：首选缺货时，下一步看哪一款？

## 下一步入口

- [使用套餐推荐器缩小范围](https://www.bwhguide.com/tools/vps-selector/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_datacenters_bottom_selector)
- [查看库存和补货状态](https://www.bwhguide.com/tools/stock-monitor/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_datacenters_bottom_stock)
- [查看套餐和机房选择页](https://www.bwhguide.com/plans/?utm_source=github&utm_medium=pages&utm_campaign=bwg_speed_test&utm_content=zh_datacenters_bottom_plans)
- [阅读 CN2 GIA-E 线路说明](cn2-gia.md)
- [阅读新加坡 SG_8 购买前说明](singapore.md)

## 常见误区

### 只看最低价

最低价不一定适合你的访问区域。便宜方案如果线路不合适，后续迁移、换机房和重新配置的成本反而更高。

### 只看延迟

延迟只是一个指标。产品系列、库存、带宽、月流量、付款周期和可选机房同样重要。

### 只等一款补货

缺货时应先准备同系列或相邻机房替代方案。很多时候，真正适合你的不是“最热门那款”，而是当前有货、配置合适、付款周期合适的方案。
