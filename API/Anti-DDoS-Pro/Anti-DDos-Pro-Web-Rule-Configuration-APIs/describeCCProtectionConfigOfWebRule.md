# describeCCProtectionConfigOfWebRule


## 描述
查询网站类规则的 CC 防护配置

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/webRules/{webRuleId}:ccProtectionConfig

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
|**data**|CCProtectionConfig| |
### CCProtectionConfig
|名称|类型|描述|
|---|---|---|
|**enable**|Integer|网站规则的 CC 防护状态, 0: 关闭, 1: 开启|
|**observerMode**|Integer|观察者模式, 0: 关闭, 1: 开启|
|**level**|Integer|防护等级, 0: 正常, 1: 宽松, 2: 紧急, 3: 自定义|
|**ccThreshold**|Long|HTTP 请求数阈值|
|**hostQps**|Long|Host 的防护阈值|
|**hostUrlQps**|Long|Host + Url 的防护阈值|
|**ipHostQps**|Long|每个源 IP 对 Host 的防护阈值|
|**ipHostUrlQps**|Long|每个源 IP 对 Host + Url 的防护阈值|
|**ccProtectionRuleEnableCount**|Long|开启的 CC 防护规则数量|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
