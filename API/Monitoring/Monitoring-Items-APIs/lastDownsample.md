# lastDownsample


## 描述
查看某资源的最后一个点,metric介绍：<a href="https://docs.jdcloud.com/cn/monitoring/metrics">Metrics</a>

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v1/regions/{regionId}/metrics/{metric}/lastDownsample

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**metric**|String|True| |监控项英文标识(id)|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**serviceCode**|String|True| |资源的类型，取值vm, lb, ip, database 等|
|**resourceId**|String|True| |资源的uuid，支持多个resourceId批量查询，每个id用竖线分隔。 如：id1|id2|id3|id4|
|**tags**|TagFilter[]|False| |自定义标签|
|**startTime**|String|False| |查询时间范围的开始时间， UTC时间，格式：yyyy-MM-dd'T'HH:mm:ssZ（默认为当前时间，早于30d时，将被重置为30d）|
|**endTime**|String|False| |查询时间范围的结束时间， UTC时间，格式：2016-12- yyyy-MM-dd'T'HH:mm:ssZ（为空时，将由startTime与timeInterval计算得出）|
|**timeInterval**|String|False| |查询的时间间隔，最大不超过30天，支持分钟级别,小时级别，天级别，例如：1m、1h、1d|
|**aggrType**|String|False| |聚合方式：max avg min等,用于不同维度之间聚合|
|**downAggrType**|String|False| |聚合方式：max avg min等,用于将维度内一个周期数据聚合为一个点的聚合方式|

### TagFilter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**key**|String|False| |Tag键|
|**values**|String[]|False| |Tag值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**items**|LastDownsampleRespItem[]| |
### LastDownsampleRespItem
|名称|类型|描述|
|---|---|---|
|**metric**|String| |
|**name**|String| |
|**value**|Object| |

## 返回码
|返回码|描述|
|---|---|
|**200**|查看某资源的最后一个点|
