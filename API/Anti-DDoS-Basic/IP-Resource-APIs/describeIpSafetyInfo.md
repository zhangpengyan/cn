# describeIpSafetyInfo


## 描述
查询基础防护已防护公网 IP 安全信息, 支持 ipv4 和 ipv6

## 请求方式
GET

## 请求地址
https://baseanti.jdcloud-api.com/v1/regions/{regionId}/describeIpSafetyInfo

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域编码. 基础防护已支持华北-北京, 华东-宿迁, 华东-上海, 华南-广州|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ip**|String|True| |基础防护已防护公网 IP.<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeelasticipresources">describeElasticIpResources</a> 接口查询基础防护已防护的私有网络弹性公网 IP<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describecpsipresources">describeCpsIpResources</a> 接口查询基础防护已防护的云物理服务器公网IP 和 弹性公网 IP<br>|


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
|**data**|IpSafetyInfo| |
### IpSafetyInfo
|名称|类型|描述|
|---|---|---|
|**ip**|String|公网 IP 地址|
|**safetyStatus**|Integer|安全状态, 0->安全, 1->清洗, 2->黑洞|
|**region**|String|地域编码|
|**blackHoleThreshold**|Long|黑洞阈值, 单位 bps|
|**cleanThresholdBps**|Long|触发清洗的流量速率, 单位 bps|
|**cleanThresholdPps**|Long|触发清洗的包速率, 单位 pps|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
