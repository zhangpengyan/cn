# deleteAlarms


## 描述
删除规则

## 请求方式
DELETE

## 请求地址
https://monitor.jdcloud-api.com/v2/groupAlarms/{alarmId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**alarmId**|String|True| |规则id|

## 请求参数
无


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
|**200**|删除规则返回结果|
