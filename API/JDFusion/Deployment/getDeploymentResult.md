# getDeploymentResult


## 描述
查询执行结果

## 请求方式
GET

## 请求地址
https://jdfusion.jdcloud-api.com/v1/regions/{regionId}/deployments/{id}/result

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**id**|String|True| |deployment ID|
|**regionId**|String|True| |地域ID|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求ID|

### Result
|名称|类型|描述|
|---|---|---|
|**task**|TaskInfo| |
### TaskInfo
|名称|类型|描述|
|---|---|---|
|**beginTime**|String|任务执行开始时间|
|**endTime**|String|任务执行结束时间|
|**taskStatus**|String|任务执行状态：running、finished|
|**taskResult**|String|任务执行结果：done、error、nochange|
|**lastCode**|String|任务执行最后编码:<br>CREATEING_RESOURCE_INFO->未完成:正在构建目标资源信息<br>CREATE_RESOURCE_INFO_ERROR->失败完成:目标资源描述信息创建失败！<br>CREATE_RESOURCE_INFO_SUCCESS->未完成:目标资源描述信息创建成功！开始初始化构建程序<br>PROGRAM_INITING->未完成:正在初始化构建程序<br>PROGRAM_INIT_ERROR->失败完成:构建程序初始化失败！<br>PROGRAM_INIT_SUCCESS->未完成:构建程序初始化成功！开始分析本次构建任务<br>TASK_PLAN_ERROR->失败完成:构建分析发生错误！<br>TASK_PLAN_NOCHANGE->完成:本次构建无可执行操作<br>TASK_PLAN_SUCCESS->未完成:分析完成！开始执行资源构建<br>TASK_RUN_FAILED->失败完成:资源构建任务执行失败！<br>TASK_RUN_NOCHANGE->完成:本次构建未执行任何操作<br>TASK_RUN_SUCCESS->完成:资源构建任务执行完毕！|
|**taskLastInfo**|String|任务执行之后编码描述|
|**resourceIDs**|Object[]|任务执行成功后返回的ID列表|
|**msg**|Object[]|任务执行日志信息|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|not found|
