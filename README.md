[TrafficMonitor](https://github.com/zhongyang219/TrafficMonitor)是一个很受欢迎的任务栏监控工具。它还支持插件开发。然而……插件开发起来很麻烦。

本项目支持用lua开发TrafficMonitor插件，尽可能降低开发难度。


# 1. 安装

在release页面下载zip后，解压到[TrafficMonitor的插件目录](https://github.com/zhongyang219/TrafficMonitorPlugins/blob/main/README.md)即可

压缩包自带若干lua编写的插件，可以在“显示设置”中启用。

# 2. lua插件开发指南

可以参考原项目[TrafficMonitorLuaPlugin](https://github.com/compilelife/TrafficMonitorLuaPlugin/)目录下的例子。

# 3. 自用lua脚本

添加了几个自己用的脚本：

- 显示代理软件[MihomoParty](https://github.com/mihomo-party-org/mihomo-party)当前状态（直连、系统代理、虚拟网卡）

- 获取当前IP和国家（多个API接口获取）

- 虚拟货币当前价格（[币安接口](https://developers.binance.com/docs/zh-CN/binance-spot-api-docs)）

- 联通号码话费流量余额(Cookie获取来自项目[ChinaUnicom](https://github.com/ChinaTelecomOperators/ChinaUnicom/releases))

![](./Screenshots/PixPin_2025-01-17_12-21-16.png)<br>
