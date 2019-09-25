# describeLogtopic


## 描述
查询日志主题基本信息。如配置了采集配置，将返回采集配置的UID

## 请求方式
GET

## 请求地址
https://logs.jcloud.com/v1/regions/{regionId}/logtopics/{logtopicUID}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id|
|**logtopicUID**|String|True| |日志主题 UID|

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
|**appCode**|String|日志来源,只在查询单个日志主题并且创建了采集配置时返回值|
|**collectInfoUID**|String|采集配置UID|
|**createTime**|String|创建时间|
|**description**|String|描述信息|
|**logsetName**|String|所属日志集名称|
|**logsetUID**|String|所属日志集|
|**name**|String|日志主题名称|
|**region**|String|地域信息|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询日志主题结果|
