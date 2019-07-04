# describeMetricData


## 描述
查看某资源多个监控项数据，metric介绍1：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v1/regions/{regionId}/metrics/{metric}/metricData

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**metric**|String|True| |监控项英文标识(id)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**aggrType**|String|False| |聚合方式，默认等于downSampleType或avg，可选值参考:sum、avg、last、min、max|
|**downSampleType**|String|False| |采样方式，默认等于aggrType或avg，可选值参考：sum、avg、last、min、max|
|**startTime**|String|False| |查询时间范围的开始时间， UTC时间，格式：yyyy-MM-dd'T'HH:mm:ssZ|
|**endTime**|String|False| |查询时间范围的结束时间， UTC时间，格式：2016-12- yyyy-MM-dd'T'HH:mm:ssZ（为空时，将由startTime与timeInterval计算得出）|
|**timeInterval**|String|False| |时间间隔：1h，6h，12h，1d，3d，7d，14d，固定时间间隔，timeInterval默认为1h，当前时间往 前1h|
|**tags**|TagFilter[]|False| |自定义标签/tag；至少要传一个tag，且tag.Values不为空|
|**groupBy**|Boolean|False| |是否对查询的tags分组|
|**rate**|Boolean|False| |是否求速率|
|**serviceCode**|String|True| |资源的类型，取值vm, lb, ip, database 等|
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
