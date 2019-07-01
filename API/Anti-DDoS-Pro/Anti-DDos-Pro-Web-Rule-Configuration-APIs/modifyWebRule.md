# modifyWebRule


## 描述
修改网站类规则

## 请求方式
PATCH

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/webRules/{webRuleId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 Id|
|**instanceId**|Long|True| |高防实例 Id|
|**webRuleId**|Long|True| |网站规则 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**webRuleSpec**|WebRuleSpec|True| |更新网站类规则请求参数|

### WebRuleSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domain**|String|True| |子域名|
|**protocol**|WebRuleProtocol|True| |协议: http, https 至少一个为 true|
|**port**|Integer[]|False| |HTTP协议的端口号, 如80, 81; 如果 protocol.http 为 true, 至少配置一个端口, 最多添加 5 个|
|**httpsPort**|Integer[]|False| |HTTPS协议的端口号，如443, 8443; 如果 protocol.https 为 true, 至少配置一个端口, 最多添加 5 个|
|**originType**|String|True| |回源类型：A或者CNAME|
|**originAddr**|OriginAddrItem[]|False| |originType 为 A 时，需要设置该字段|
|**onlineAddr**|String[]|False| |备用的回源地址列表，可以配置为一个域名或者多个 ip 地址|
|**originDomain**|String|False| |回源域名,originType为CNAME时需要指定该字段|
|**algorithm**|String|True| |转发规则：wrr->带权重的轮询，rr->不带权重的轮询|
|**forceJump**|Integer|False| |是否开启 https 强制跳转，当 protocol 为 HTTP_HTTPS 时可以配置该属性<br>  - 0 不开启强制跳转<br>  - 1 开启强制跳转<br>|
|**customPortStatus**|Integer|False| |是否为自定义端口号，0为默认 1为自定义|
|**httpOrigin**|Integer|False| |是否开启http回源, 当勾选HTTPS时可以配置该属性<br>  - 0 不开启<br>  - 1 开启<br>|
|**webSocketStatus**|Integer|True| |是否开启 WebSocket, 0 为不开启, 1 为开启|
|**httpsCertContent**|String|False| |证书内容|
|**httpsRsaKey**|String|False| |证书私钥|
|**certId**|Long|False| |证书 Id<br>  - 如果传 certId, 请确认已经上传了相应的证书<br>  - certId 缺省时网站规则将使用 httpsCertContent, httpsRsaKey 对应的证书|
### OriginAddrItem
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ip**|String|False| |回源ip|
|**weight**|Integer|False| |权重|
|**inJdCloud**|Boolean|False| |是否为京东云内公网ip|
### WebRuleProtocol
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**http**|Boolean|True| |http 协议|
|**https**|Boolean|True| |https 协议|

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
|**code**|Integer|修改网站类规则结果, 0: 修改失败, 1: 修改成功|
|**message**|String|修改失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
