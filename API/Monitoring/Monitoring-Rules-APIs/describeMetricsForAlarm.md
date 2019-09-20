# describeMetricsForAlarm


## 描述
查询可用创建监控规则的指标列表,metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v2/groupAlarms:metrics


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**serviceCode**|String|False| |产品线|
|**product**|String|False| |产品类型，如redis2.8cluster(集群)\redis2.8MS(主从)。当serviceCode与product同时指定时，product优先级更高|
|**dimension**|String|False| |产品维度，必须指定serviceCode或product才生效。|
|**metricType**|Long|False| |metric类型，取值0、1；默认值：0（常规指标，用于控制台创建报警规则）、1（其它）|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**metrics**|RuleMetricDetail[]|规则列表|
### RuleMetricDetail
|名称|类型|描述|
|---|---|---|
|**calculateUnit**|String|指标的计算单位，比如bit/s、%、k等|
|**dimension**|String|维度标识|
|**metric**|String|监控项唯一标识，可根据DescribeMetricsForCreateAlarm接口查询各产品线可用的监控项（创建规则时使用Metric字段）。格式：metric:downsample|
|**metricName**|String|监控项名称|
|**product**|String|产品标识|
|**serviceCode**|String|产品线标识|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询可用创建监控规则的指标列表结果|
