# deleteAlarmsCm


## 描述
删除自定义监控规则

## 请求方式
DELETE

## 请求地址
https://monitor.jdcloud-api.com/v1/regions/{regionId}/cmAlarms

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |region|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**ids**|String|True| |ids,多个id用|分隔|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Object| |
|**requestId**|String|请求的标识id|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
