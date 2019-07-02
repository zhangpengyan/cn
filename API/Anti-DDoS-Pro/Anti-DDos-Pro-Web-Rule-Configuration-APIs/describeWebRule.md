# describeWebRule


## 描述
查询网站类规则

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/webRules/{webRuleId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 Id|
|**instanceId**|Long|True| |高防实例 Id|
|**webRuleId**|Long|True| |网站规则 Id|

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
|**data**|WebRule| |
### WebRule
|名称|类型|描述|
|---|---|---|
|**id**|Long|规则 Id|
|**instanceId**|Long|实例 Id|
|**domain**|String|子域名|
|**cname**|String|规则的 cname|
|**protocol**|WebRuleProtocol| |
|**customPortStatus**|Integer|是否为自定义端口号, 0: 为默认, 1: 为自定义|
|**port**|Integer[]|HTTP 协议的端口号, 如 80,81|
|**httpsPort**|Integer[]|HTTPS 协议的端口号, 如 443,8443|
|**httpOrigin**|Integer|是否开启 http 回源, 0: 为不开启, 1: 为开启, 当勾选 HTTPS 时可以配置该属性|
|**status**|Integer|0: 防御状态, 1: 回源状态|
|**originType**|String|回源类型: A 或者 CNAME|
|**originAddr**|OriginAddrItem[]| |
|**originDomain**|String|回源域名, originType 为 CNAME 时返回该字段|
|**onlineAddr**|String[]| |
|**httpCertStatus**|Integer|证书状态, 0: 异常, 1: 正常, 2: 证书未上传|
|**certId**|Long|证书 Id|
|**certName**|String|证书名称|
|**httpsCertContent**|String|证书内容|
|**httpsRsaKey**|String|证书私钥|
|**forceJump**|Integer|是否开启https强制跳转, 当 protocol 为 HTTP_HTTPS 时可以配置该属性<br>  - 0 不强跳<br>  - 1 开启强跳<br>|
|**algorithm**|String|转发规则,  wrr: 带权重的轮询, rr: 不带权重的轮询|
|**ccStatus**|Integer|CC 状态, 0: CC 关闭, 1: CC 开启|
|**webSocketStatus**|Integer|webSocketStatus, 0: 关闭, 1: 开启|
### OriginAddrItem
|名称|类型|描述|
|---|---|---|
|**ip**|String|回源ip|
|**weight**|Integer|权重|
|**inJdCloud**|Boolean|是否为京东云内公网ip|
### WebRuleProtocol
|名称|类型|描述|
|---|---|---|
|**http**|Boolean|http 协议|
|**https**|Boolean|https 协议|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
