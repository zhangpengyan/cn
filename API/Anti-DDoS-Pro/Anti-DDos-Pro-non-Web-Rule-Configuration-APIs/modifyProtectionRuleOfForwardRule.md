# modifyProtectionRuleOfForwardRule


## 描述
修改非网站类转发规则的防护规则

## 请求方式
POST

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/forwardRules/{forwardRuleId}:modifyProtectionRule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|
|**instanceId**|String|True| |高防实例 Id|
|**forwardRuleId**|String|True| |转发规则 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**forwardProtectionRuleSpec**|ForwardProtectionRuleSpec|True| |修改非网站类转发规则的防护规则请求参数|

### ForwardProtectionRuleSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**spoofIpEnable**|Integer|True| |虚假源与空连接, 0: 关闭, 1: 开启|
|**srcNewConnLimitEnable**|Integer|True| |源新建连接限速, 0: 关闭, 1: 开启|
|**srcNewConnLimitValue**|Long|True| |源新建连接速率|
|**srcConcurrentConnLimitEnable**|Integer|True| |源并发连接限速, 0: 关闭, 1: 开启|
|**srcConcurrentConnLimitValue**|Long|True| |源并发连接速率|
|**dstNewConnLimitEnable**|Integer|True| |目的新建连接, 0: 关闭, 1: 开启|
|**dstNewConnLimitValue**|Long|True| |目的新建连接速率|
|**dstConcurrentConnLimitEnable**|Integer|True| |目的并发连接, 0: 关闭, 1: 开启|
|**dstConcurrentConnLimitValue**|Long|True| |目的并发连接速率|
|**datagramRangeMin**|Long|True| |报文最小长度, 取值范围[0, datagramRangeMax)|
|**datagramRangeMax**|Long|True| |报文最大长度, 取值范围(datagramRangeMin, 1518]|
|**geoBlackList**|String[]|False| |geo 拦截地域编码列表. 查询 <a href="http://docs.jdcloud.com/anti-ddos-pro/api/describegeoareas">describeGeoAreas</a> 接口获取可设置的地域编码列表|

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
|**code**|Integer|0: 修改规则失败, 1: 修改规则成功|
|**message**|String|修改规则失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
