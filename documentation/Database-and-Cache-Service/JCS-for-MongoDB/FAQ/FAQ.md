# 常见问题

**Q：云数据库 MongoDB 支持公网连接吗？**

A：出于安全考虑，云数据库 MongoDB 目前仅提供内网连接，暂不提供公网连接。如果您需要本地直接连接 MongoDB 实例，可以通过代理转发的方式实现，操作方式请参见“[公网连接 MongoDB 实例](../Best-Practices/Public-Network-Connect-to-MongoDB-Instance.md)”。


**Q：云数据库 MongoDB 哪些版本？**

A：云数据库 MongoDB目前支持3.2、3.4版和3.6版。


**Q：云数据库 MongoDB 支持哪些协议？**

A：京东云云数据库MongoDB完全兼容MongoDB官方协议，使用方法可参见“[MongoDB官方文档](https://docs.mongodb.com/v3.2/introduction/)”。

**Q：oplog大小是多少，是否支持调整？**

A：oplog是实例存储空间的5%，暂不支持调整大小。

   
**Q：为什么看到监控里，MongoDB内存占用比很高？**

A：MongoDB使用的是内存映射存储引擎，它会把磁盘IO操作转换成内存操作，如果是读操作，内存中的数据起到缓存的作用，如果是写操作，内存还可以把随机的写操作转换成顺序的写操作，可以大幅度提升性能，用户不用担心内存占用比例较高的问题。如果内存容量已成为性能瓶颈请升级实例配置，操作方式请参见“[变更实例配置](../Operation-Guide/Instance-Management/Modify-Instance-Spec.md)”。

**Q：目前使用的是本地 MongoDB 4.0版，如果转到云上使用3.6版，需要注意什么？**

A：MongoDB 4.0 新增了一些功能特性，转为使用3.6版时，需注意以下内容：

1. 避免使用多文档事务。
2. 避免使用新增的聚合命令。

	- 类型转换

		| Operator | Description |
		|---|:---|
		| $convert | Convert value to specified type. |
		| $toBool | Convert value to boolean. |
		| $toDate | Convert value to Date. |
		| $toDecimal | Convert value to Decimal128. |
		| $toDouble | Convert value to Double. |
		| $toInt | Convert value to integer. |
		| $toLong | Convert value to long. |
		| $toObjectId | Convert value to ObjectId. |
		| $toString | Convert value to string. |

	- 字符处理

		| Operator | Description |
		|---|:---|
		|$ltrim|Removes whitespace or the specified characters from the beginning of a string.|
		|$rtrim|Removes whitespace or the specified characters from the end of a string.|
		|$trim|Removes whitespace or the specified characters from the beginning and end of a string.|

3. 避免使用新增的监控命令(FreeMonitoring)。
4. 注意4.0版改进的一些命令的使用。

	- 命令
	
		| Operator | Description |
		|---|:---|
		|db.collection.drop() |accepts the write concern option.|

	- 地理位置查询

		| Operator | Description |
		|---|:---|
		|$geoNear|support using the minDistance option with 2d indexes.<br /> adds a key option that enables users to specify which geospatial index to use when querying a collection with multiple geospatial indexes. |
		|$near|support using the minDistance option with 2d indexes.|
		|$nearSphere|support using the minDistance option with 2d indexes.|

5. 4.0特性详细说明，请查看[官方文档](https://docs.mongodb.com/manual/release-notes/4.0/)。
