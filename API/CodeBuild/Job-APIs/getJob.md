# getJob


## 描述
根据id获取构建任务的配置信息

## 请求方式
GET

## 请求地址
https://compile.jdcloud-api.com/v1/regions/{regionId}/jobs/{id}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |Job uuid|
|**regionId**|String|True| |Region ID|

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
|**job**|Job| |
### Job
|名称|类型|描述|
|---|---|---|
|**uuid**|String|构建任务uuid|
|**createdAt**|Integer|创建时间戳|
|**updatedAt**|Integer|最后一次更新时间|
|**name**|String|构建名称|
|**codeType**|String|代码存储类型，目前只支持github|
|**codeRepoUrl**|String|代码clone路径|
|**codeRepoUrlLabel**|String|代码名称的显示Label|
|**codeRepoBranch**|String|分支|
|**createUserName**|String|创建者|
|**codeRepoPrivate**|Boolean|是否是私有仓库|
|**createUserPin**|String|最后一次更细者|
|**ossPath**|String|用户云存储路径，如果为空，使用公用的云存储|
|**ossHost**|String|用户云存储主机，实际为用户云存储所在地域|
|**ossBucket**|String|用户云存储bucket，如果为空，使用公用的云存储|
|**buildImage**|String|编译镜像地址|
|**buildImageLabel**|String|编译镜像的显示Label|
|**isUserBuildSetConfig**|Boolean|是否在页面配置构建方式，这项为true，则buildSetConfig需要有内容，如果这项为false，即使buildSetConfig有内容，也不生效|
|**buildSetConfig**|String|见isUserBuildSetConfig的说明|
|**buildTimeOut**|Integer|超时时间，单位秒|
|**buildResourceCpu**|Integer|cpu分配核数|
|**buildResourceMem**|Integer|内存分配大小，单位MB|
|**noticeMail**|String|通知邮件|
|**noticeType**|String|通知频率， MAIL_FAILED失败时通知，MAIL_EVERY每次构建就通知|
|**compilerType**|String|构建类型|
|**dockerRegistry**|String|镜像注册表名|
|**dockerRepository**|String|镜像仓库名|
|**dockerRegistryUri**|String|注册表的URI|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
