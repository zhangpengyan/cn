# checkName


## 描述
检测实例名称是否合法

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/checkName

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |待检测实例名称|


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
|**code**|Integer|检测结果 code, 0: 不可用, 1: 可用|
|**message**|String|检测结果, 不可用时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
