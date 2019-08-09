# describeWhiteListRuleOfForwardRule


## 描述
查询转发规则的白名单规则

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/forwardRules/{forwardRuleId}/forwardWhiteListRule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|
|**instanceId**|String|True| |高防实例 Id|
|**forwardRuleId**|String|True| |转发规则 Id|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |
|**error**|Error| |

### Error
|名称|类型|描述|
|---|---|---|
|**err**|Err| |
### Err
|名称|类型|描述|
|---|---|---|
|**code**|Long|同http code|
|**details**|Object| |
|**message**|String| |
|**status**|String|具体错误|
### Result
|名称|类型|描述|
|---|---|---|
|**data**|ForwardWhiteListRule| |
### ForwardWhiteListRule
|名称|类型|描述|
|---|---|---|
|**status**|Integer|是否开启, 0: 关闭, 1: 开启|
|**ipSetId**|String|引用的 IP 黑白名单 Id|
|**ipSetName**|String|引用的 IP 黑白名单名称|
|**ip**|String[]|IP 或 IP 段的数组|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
