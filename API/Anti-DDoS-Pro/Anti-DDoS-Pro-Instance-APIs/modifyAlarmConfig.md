# modifyAlarmConfig


## 描述
更新告警配置

## 请求方式
POST

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:modifyAlarmConfig

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**instanceId**|Long|True| |实例 ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**alarmConfigSpec**|AlarmConfigSpec|True| |更新告警配置请求参数|

### AlarmConfigSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**blackHoleAlarmEmailStatus**|Integer|False| |黑洞告警邮件开关 0 关闭 1 开启|
|**blackHoleAlarmSmsStatus**|Integer|False| |黑洞告警短信开关 0 关闭 1 开启|
|**blackHoleAlarmStatus**|Integer|False| |黑洞告警总开关  0 关闭 1 开启|
|**ddosAlarmEmailStatus**|Integer|False| |DDos 攻击告警邮件开关  0 关闭 1 开启|
|**ddosAlarmSmsStatus**|Integer|False| |DDos 攻击告警短信开关  0 关闭 1 开启|
|**ddosAlarmStatus**|Integer|False| |DDos 告警总开关 0 关闭 1 开启|
|**errorCodeAlarmStatus**|Integer|False| |错误码告警总开关|
|**errorCodeDomain**|String[]|False| |错误码告警域名列表|

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
|**code**|Integer|0: 修改失败, 1: 修改成功|
|**message**|String|修改失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
