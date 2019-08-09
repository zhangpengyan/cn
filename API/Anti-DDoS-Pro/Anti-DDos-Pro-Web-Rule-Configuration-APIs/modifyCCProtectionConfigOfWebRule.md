# modifyCCProtectionConfigOfWebRule


## 描述
修改网站类规则的 CC 防护配置

## 请求方式
PATCH

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/webRules/{webRuleId}:ccProtectionConfig

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|
|**instanceId**|String|True| |高防实例 Id|
|**webRuleId**|String|True| |网站规则 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ccProtectionConfigSpec**|CCProtectionConfigSpec|True| |修改 CC 防护配置请求参数|

### CCProtectionConfigSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**level**|Integer|True| |防护等级, 0: 正常, 1: 宽松, 2: 紧急, 3: 自定义|
|**ccThreshold**|Long|False| |HTTP 请求数阈值, 防护等级为自定义时必传|
|**hostQps**|Long|False| |Host 的防护阈值, 防护等级为自定义时必传|
|**hostUrlQps**|Long|False| |Host + Url 的防护阈值, 防护等级为自定义时必传|
|**ipHostQps**|Long|False| |每个源 IP 对 Host 的防护阈值, 防护等级为自定义时必传|
|**ipHostUrlQps**|Long|False| |每个源 IP 对 Host + Url 的防护阈值, 防护等级为自定义时必传|

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
|**code**|Integer|0: 修改失败, 1: 修改成功|
|**message**|String|修改失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
