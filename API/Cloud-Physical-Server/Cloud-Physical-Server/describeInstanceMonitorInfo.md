# describeInstanceMonitorInfo


## 描述
查询云物理服务器监控信息

## 请求方式
GET

## 请求地址
https://cps.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/monitor

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeRegiones）获取云物理服务器支持的地域|
|**instanceId**|String|True| |云物理服务器ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTime**|Long|False| |开始时间的时间戳，格式：1562915166551|
|**endTime**|Long|False| |结束时间的时间戳，格式：1562915166551|
|**metrics**|String[]|False| |cps.cpu.util - CPU使用率<br/><br>cps.memory.util - 内存使用率<br/><br>cps.memory.used - 内存使用量<br/><br>cps.disk.used - 磁盘使用量<br/><br>cps.disk.util - 磁盘使用率<br/><br>cps.disk.bytes.read - 磁盘读流量<br/><br>cps.disk.bytes.write - 磁盘写流量<br/><br>cps.disk.counts.read - 磁盘读IOPS<br/><br>cps.disk.counts.write - 磁盘写IOPS<br/><br>cps.network.bytes.ingress - 网卡进流量<br/><br>cps.network.bytes.egress - 网卡出流量<br/><br>cps.network.packets.ingress - 网络进包量<br/><br>cps.network.packets.egress - 网络出包量<br/><br>cps.avg.load1 - CPU平均负载1min<br/><br>cps.avg.load5 - CPU平均负载5min<br/><br>cps.avg.load15 - CPU平均负载15min<br/><br>cps.tcp.connect.total - TCP总连接数<br/><br>cps.tcp.connect.established - TCP正常连接数<br/><br>cps.process.total - 总进程数<br>|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**metricDatas**|MetricData|云物理服务器监控信息|
### MetricData
|名称|类型|描述|
|---|---|---|
|**data**|MetricValue[]|监控指标数据|
|**tags**|MetricTag[]|监控指标标签|
|**metric**|MetricInfo|监控指标概览|
### MetricInfo
|名称|类型|描述|
|---|---|---|
|**calculateUnit**|String|监控数据统计单位|
|**metirc**|String|监控数据指标|
|**metricName**|String|监控数据指标描述|
|**aggregator**|String|监控数据聚合方式|
|**period**|String|监控数据统计周期|
### MetricTag
|名称|类型|描述|
|---|---|---|
|**tagKey**|String|监控数据标签|
|**tagValue**|String|监控数据标签数据|
### MetricValue
|名称|类型|描述|
|---|---|---|
|**timestamp**|Long|数据采集时间，格式：1562915166551|
|**value**|String|采集的数据|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Bad request|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
