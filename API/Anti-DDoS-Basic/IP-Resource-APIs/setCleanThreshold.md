# setCleanThreshold


## 描述
设置基础防护已防护公网 IP 的清洗阈值, 仅支持 ipv4. (已废弃, 建议使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/setipcleanthreshold">setIpCleanThreshold</a> 接口)


## 请求方式
POST

## 请求地址
https://baseanti.jdcloud-api.com/v1/regions/{regionId}/ipResources/{ip}:setCleanThreshold

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域编码. 基础防护已支持华北-北京, 华东-宿迁, 华东-上海, 华南-广州|
|**ip**|String|True| |基础防护已防护的公网 IP, 仅支持 ipv4 格式<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeelasticipresources">describeElasticIpResources</a> 接口查询基础防护已防护的私有网络弹性公网 IP<br>- 使用 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describecpsipresources">describeCpsIpResources</a> 接口查询基础防护已防护的云物理服务器公网IP 和 弹性公网 IP|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**cleanThresholdSpec**|CleanThresholdSpec|True| |请求参数|

### CleanThresholdSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**cleanThresholdBps**|Long|True| |触发清洗的流量速率, 单位 bps. 取值范围由 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeipcleanthresholdrange">describeIpCleanThresholdRange</a> 接口查询可知<br>|
|**cleanThresholdPps**|Long|True| |触发清洗的报文流量速率, 单位 bps. 取值范围由 <a href="http://docs.jdcloud.com/anti-ddos-basic/api/describeipcleanthresholdrange">describeIpCleanThresholdRange</a> 接口查询可知<br>|

## 返回参数
|名称|类型|描述|
|---|---|---|
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

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
