# checkPodName


## 描述
podName 是否符合命名规范，以及查询指定 podName 区域内是否已经存在。


## 请求方式
POST

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/pods:checkPodName

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**podName**|String|True| |用户定义的 pod 名称，符合 DNS-1123 subdomain 规范。|
|**maxCount**|Integer|False| |需要创建的 pod 总数，默认创建一个，不同的总数会对校验结果产生影响。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**code**|Integer|用户指定 podName 是否通过校验 0 通过 1 名称为空 2 不符合规范 3 重名。|
|**reason**|String|code 字段非零时，给出详细原因。|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
