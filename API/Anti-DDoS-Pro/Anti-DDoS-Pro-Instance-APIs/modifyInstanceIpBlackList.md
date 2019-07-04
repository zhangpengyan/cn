# modifyInstanceIpBlackList


## 描述
设置实例 IP 黑名单

## 请求方式
POST

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:setIpBlackList

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**instanceId**|Long|True| |实例 ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ipBwListSpec**|IpBwListSpec|True| |设置 IP 黑名单请求|

### IpBwListSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ipList**|String[]|True| |IP 或 IP 段列表|
|**tryFlag**|Boolean|True| |false 时强制写入, true 时有重复则不写入|

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
|**code**|Integer|0: 设置 IP 黑名单失败, 1: 设置 IP 黑名单成功|
|**message**|String|对应提示消息|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
