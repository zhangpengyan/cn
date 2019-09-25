# JCLOUD MONITOR API


## 简介
monitor API


### 版本
v2


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**createAlarm**|POST|创建报警规则|
|**deleteAlarms**|DELETE|删除规则|
|**describeAlarm**|GET|查询规则详情|
|**describeAlarmContacts**|GET|查询规则的报警联系人|
|**describeAlarmHistory**|GET|查询报警历史|
|**describeAlarms**|GET|查询规则列表|
|**describeMetricData**|GET|查看某资源单个监控项数据，metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>，可以使用接口<a href="https://docs.jdcloud.com/cn/monitoring/metrics">describeMetrics</a>：查询产品线可用的metric列表。|
|**describeMetrics**|GET|根据产品线查询可用监控项列表,metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>|
|**describeMetricsForAlarm**|GET|查询可用于创建报警规则的指标列表,metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>|
|**describeProductsForAlarm**|GET|查询可用于创建报警规则的产品列表|
|**describeServices**|GET|查询监控图可用的产品线列表|
|**enableAlarms**|POST|启用、禁用规则|
|**lastDownsample**|GET|将某资源单个metric数据聚合为一个点,metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>|
|**putMetricData**|POST|该接口为自定义监控数据上报的接口，方便您将自己采集的时序数据上报到云监控。不同region域名上报不同region的数据，参考：<a href="https://docs.jdcloud.com/cn/monitoring/reporting-monitoring-data">调用说明</a>可上报原始数据和已聚合的统计数据。支持批量上报方式。单次请求最多包含 50 个数据点；数据大小不超过 256k。|
|**updateAlarm**|PUT|修改已创建的报警规则|
