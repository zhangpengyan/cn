# createVersion


## 描述
创建版本

## 请求方式
POST

## 请求地址
https://function.jdcloud-api.com/v1/regions/{regionId}/functions/{functionName}/versions

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**functionName**|String|True| |函数名称|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**description**|String|False| |版本描述|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result|创建版本返回值|
|**requestId**|String|本次请求Id|

### Result
|名称|类型|描述|
|---|---|---|
|**data**|Function| |
### Function
|名称|类型|描述|
|---|---|---|
|**functionId**|String|函数Id|
|**name**|String|函数名称|
|**description**|String|函数描述|
|**entrance**|String|函数入口，格式为入口文件.入口函数名|
|**memory**|Integer|函数运行最大内存|
|**runTime**|String|函数运行环境，目前有python3.6|
|**overTime**|Integer|函数超时时间|
|**version**|String|函数版本名称|
|**code**|Code|函数代码|
|**environment**|Env|函数环境变量|
|**logSetId**|String|函数指定的日志集id|
|**logTopicId**|String|函数指定的日志主题id|
|**codeCheckSum**|String|代码包校验和|
|**codeSize**|Integer|代码包大小，单位为字节|
|**downloadUrl**|String|代码包下载的url地址|
|**vpcId**|String|函数配置的VPCid|
|**subnetId**|String|函数配置的子网id|
|**createTime**|String|函数创建时间|
|**updateTime**|String|函数最后更新时间|
### Env
|名称|类型|描述|
|---|---|---|
|**data**|Object| |
### Code
|名称|类型|描述|
|---|---|---|
|**zipFile**|String|代码压缩文件，base64编码|
|**onlineCode**|String|在线编辑代码|
|**bucketName**|String|代码所在对象存储的bucket名称|
|**objectName**|String|代码所在对象存储的object名称|

## 返回码
|返回码|描述|
|---|---|
|**200**|A successful response.|
