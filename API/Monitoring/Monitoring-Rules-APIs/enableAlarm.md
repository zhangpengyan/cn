# enableAlarms


## 描述
启用、禁用规则

## 请求方式
POST

## 请求地址
https://monitor.jdcloud-api.com/v2/groupAlarms:switch


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**alarmIds**|String[]|True| |告警规则的ID列表|
|**state**|Long|False| |启用:1,禁用0,|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**success**|Boolean| |

## 返回码
|返回码|描述|
|---|---|
|**200**|启用、禁用规则|
