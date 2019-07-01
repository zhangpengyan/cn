# describeProtectionOutline


## 描述
防护包防护信息概要

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/describeProtectionOutline


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
|**data**|ProtectionOutline| |
### ProtectionOutline
|名称|类型|描述|
|---|---|---|
|**protectedDay**|Long|已防护天数|
|**protectedIpCount**|Long|已防护 IP 数量|
|**weekAttackCount**|Long|7 日攻击次数|
|**weekAttackPeak**|Double|7 日攻击流量峰值|
|**weekAttackUnit**|String|7 日攻击流量单位|
|**monthAttackCount**|Long|30 日攻击次数|
|**monthAttackPeak**|Double|30 日攻击流量峰值|
|**monthAttackUnit**|String|30 日攻击流量单位|
|**currentAttackCount**|Long|当前攻击数量|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
