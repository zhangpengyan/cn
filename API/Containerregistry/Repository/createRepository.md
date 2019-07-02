# createRepository


## 描述
通过参数创建镜像仓库。
仓库名称可以分解为多个路径名，每个名称必须至少包含一个小写字母数字，考虑URL规范。
支持包含段划线或者下划线进行分割，但不允许点'.'，多个路径名之间通过("/")连接，总长度不超过256个字符，当前只支持二级目录。


## 请求方式
POST

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/registries/{registryName}/repositories

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|
|**registryName**|String|True| |注册表名称|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**repositoryName**|String|True| |镜像仓库名称。<br>可以专有模式如默认命名空间nginx-web-app；或者和命名空间一起将多个仓库聚集在一起如 project-a/nginx-web-app。<br>|
|**description**|String|False| |注册表描述，<a href="https://www.jdcloud.com/help/detail/3870/isCatalog/1">参考公共参数规范</a>。<br>|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**repository**|RepositoryShort| |
### RepositoryShort
|名称|类型|描述|
|---|---|---|
|**createdAt**|String|记录用户repository创建的时间。|
|**repositoryName**|String|镜像仓库repository名称。|
|**repositoryUri**|String|repository的URI，用户通过docker CLI,制定该URI直接进行docker pull/push等操作。|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
