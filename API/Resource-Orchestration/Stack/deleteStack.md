# deleteStack


## 描述
删除资源栈

## 请求方式
DELETE

## 请求地址
https://jdro.jdcloud-api.com/v1/regions/{regionId}/stacks/{stackId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID|
|**stackId**|String|True| |资源栈 ID|

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
|**details**|String| |

## 返回码
|返回码|描述|
|---|---|
|**200**|删除Stack结果, 删除成功返回Result为空|
