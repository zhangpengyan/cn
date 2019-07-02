# createForwardRule


## 描述
添加非网站类规则

## 请求方式
POST

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/forwardRules

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 Id|
|**instanceId**|Long|True| |高防实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**forwardRuleSpec**|ForwardRuleSpec|True| |添加非网站类规则请求参数|

### ForwardRuleSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**protocol**|String|True| |协议: TCP或者UDP|
|**port**|Integer|True| |端口号, 取值范围[1, 65535]|
|**algorithm**|String|True| |转发规则<br>- wrr 带权重的轮询<br>- wlc 加权最小连接<br>- rr  不带权重的轮询<br>- sh  源地址hash<br>|
|**originType**|String|True| |回源类型: A 或者 CNAME|
|**originAddr**|OriginAddrItem[]|False| | |
|**onlineAddr**|String[]|False| |备用的回源地址列表, 可以配置为一个域名或者多个 ip 地址|
|**originDomain**|String|False| |回源域名|
|**originPort**|Integer|True| |回源端口号, 取值范围[1, 65535]|
### OriginAddrItem
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ip**|String|False| |回源ip|
|**weight**|Integer|False| |权重|
|**inJdCloud**|Boolean|False| |是否为京东云内公网ip|

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
|**code**|Integer|0: 添加规则失败, 1: 添加规则成功|
|**message**|String|添加规则失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
