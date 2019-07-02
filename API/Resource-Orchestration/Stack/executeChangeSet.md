# executeChangeSet


## 描述
执行更改集

## 请求方式
POST

## 请求地址
https://jdro.jdcloud-api.com/v1/regions/{regionId}/stacks/{stackId}/changesets/{changesetId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**stackId**|String|True| |资源栈 ID|
|**changesetId**|String|True| |更改集 ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Object|始终为空|
|**requestId**|String|请求的标识id|


## 返回码
|返回码|描述|
|---|---|
|**200**|执行更改集|
