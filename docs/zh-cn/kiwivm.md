# KiwiVM 常用功能

KiwiVM 是搬瓦工用户常见的 VPS 控制面板。这个页面只整理购买后最容易用到的功能方向，具体按钮和可用功能可能会随官方后台变化。

## 常用功能

| 功能 | 作用 | 什么时候用 |
|---|---|---|
| Start / Stop / Restart | 启动、关闭、重启 VPS | 系统无响应或维护时 |
| OS Reload | 重装系统 | 新开机、测试环境、系统损坏时 |
| Root Password | 查看或重置 root 密码 | 忘记密码或重装系统后 |
| SSH Port | 查看 SSH 连接端口 | 连接服务器前 |
| Snapshots / Backups | 快照或备份 | 大改配置前 |
| Migration | 迁移机房或节点 | 官方允许且你需要更换线路时 |
| Bandwidth Usage | 查看流量使用 | 接近月流量上限时 |

## 新手购买后先做什么

1. 记录 IP、SSH 端口和 root 密码。
2. 确认系统版本。
3. 第一次 SSH 登录。
4. 更新系统。
5. 配置防火墙和 SSH 安全。
6. 建站或部署自己的应用。

## 注意事项

- 重装系统会清空原系统数据，操作前先确认备份。
- 迁移功能是否可用取决于套餐、机房和官方规则。
- 如果只是线路慢，不要第一时间重装系统；先看网络、机房和路由情况。

## 相关页面

- [搬瓦工购买教程](https://www.bwhguide.com/buy/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=zh_kiwivm_buy)
- [搬瓦工常见问题](https://www.bwhguide.com/faq/?utm_source=github&utm_medium=repo&utm_campaign=bwg_speed_test&utm_content=zh_kiwivm_faq)
