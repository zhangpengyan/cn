# describeCollectInfo


## 描述
采集配置的基本信息。

## 请求方式
GET

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/collectinfos/{collectInfoUID}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**collectInfoUID**|String|True| |采集配置 UID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**uID**|String|UID|
|**appCode**|String|日志来源|
|**detail**|CollectTempalteEnd| |
|**enabled**|Long| |
|**hasResource**|Boolean|是否存在资源|
|**logsetUID**|String|日志集 UID|
|**logtopicUID**|String|日志主题 UID|
|**resourceType**|String|采集实例类型, 只能是 all/part|
|**serviceCode**|String|产品线|
|**templateName**|String|日志类型名称|
|**templateUID**|String|日志类型|
### CollectTempalteEnd
|名称|类型|描述|
|---|---|---|
|**filterEnabled**|Boolean|过滤器是否启用|
|**logFile**|String|日志文件|
|**logFilters**|String[]|过滤器|
|**logPath**|String|日志路径|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询采集配置结果|
