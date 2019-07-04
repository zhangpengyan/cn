# deleteImage


## 描述
删除镜像
imageDigest imageTag imageTagStatus 三者只能且必须传一个。
可根据Tag状态删除Image，例如删除所有tagged的镜像。
digest和tag唯一表征单个镜像，其中imageDigest为sha256哈希，image manifest的digest。
例如 sha256:examplee6d1e504117a17000003d3753086354a38375961f2e665416ef4b1b2f；image使用的tag, 如  "precise" 
</br>敏感操作，可开启<a href="https://docs.jdcloud.com/IAM/Operation-Protection">MFA操作保护</a>

## 请求方式
POST

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/registries/{registryName}/repositories/{repositoryName}:deleteImage

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**registryName**|String|True| |注册表名称|
|**repositoryName**|String|True| |镜像仓库表名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**imageDigest**|String|False| |sha256哈希，image manifest的digest.|
|**imageTag**|String|False| |image使用的tag|
|**imageTagStatus**|String|False| |枚举中的一个值，如 tagged 和 untagged.|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
