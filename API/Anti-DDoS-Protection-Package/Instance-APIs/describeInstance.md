# describeInstance


## 描述
查询防护包实例

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域编码|
|**instanceId**|String|True| |防护包实例 Id|

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
|**data**|Instance| |
### Instance
|名称|类型|描述|
|---|---|---|
|**id**|String|防护包实例 Id|
|**name**|String|防护包实例名称|
|**region**|String|防护包实例地域|
|**type**|Integer|套餐类型, 1: 独享 IP, 2: 共享 IP|
|**ipCount**|Integer|可防护 IP 个数|
|**basicBandwidth**|Integer|保底带宽, 单位 Gbps|
|**elasticBandwidth**|Integer|弹性带宽, 单位 Gbps|
|**expireTime**|String|实例过期时间|
|**createTime**|String|实例创建时间|
|**protectedObjects**|ProtectedObject[]|防护对象|
|**onTrial**|Boolean|是否为试用防护包|
|**resourceId**|String|资源 Id|
### ProtectedObject
|名称|类型|描述|
|---|---|---|
|**type**|String|防护对象类型: eip: 弹性公网 IP, cps: 云物理服务器|
|**count**|Integer|已防护 IP 个数|
|**ipList**|ProtectedIp[]|防护 IP 列表|
### ProtectedIp
|名称|类型|描述|
|---|---|---|
|**ip**|String|被防护 IP|
|**safeStatus**|Integer|安全状态, 0: 安全, 1: 清洗, 2: 黑洞|
|**resourceType**|Integer|公网 IP 类型或绑定资源类型:<br>  0: 未知类型,<br>  1: 弹性公网 IP(IP 为弹性公网 IP, 绑定资源类型未知),<br>  10: 弹性公网 IP(IP 为弹性公网 IP, 但未绑定资源),<br>  11: 云主机,<br>  12: 负载均衡,<br>  13: 原生容器实例,<br>  14: 原生容器 Pod,<br>  2: 云物理服务器,<br>|
|**protectionRuleType**|Integer|防护规则类型, 0: 默认(防护包的防护规则), 1: IP 自定义规则|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
