# deleteRepository


## 描述
删除指定用户下某个镜像仓库.
</br>敏感操作，可开启<a href="https://docs.jdcloud.com/IAM/Operation-Protection">MFA操作保护</a>

## 请求方式
DELETE

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/registries/{registryName}/repositories/{repositoryName}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**registryName**|String|True| |注册表名称|
|**repositoryName**|String|True| |镜像仓库名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**force**|Boolean|False| |是否强制删除有镜像的镜像仓库|


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
