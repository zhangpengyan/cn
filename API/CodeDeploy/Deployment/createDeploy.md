# createDeploy


## 描述
创建部署任务

## 请求方式
POST

## 请求地址
https://deploy.jdcloud-api.com/v1/regions/{regionId}/deploy

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**groupId**|String|True| |部署组ID，部署组的唯一标识|
|**desc**|String|False| |描述|
|**deploySource**|Integer|True| |部署来源：1url，2云编译，3云存储|
|**deployCmd**|String|False| |部署操作|
|**cmdSource**|Integer|False|1|1使用输入的操作，2使用程序自带操作|
|**cmdType**|Integer|False|1|部署操作展示格式：1form,2ymal|
|**productType**|Integer|False| |项目类型 1tomcat,2|
|**downloadUrl**|String|False| |下载url|
|**md5**|String|False| |md5|
|**compileProject**|String|False| |云编译项目名|
|**compileSeries**|String|False| |云编译构建序号|
|**ossSpace**|String|False| |云存储空间|
|**ossDir**|String|False| |云存储目录|
|**fileType**|Integer|False|1|文件类型：1.tar，2.zip,3.tar.gz|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**deployId**|String|上线单ID|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**429**|Quota exceeded|
|**500**|Internal server error|
|**503**|Service unavailable|
