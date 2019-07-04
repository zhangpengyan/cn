# 常见问题

**Q：缓存Redis支持外网访问吗？**

A：为提升数据访问的安全性，缓存Redis目前仅支持内网云主机访问。可以设置公网代理访问，详情见公网连接Redis实例。


**Q：目前缓存Redis支持哪些协议？**

A：京东云缓存Redis完全兼容Redis官方协议，使用方法可参考各语言相关文档。


**Q：每个用户支持的缓存Redis的最大限额是多少？**

A：目前每个用户支持的缓存Redis最大限额为5个，如不能满足您的业务需求，请联系客服。

**Q：云主机为何访问不了Redis实例？**

A：1.首先确认该云主机和Redis在同一个VPC中；2.如是同一VPC内，请按[连接实例](https://docs.jdcloud.com/cn/jcs-for-redis/connect-instances)文档检查格式和内容是否正确；3.如果前两个步骤都没问题仍连接不了，请联系客服寻求帮助。


**Q：Redis版本和支持的命令有哪些？**

A：请参考[命令支持](https://docs.jdcloud.com/cn/jcs-for-redis/command-supported)文档，仍未解决请联系客服。


**Q：如何将Redis数据导入导出？**

A：请参考[数据迁移](https://docs.jdcloud.com/cn/jcs-for-redis/data-migration)文档，仍未解决请联系客服。
