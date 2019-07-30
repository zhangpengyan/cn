# 常见问题

**Q：云数据库 InfluxDB 支持公网连接吗？**

A：云数据库 InfluxDB 支持公网连接，实例默认不开启外网访问，如需要可手动开启。为安全考虑建议建议同时启用白名单设置。操作方式请参考 [开启外网访问](../Operation-Guide/Instance-Management/Internet-access.md) 、[设置白名单](../Getting-Started/Set-Whitelist.md)。

**Q：云数据库 InfluxDB 目前版本是多少？**

A：云数据库 InfluxDB 目前为1.74版。

**Q：开启SSL加密是否会影响性能？**

A：启用SSL加密会对数据库性能有一定影响，通常会降低20%-30%左右，如仅通过内网连接数据库，建议不启用SSL加密。

