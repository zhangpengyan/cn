# modifyProtectionRule


## 描述
修改防护包实例或 IP 的防护规则

## 请求方式
POST

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:modifyProtectionRule

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域编码|
|**instanceId**|String|True| |防护包实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**protectionRuleSpec**|ProtectionRuleSpec|True| |修改防护规则请求参数|

### ProtectionRuleSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ip**|String|False| |被防护 IP, 缺省时修改防护包实例防护规则|
|**type**|Integer|False| |防护规则类型, 修改 ip 防护规则时必传, 0: 设置 ip 使用防护包规则, 1: 设置 IP 使用自定义规则|
|**cleanThresholdBps**|Long|False| |清洗触发值 bps, 修改实例防护规则或自定义 IP 防护规则时必传|
|**cleanThresholdPps**|Long|False| |清洗触发值 pps, 修改实例防护规则或自定义 IP 防护规则时必传|
|**spoofIpEnable**|Integer|False| |虚假源, 0: 关闭, 1: 开启, 修改实例防护规则或自定义 IP 防护规则时必传|
|**srcNewConnLimitEnable**|Integer|False| |源新建连接限速, 0: 关闭, 1: 开启, 修改实例防护规则或自定义 IP 防护规则时必传|
|**srcNewConnLimitValue**|Long|False| |源新建连接速率, 修改实例防护规则或自定义 IP 防护规则时必传|
|**dstNewConnLimitEnable**|Integer|False| |目的新建连接, 0: 关闭, 1: 开启, 修改实例防护规则或自定义 IP 防护规则时必传|
|**dstNewConnLimitValue**|Long|False| |目的新建连接速率, 修改实例防护规则或自定义 IP 防护规则时必传|
|**datagramRangeMin**|Long|False| |报文最小长度, 取值范围 [1, datagramRangeMax)|
|**datagramRangeMax**|Long|False| |报文最大长度, 取值范围 (datagramRangeMin, 1518]|
|**geoBlackList**|String[]|False| |geo 拦截地域编码列表. 查询 <a href="http://docs.jdcloud.com/anti-ddos-protection-package/api/describegeoareas">describeGeoAreas</a> 接口获取可设置的地域编码列表|

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
|**code**|Integer|修改防护规则结果, 0: 修改失败, 1: 修改成功|
|**message**|String|修改失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
