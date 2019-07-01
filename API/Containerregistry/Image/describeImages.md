# describeImages


## 描述
返回指定repository中images的元数据，包括image size, image tags和creation date。


## 请求方式
GET

## 请求地址
https://containerregistry.jdcloud-api.com/v1/regions/{regionId}/images

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**filters**|Filter[]|False| |registryName - 镜像仓储名称 <br>repositoryName - 镜像库名称 <br>imageDigest - 镜像哈希值 <br>imageTag - 镜像标签 <br>tagStatus - 打标TAGGED或没打标UNTAGGED <br>|
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
|**imageDetails**|ImageDetail[]|镜像列表|
|**totalCount**|Number| |
### ImageDetail
|名称|类型|描述|
|---|---|---|
|**registryName**|String|image registry 表示镜像的注册表归属|
|**repositoryName**|String|image repository表示镜像的仓库归属|
|**imageDigest**|String|image manifest的sha256摘要|
|**imageManifest**|String|镜像的Manifest|
|**imagePushedAt**|String|当前image被push到repository的时间|
|**imageSizeMB**|Double|image在repository中的大小。从Docker 1.9之后的版本, Docker client会压缩镜像层数据再push到V2版本的Docker registry。<br>docker image命令显示的是解压后的镜像大小，因此会比DescribeImages接口返回的镜像大小会大很多。      <br>|
|**imageTags**|String[]|镜像关联的所有Tag|
|**lastPullAt**|String|最近pull的时间|
|**totalPullTimes**|Integer|镜像被拉取次数|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
