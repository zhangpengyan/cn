# scheduleKeyDeletion


## 描述
计划在以后的是个时间点删除密钥，默认为7天

## 请求方式
DELETE

## 请求地址
https://kms.jdcloud-api.com/v1/key/{keyId}:delete

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**keyId**|String|True| |密钥ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**delayDays**|Integer|False| |延迟删除时间，单位（天），默认为7天；支持时间范围：7~30天|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**202**|Accepted|
|**404**|Not found|
