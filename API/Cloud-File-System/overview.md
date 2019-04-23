# CFS的API


## 简介
CFS(Cloud-File-Service)的API包含CFS相关接口。


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**createFileSystem**|POST|- 创建一个新的文件系统，为这个文件系统分配一个Id<br>|
|**createMountTarget**|POST|- 为一个文件系统创建一个挂载目标。通过这个挂载目标,你可以挂载将一个文件系统挂载到主机实例上。<br>- 创建一个挂载目标，为这个挂载目标分配一个Id<br>|
|**deleteFileSystem**|DELETE|-   删除一个文件系统，一旦删除，该文件系统将不存在，也无法访问已删除的文件系统里的任何内容。<br>|
|**deleteMountTarget**|DELETE|-   删除挂载目标的同时会删除相关的网络接口。<br>|
|**describeFileSystem**|GET|查询文件系统详情|
|**describeFileSystems**|GET|-   查询文件系统列表。<br>-   filters多个过滤条件之间是逻辑与(AND)，每个条件内部的多个取值是逻辑或(OR)<br>|
|**describeMountTarget**|GET|查询挂载目标详情|
|**describeMountTargets**|GET|-   查询挂载目标列表。<br>|
|**modifyFileSystemAttribute**|PATCH|修改文件系统属性(name 和 description 必须要指定一个)|
