# 云编译


## 简介
云编译相关接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**createJob**|POST|新建构建任务|
|**deleteJob**|DELETE|删除一个编译任务|
|**deleteJobs**|DELETE|批量删除编译任务|
|**getBuildLog**|GET|查询构建任务执行日志|
|**getBuildStatus**|GET|查询构建任务执行的状态|
|**getExternalLink**|GET|生成带有效期的包地址|
|**getJob**|GET|根据id获取构建任务的配置信息|
|**getJobs**|GET|查询获取编译任务列表，并显示最后一次编译的一些信息|
|**startJob**|POST|根据id启动一个编译任务|
|**stopBuild**|POST|停止构建任务|
|**updateJob**|PUT|更新编译任务|
