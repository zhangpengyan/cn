# describeMetrics


## 描述
根据产品线查询可用监控项列表,metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v1/metrics


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**serviceCode**|String|True| |资源的类型，取值vm, lb, ip, database 等|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**metrics**|MetricDetail[]| |
### MetricDetail
|名称|类型|描述|
|---|---|---|
|**calculateUnit**|String|指标的计算单位，比如bit/s、%、k等|
|**downSample**|String|取样频次|
|**metric**|String|监控项英文标识|
|**metricName**|String|监控项名称|
|**serviceCode**|String|产品线标识|

## 返回码
|返回码|描述|
|---|---|
|**200**|get Metric list of serviceCode|
