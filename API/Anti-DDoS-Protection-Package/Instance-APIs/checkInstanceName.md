# checkInstanceName


## 描述
检测实例名称是否可用, 防护包实例名称不可重复

## 请求方式
GET

## 请求地址
https://antipro.jdcloud-api.com/v1/checkInstanceName


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**instanceName**|String|True| |待检测实例名称, 长度限制为 1-80 个字符, 只允许包含中文, 字母, 数字, -, ., /, _|


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
|**code**|Integer|检测结果 code, 0: 不可用, 1: 可用|
|**message**|String|检测结果, 不可用时给出具体原因|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
