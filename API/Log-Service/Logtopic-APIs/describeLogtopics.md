# describeLogtopics


## 描述
查询日志主题列表，支持按照名称模糊查询。

## 请求方式
GET

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/logsets/{logsetUID}/logtopics

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**logsetUID**|String|True| |日志集 UID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Long|False| |当前所在页，默认为1|
|**pageSize**|Long|False| |页面大小，默认为20；取值范围[1, 100]|
|**name**|String|False| |日志主题名称|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|LogtopicDetailEnd[]|日志主题列表|
|**numberPages**|Long|总页数|
|**numberRecords**|Long|总记录数|
|**pageNumber**|Long|当前页码|
|**pageSize**|Long|分页大小|
### LogtopicDetailEnd
|名称|类型|描述|
|---|---|---|
|**collectInfo**|CollectInfoDetailEnd| |
|**uID**|String|UID|
|**collectInfoUID**|String|采集配置UID|
|**createTime**|String|创建时间|
|**description**|String|描述信息|
|**lastRecordTime**|String|最新日志上报时间|
|**logsetName**|String|所属日志集名称|
|**logsetUID**|String|所属日志集|
|**name**|String|日志主题名称|
|**region**|String|地域信息|
### CollectInfoDetailEnd
|名称|类型|描述|
|---|---|---|
|**uID**|String|UID|
|**appCode**|String|日志来源，只能是 custom|
|**detail**|CollectTempalteEnd| |
|**enabled**|Long| |
|**resourceType**|String|采集实例类型, 只能是 all/part|
|**resourcesCount**|Long|采集实例数量|
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
|**200**|查询日志主题列表结果|
