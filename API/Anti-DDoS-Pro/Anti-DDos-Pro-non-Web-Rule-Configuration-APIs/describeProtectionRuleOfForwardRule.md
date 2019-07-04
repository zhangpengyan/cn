# describeProtectionRuleOfForwardRule


## 描述
查询非网站类转发规则的防护规则

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/forwardRules/{forwardRuleId}:describeProtectionRule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 Id|
|**instanceId**|Long|True| |高防实例 Id|
|**forwardRuleId**|Long|True| |转发规则 Id|

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
|**code**|Integer|请求错误状态码|
|**status**|String|请求错误状态码|
|**message**|String|请求错误提示|
### Result
|名称|类型|描述|
|---|---|---|
|**protectionRule**|ForwardProtectionRule| |
### ForwardProtectionRule
|名称|类型|描述|
|---|---|---|
|**spoofIpEnable**|Integer|虚假源与空连接, 0: 关闭, 1: 开启|
|**srcNewConnLimitEnable**|Integer|源新建连接限速, 0: 关闭, 1: 开启|
|**srcNewConnLimitValue**|Long|源新建连接速率|
|**srcConcurrentConnLimitEnable**|Integer|源并发连接限速, 0: 关闭, 1: 开启|
|**srcConcurrentConnLimitValue**|Long|源并发连接速率|
|**dstNewConnLimitEnable**|Integer|目的新建连接限速, 0: 关闭, 1: 开启|
|**dstNewConnLimitValue**|Long|目的新建连接速率|
|**dstConcurrentConnLimitEnable**|Integer|目的并发连接限速, 0: 关闭, 1: 开启|
|**dstConcurrentConnLimitValue**|Long|目的并发连接速率|
|**datagramRangeMin**|Long|报文最小长度|
|**datagramRangeMax**|Long|报文最大长度|
|**geoBlackList**|GeoBlack[]|geo 拦截地域列表|
### GeoBlack
|名称|类型|描述|
|---|---|---|
|**label**|String|geo 拦截地域|
|**value**|String|geo 拦截地域编码|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
