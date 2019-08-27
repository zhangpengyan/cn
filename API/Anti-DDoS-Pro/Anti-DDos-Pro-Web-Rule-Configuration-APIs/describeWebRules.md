# describeWebRules


## 描述
查询某个实例下的网站类规则

## 请求方式
GET

## 请求地址
https://ipanti.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}/webRules

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |区域 ID, 高防不区分区域, 传 cn-north-1 即可|
|**instanceId**|String|True| |高防实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False| |页码, 默认为1|
|**pageSize**|Integer|False| |分页大小, 默认为10, 取值范围[10, 100]|
|**searchType**|String|False| |查询类型名称, domain:源站域名, ip:源站 IP, rawDomain: 域名|
|**searchValue**|String|False| |查询类型值|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**dataList**|WebRule[]| |
|**currentCount**|Integer|当前页数量|
|**totalCount**|Integer|总数|
|**totalPage**|Integer|总页数|
### WebRule
|名称|类型|描述|
|---|---|---|
|**id**|String|规则 Id|
|**instanceId**|String|实例 Id|
|**domain**|String|子域名|
|**cname**|String|规则的 CNAME|
|**cnameStatus**|Integer|CNAME 解析状态, 0: 解析异常, 1: 解析正常|
|**protocol**|WebRuleProtocol| |
|**customPortStatus**|Integer|是否为自定义端口号, 0: 为默认, 1: 为自定义|
|**port**|Integer[]|HTTP 协议的端口号, 如 80,81|
|**httpsPort**|Integer[]|HTTPS 协议的端口号, 如 443,8443|
|**httpOrigin**|Integer|是否开启 HTTP 回源, 0: 为不开启, 1: 为开启, 当勾选 HTTPS 时可以配置该属性|
|**status**|Integer|0: 防御状态, 1: 回源状态|
|**originType**|String|回源类型: A 或者 CNAME|
|**originAddr**|OriginAddrItem[]|回源域名, originType 为 A 时返回该字段|
|**originDomain**|String|回源域名, originType 为 CNAME 时返回该字段|
|**onlineAddr**|String[]|备用的回源地址列表, 为一个域名或者多个 IP 地址|
|**httpCertStatus**|Integer|证书状态. <br>- 0: 异常<br>- 1: 正常<br>- 2: 证书未上传|
|**certId**|String|证书 Id|
|**certName**|String|证书名称|
|**httpsCertContent**|String|证书内容|
|**httpsRsaKey**|String|证书私钥|
|**forceJump**|Integer|是否开启 HTTPS 强制跳转, 当 protocol 为 HTTP_HTTPS 时可以配置该属性<br>- 0: 不强跳<br>- 1: 开启强跳|
|**algorithm**|String|转发规则. <br>- wrr: 带权重的轮询<br>- rr:  不带权重的轮询<br>- sh:  源地址hash|
|**ccStatus**|Integer|CC 状态, 0: CC 关闭, 1: CC 开启|
|**webSocketStatus**|Integer|webSocket 状态, 0: 关闭, 1: 开启|
|**blackListEnable**|Integer|黑名单状态, 0: 关闭, 1: 开启|
|**whiteListEnable**|Integer|白名单状态, 0: 关闭, 1: 开启|
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
|**404**|NOT_FOUND|
