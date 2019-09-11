# enableWebRuleCC


## 描述
网站类规则开启 CC 防护, 开启后网站类规则已配置的防护规则和 CC 防护配置生效, 若没有配置过 CC 防护, 默认的 CC 防护配置生效。支持批量操作, 批量操作时 webRuleId 传多个, 以 ',' 分隔, 返回 result.code 为 1 表示操作成功, 为 0 时可能全部失败, 也可能部分失败

## 请求方式
POST

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/webRules/{webRuleId}:enableCC

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|
|**instanceId**|String|True| |高防实例 Id|
|**webRuleId**|String|True| |网站规则 Id|

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
|**code**|Integer|0: 开启 CC 失败, 1: 开启 CC 成功|
|**message**|String|开启 CC 失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
