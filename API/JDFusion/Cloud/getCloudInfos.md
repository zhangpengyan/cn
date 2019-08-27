# getCloudInfos


## 描述
获取当前用户的云注册信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/cloud_info

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**driver**|String|False| |只获取对应driver的云信息|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**clouds**|CloudInfo[]| |
### CloudInfo
|名称|类型|描述|
|---|---|---|
|**id**|String| |
|**name**|String| |
|**vendor**|String| |
|**info**|Object| |
|**metadata**|Object| |

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|User not found|
