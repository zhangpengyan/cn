# getVmImages


## 描述
根据过滤条件，取得镜像资源的信息

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/vm_images

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**x-jdcloud-nonce**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-date**|String|True| |获取方式请参考签名算法指导文档|
|**authorization**|String|True| |获取方式请参考签名算法指导文档|
|**x-jdcloud-fusion-cloudid**|String|False| |云注册信息ID|
|**imageSource**|String|False| |镜像来源： system：系统官方公共镜像。 self：用户自定义镜像。 others：用户共享的镜像。 marketplace：镜像市场云市场 提供的镜像。|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**images**|ImageInfo[]| |
### ImageInfo
|名称|类型|描述|
|---|---|---|
|**id**|String|镜像ID|
|**name**|String|镜像名称|
|**description**|String|镜像描述|
|**architecture**|String|镜像架构|
|**createdTime**|String|创建时间|
|**imageSource**|String|镜像来源|
|**osType**|String|镜像操作系统类型|
|**platform**|String|操作系统平台|
|**progress**|String|镜像复制和转换时的进度，仅显示数值，单位为百分比|
|**size**|Integer|镜像大小 单位MB|
|**status**|String|状态|
|**cloudID**|String|云注册信息ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|ok|
