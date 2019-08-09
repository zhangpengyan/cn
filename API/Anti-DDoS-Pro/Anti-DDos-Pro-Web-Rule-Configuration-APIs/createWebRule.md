# createWebRule


## 描述
添加网站类规则

## 请求方式
POST

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/webRules

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|
|**instanceId**|String|True| |高防实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**webRuleSpec**|WebRuleSpec|True| |添加网站类规则请求参数|

### WebRuleSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domain**|String|True| |子域名|
|**protocol**|WebRuleProtocol|True| |协议: http, https 至少一个为 true|
|**port**|Integer[]|False| |HTTP 协议的端口号, 如80, 81; 如果 protocol.http 为 true, 至少配置一个端口, 最多添加 5 个|
|**httpsPort**|Integer[]|False| |HTTPS 协议的端口号, 如443, 8443; 如果 protocol.https 为 true, 至少配置一个端口, 最多添加 5 个|
|**originType**|String|True| |回源类型：A 或者 CNAME|
|**originAddr**|OriginAddrItem[]|False| |originType 为 A 时, 需要设置该字段|
|**onlineAddr**|String[]|False| |备用的回源地址列表, 可以配置为一个域名或者多个 ip 地址|
|**originDomain**|String|False| |回源域名, originType 为 CNAME 时需要指定该字段|
|**algorithm**|String|True| |转发规则. <br>- wrr: 带权重的轮询<br>- rr:  不带权重的轮询<br>- sh:  源地址hash|
|**forceJump**|Integer|False| |是否开启 HTTPS 强制跳转, protocol.http 和 protocol.https 都为 true 时此参数生效. <br>- 0: 不开启强制跳转. <br>- 1: 开启强制跳转|
|**customPortStatus**|Integer|False| |是否为自定义端口号. 0: 默认<br>- 1: 自定义|
|**httpOrigin**|Integer|False| |是否开启 HTTP 回源, protocol.https 为 true 时此参数生效. <br>- 0: 不开启. <br>- 1: 开启|
|**webSocketStatus**|Integer|True| |是否开启 WebSocket.<br>- 0: 不开启<br>- 1: 开启|
|**httpsCertContent**|String|False| |证书内容|
|**httpsRsaKey**|String|False| |证书私钥|
|**certId**|String|False| |证书 Id. <br>- 如果传 certId, 请确认已经上传了相应的证书<br>- certId 缺省时网站规则将使用 httpsCertContent, httpsRsaKey 对应的证书|
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
