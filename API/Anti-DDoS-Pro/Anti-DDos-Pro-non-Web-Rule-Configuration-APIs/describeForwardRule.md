# describeForwardRule


## 描述
查询非网站类规则

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/forwardRules/{forwardRuleId}

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
|**data**|ForwardRule| |
### ForwardRule
|名称|类型|描述|
|---|---|---|
|**id**|String|规则 Id|
|**instanceId**|String|实例 Id|
|**protocol**|String|TCP 或 UDP|
|**cname**|String|规则的 CNAME|
|**originType**|String|回源类型: ip 或者 domain|
|**port**|Integer|端口号|
|**algorithm**|String|转发规则. <br>- wrr: 带权重的轮询<br>- rr:  不带权重的轮询<br>- sh:  源地址hash|
|**originAddr**|OriginAddrItem[]| |
|**onlineAddr**|String[]|备用的回源地址列表|
|**originDomain**|String|回源域名|
|**originPort**|Integer|回源端口号|
|**status**|Integer|0: 防御状态<br>1: 回源状态|
### OriginAddrItem
|名称|类型|描述|
|---|---|---|
|**ip**|String|回源ip|
|**weight**|Integer|权重|
|**inJdCloud**|Boolean|是否为京东云内公网ip|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
