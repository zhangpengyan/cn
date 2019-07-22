# importImage


## 描述
导入镜像，将外部镜像导入到京东云中


## 请求方式
POST

## 请求地址
https://vm.jdcloud-api.com/v1/regions/{regionId}/images:import

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**architecture**|String|True| |系统架构，可选值：x86_64,i386|
|**osType**|String|True| |操作系统，可选值：windows,linux|
|**platform**|String|True| |平台名称，可选值：CentOS,Ubuntu,Windows Server,Other Linux,Other Windows|
|**diskFormat**|String|True| |磁盘格式，可选值：qcow2,vhd,vmdk,raw|
|**systemDiskSizeGB**|Integer|True| |以此镜像需要制作的系统盘的默认大小，单位GB。最小值40，最大值500，要求值是10的整数倍|
|**imageUrl**|String|True| |要导入镜像的对象存储外链地址|
|**osVersion**|String|False| |镜像的操作系统版本|
|**imageName**|String|True| |导入镜像的自定义名称|
|**description**|String|False| |导入镜像的描述信息|
|**forceImport**|Boolean|False| |是否强制导入。强制导入则忽略镜像的合规性检测|
|**clientToken**|String|False| |用户导入镜像的幂等性保证。每次创建请传入不同的值，如果传值与某次的clientToken相同，则返还该次的请求结果|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**imageId**|String|镜像id|
|**importTaskId**|Integer|导入任务id|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
