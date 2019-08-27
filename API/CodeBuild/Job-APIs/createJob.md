# createJob


## 描述
新建构建任务

## 请求方式
POST

## 请求地址
https://compile.jdcloud-api.com/v1/regions/{regionId}/jobs

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**data**|JobRequest|False| | |

### JobRequest
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |项目名称|
|**codeType**|String|True| |源提供商，代码存储类型代码存储类型， 目前只支持github|
|**codeRepoUrl**|String|True| |仓库地址，代码clone路径|
|**codeRepoBranch**|String|True| |代码分支|
|**ossPath**|String|False| |获取用户OSS库用，用户云存储路径用户云存储路径，如果为空，使用公用的云存储|
|**ossHost**|String|True| |上传区域，用户云存储主机，实际为用户云存储所在地域|
|**ossBucket**|String|False| |获取用户OSS库用，用户云存储bucket，如果为空，使用公用的云存储|
|**buildImage**|String|True| |选择类型 和 运行版本 共同拼出此项，编译镜像地址|
|**isUserBuildSetConfig**|Boolean|False| |构建规范，选择在源代码供目录中使用build.yml则为false，选择插入构建命令则为true，这项为true，则buildSetConfig需要有内容，如果这项为false，即使buildSetConfig有内容，也不生效|
|**buildSetConfig**|String|False| |插入构建命令，isUserBuildSetConfig选择true时，这项让用户填写内容，内容从接口/regions/{regionId}/jobs/default/buildSet 获取|
|**buildTimeOut**|Integer|False| |超时时间，单位秒|
|**buildResourceCpu**|Integer|False| |计算类型中 cpu分配核数|
|**buildResourceMem**|Integer|False| |计算类型中 内存分配大小，单位MB|
|**noticeMail**|String|False| |通知邮件|
|**noticeType**|String|False| |通知频率， MAIL_FAILED失败时通知，MAIL_EVERY每次构建就通知|
|**compilerType**|String|False| |构建类型|
|**dockerRegistry**|String|False| |镜像注册表名|
|**dockerRepository**|String|False| |镜像仓库名|
|**dockerRegistryUri**|String|False| |注册表的URI|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String| |

### Result
|名称|类型|描述|
|---|---|---|
|**id**|String|构建任务的uuid|
|**codeRepoUrlLabel**|String|项目所有者/项目名称|
|**result**|Boolean|构建成功则是true|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
