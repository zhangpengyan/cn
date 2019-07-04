# describeRepositories


## 描述
描述用户指定 registry 下的 repository.


## 请求方式
POST

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/listRepositories

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**filters**|Filter[]|False| |name - 仓库名称，模糊匹配，支持单个<br>|
|**registryName**|String|False| |注册表名|
|**pageNumber**|Integer|False| |页码；默认为1|
|**pageSize**|Integer|False| |分页大小；默认为20；取值范围[10, 100]|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤条件的名称|
|**operator**|String|False| |过滤条件的操作符，默认eq|
|**values**|String[]|True| |过滤条件的值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**repositories**|Repository[]| |
|**totalCount**|Number| |
### Repository
|名称|类型|描述|
|---|---|---|
|**createdAt**|String|记录用户repository创建的时间。|
|**updatedAt**|String|记录用户repository更新的时间。|
|**registryName**|String|注册表名称。|
|**repositoryName**|String|镜像仓库名称。|
|**repositoryUri**|String|镜像仓库中的镜像总个数。|
|**totalSpaceUsedMB**|Double|镜像仓库大小。|
|**description**|String|镜像仓库描述。|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
