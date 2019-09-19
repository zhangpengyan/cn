# describeMetricData


## 描述
查看某资源单个监控项数据，metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>，可以使用接口<a href="https://docs.jdcloud.com/cn/monitoring/metrics">describeMetrics</a>：查询产品线可用的metric列表。

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v2/regions/{regionId}/metrics/{metric}/metricData

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**metric**|String|True| |监控项英文标识(id)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**aggrType**|String|False| |聚合方式，可选值参考:sum、avg、min、max|
|**downSampleType**|String|False| |采样方式，可选值参考：sum、avg、last、min、max|
|**startTime**|String|False| |查询时间范围的开始时间， UTC时间，格式：2016-12-11T00:00:00+0800（注意在url中+要转译为%2B故url中为2016-12-11T00:00:00%2B0800）|
|**endTime**|String|False| |查询时间范围的结束时间， UTC时间，格式：2016-12-11T00:00:00+0800（为空时，将由startTime与timeInterval计算得出）（注意在url中+要转译为%2B故url中为2016-12-11T00:00:00%2B0800）|
|**timeInterval**|String|False| |时间间隔：1h，6h，12h，1d，3d，7d，14d，固定时间间隔，timeInterval默认为1h，当前时间往 前1h|
|**tags**|TagFilter[]|False| |监控指标数据的维度信息,根据tags来筛选指标数据不同的维度|
|**groupBy**|Boolean|False| |是否对查询的tags分组|
|**rate**|Boolean|False| |是否求速率|
|**serviceCode**|String|False| |资源的类型，取值vm, lb, ip, database 等,<a href="https://docs.jdcloud.com/cn/monitoring/api/describeservices?content=API&SOP=JDCloud">describeServices</a>：查询己接入云监控的产品线列表，当产品线下有多个分组时，查询分组对应的监控项，serviceCode请传对应分组的groupCode字段值|
|**dimension**|String|False| |资源的维度|
|**resourceId**|String|True| |资源的uuid|

### TagFilter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**key**|String|False| |Tag键|
|**values**|String[]|False| |Tag值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**metricDatas**|MetricData[]| |
### MetricData
|名称|类型|描述|
|---|---|---|
|**data**|DataPoint[]| |
|**metric**|Metric| |
|**tags**|Tag[]| |
### Tag
|名称|类型|描述|
|---|---|---|
|**tagKey**|String| |
|**tagValue**|String| |
### Metric
|名称|类型|描述|
|---|---|---|
|**aggregator**|String| |
|**calculateUnit**|String| |
|**metric**|String| |
|**metricName**|String| |
|**period**|String| |
### DataPoint
|名称|类型|描述|
|---|---|---|
|**timestamp**|Long| |
|**value**|Object| |

## 返回码
|返回码|描述|
|---|---|
|**200**|api DescribeMetricData Response|
