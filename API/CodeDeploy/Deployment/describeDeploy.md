# describeDeploy


## 描述
查询一个部署任务详情

## 请求方式
GET

## 请求地址
https://deploy.jdcloud-api.com/v1/regions/{regionId}/deploy/{deployId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID|
|**deployId**|String|True| |Deploy Id|

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
|**deploy**|Deploy| |
### Deploy
|名称|类型|描述|
|---|---|---|
|**deployId**|String|上线单ID|
|**appId**|String|应用ID|
|**appName**|String|应用名称|
|**groupId**|String|部署组名称|
|**groupName**|String|部署组ID|
|**regionId**|String|地域|
|**startTime**|Integer|部署开始时间|
|**endTime**|Integer|部署结束时间|
|**deployStatus**|Integer|部署状态 0待部署, 1部署中, 2成功, 3失败, 4回滚中， 5回滚成功， 6回滚失败， 7已取消|
|**desc**|String|描述|
|**deployMethod**|Integer|部署方式：1滚动部署，2蓝绿部署|
|**deploySource**|Integer|部署来源：1url，2云编译，3云存储|
|**deployCmd**|String|部署操作|
|**cmdSource**|Integer|1使用输入的操作，2使用程序自带操作|
|**cmdType**|Integer|部署操作展示格式：1form,2ymal|
|**productType**|Integer|项目类型 1tomcat,2|
|**downloadUrl**|String|下载url|
|**md5**|String|md5|
|**compileProject**|String|云编译项目名|
|**compileSeries**|String|云编译构建序号|
|**ossSpace**|String|云存储空间|
|**ossDir**|String|云存储目录|
|**fileType**|Integer|文件类型：1.tar，2.zio,3.tar.gz|
|**rollbackAble**|Integer|是否可回滚 1是，2否|
|**threshold**|Integer|部署阈值|
|**concurrencyUnit**|Integer|并发单位|
|**concurrencyNum**|Integer|并发机器数|
|**concurrencyPct**|Integer|并发度|
|**lbStatus**|Integer|负载均衡：1启动，2禁用|
|**lbInstance**|String|lb实例|
|**lbBackend**|String|lb 后端实例|
|**repeatPolicy**|Integer|同名文件处理方式：1部署失败，2覆盖，3保留|
|**noticeTrigger**|Integer|通知频率：1异常发送，2每次发送|
|**noticeMethod**|String[]|通知方式：1消息，2邮件，3短信|
|**jdsfEnabled**|Integer|使用分布式服务框架：0不使用，1使用|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
