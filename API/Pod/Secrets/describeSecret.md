# describeSecret


## 描述
查询单个 secret 详情


## 请求方式
GET

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/secrets/{name}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**name**|String|True| |Secret Name|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**secret**|Secret| |
### Secret
|名称|类型|描述|
|---|---|---|
|**name**|String|镜像仓库认证信息名称|
|**type**|String|镜像仓库认证信息类型|
|**createdAt**|String|镜像仓库认证信息创建时间|
|**data**|DockerRegistryData|镜像仓库认证信息数据|
### DockerRegistryData
|名称|类型|描述|
|---|---|---|
|**server**|String|registry服务器地址|
|**username**|String|用户名|
|**password**|String|密码|
|**email**|String|邮件地址|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
