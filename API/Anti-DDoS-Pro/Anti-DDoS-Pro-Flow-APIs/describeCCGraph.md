# describeCCGraph


## 描述
CC 防护流量报表

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/charts:CCGraph

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTime**|String|True| |开始时间, 最多查最近 60 天, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**endTime**|String|True| |查询的结束时间, UTC 时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**instanceId**|Long[]|False| |高防实例 Id 列表|
|**subDomain**|String[]|False| |规则域名列表|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |
|**error**|Error| |

### Error
|名称|类型|描述|
|---|---|---|
|**code**|Integer|请求错误状态码|
|**status**|String|请求错误状态码|
|**message**|String|请求错误提示|
### Result
|名称|类型|描述|
|---|---|---|
|**postProtect**|Long[]|防护后 CC 次数|
|**preProtect**|Long[]|防护前 CC 次数|
|**time**|String[]|时间, 格式: yyyy-MM-dd'T'HH:mm:ssZ|
|**unit**|String|流量单位|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
