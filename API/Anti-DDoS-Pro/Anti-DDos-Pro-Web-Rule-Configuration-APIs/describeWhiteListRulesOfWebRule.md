# describeWhiteListRulesOfWebRule


## 描述
查询网站类规则的白名单规则列表

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/webRules/{webRuleId}/webWhiteListRules

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|
|**instanceId**|String|True| |高防实例 Id|
|**webRuleId**|String|True| |网站规则 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False| |页码, 默认为1|
|**pageSize**|Integer|False| |分页大小, 默认为10, 取值范围[10, 100]|


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
|**dataList**|WebWhiteListRule[]| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|总数|
|**totalPage**|Integer|总页数|
### WebWhiteListRule
|名称|类型|描述|
|---|---|---|
|**id**|String|白名单规则 Id|
|**name**|String|白名单规则名称|
|**mode**|Integer|匹配模式:<br>- 0: uri<br>- 1: ip<br>- 2: cookie<br>- 3: geo<br>- 4: header|
|**key**|String|匹配 key. <br>- mode 为 cookie 时, 为 cookie 的 name<br>- mode 为 header 时, 为 header 的 key|
|**value**|String|匹配 value. <br>- mode 为 uri 时, 为要匹配的 uri<br>- mode 为 ip 时, 为引用的 ip 黑白名单 Id<br>- mode 为 cookie 时, 为 cookie 的 value<br>- mode 为 header 时, 为 header 的 value|
|**pattern**|Integer|匹配规则, mode 为 uri, cookie 和 header 时有效. 包含以下匹配规则: <br>- 0: 完全匹配<br>- 1: 前缀匹配<br>- 2: 包含<br>- 3: 正则匹配<br>- 4: 后缀匹配|
|**action**|Integer|命中后处理动作. <br>- 0: 放行<br>- 1: CC 防护|
|**status**|Integer|规则状态. <br>- 0: 关闭<br>- 1: 开启|
|**geoList**|Geo[]|geo 白名单地域列表|
### Geo
|名称|类型|描述|
|---|---|---|
|**label**|String|geo 拦截地域|
|**value**|String|geo 拦截地域编码|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
