# createCCProtectionRuleOfWebRule


## 描述
添加网站类规则的 CC 防护规则

## 请求方式
POST

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/webRules/{webRuleId}/ccProtectionRules

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|
|**instanceId**|String|True| |高防实例 Id|
|**webRuleId**|String|True| |网站规则 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ccProtectionRuleSpec**|CCProtectionRuleSpec|True| |添加 CC 防护规则请求参数|

### CCProtectionRuleSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |CC 防护规则名称, 不允许为空, 长度不超过 32 个字符, 支持中文, 大小写字母, 数字及字符'-'、'/'、'.'、'_'|
|**uri**|String|True| |uri, 不允许为空, 以 / 开头, 长度不超过 2048 个字符|
|**matchType**|Integer|True| |匹配 uri 类型, 0: 精确匹配, 1: 前缀匹配|
|**detectPeriod**|Long|True| |检测周期, 单位为秒, 取值范围[5, 10800]|
|**singleIpLimit**|Long|True| |ip 访问次数, 取值范围[2, 2000]|
|**blockType**|Integer|True| |阻断类型, 1: 封禁, 2: 人机交互|
|**blockTime**|Long|True| |阻断持续时间, 单位为秒, 取值范围[10, 86400]|

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
|**code**|Integer|0: 添加失败, 1: 添加成功|
|**message**|String|添加失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
