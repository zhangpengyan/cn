# describeMetrics


## 描述
根据产品线查询可用监控项列表,metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v2/metrics


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**serviceCode**|String|True| |资源的类型，取值vm, lb, ip, database 等。<a href="https://docs.jdcloud.com/cn/monitoring/api/describeservices?content=API&SOP=JDCloud">describeServices</a>：查询己接入云监控的产品线列表|
|**dimension**|String|False| |资源的维度。根据维度筛选metric。serviceCode下可用的dimension请使用describeServices接口查询|



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
|**dimension**|String|维度标识|
|**downSample**|String|取样频次|
|**metric**|String|监控项英文标识|
|**metricName**|String|监控项名称|
|**serviceCode**|String|产品线标识|

## 返回码
|返回码|描述|
|---|---|
|**200**|get Metric list of serviceCode|
