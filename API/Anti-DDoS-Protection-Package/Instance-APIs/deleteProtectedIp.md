# deleteProtectedIp


## 描述
删除防护包防护 IP

## 请求方式
POST

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances/{instanceId}:deleteProtectedIp

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域编码|
|**instanceId**|String|True| |防护包实例 Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**protectedIpSpec**|ProtectedIpSpec|True| |删除防护包防护 IP 请求参数|

### ProtectedIpSpec
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ip**|String[]|True| |被防护 IP 列表|

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
|**code**|Integer|删除防护 IP 结果, 0: 删除失败, 1: 删除成功|
|**message**|String|删除失败时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
