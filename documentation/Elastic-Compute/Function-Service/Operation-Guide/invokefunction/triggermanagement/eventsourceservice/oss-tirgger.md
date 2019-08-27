# OSS触发器

对象存储服务（OSS：Object Storage Service）是京东云自主研发的大规模分布式对象存储服务，面向企业和个人开发者提供高可用、低成本、强安全的云端存储服务。您可以实现对数据的统一管理，满足各类存储需求。

 ## 触发器配置
 
触发器示例：ossTrigger.yml

```YAML
triggerConfig:
    events:
        s3:ObjectCreated:Put
        s3:ObjectCreated:Post
    filter:
       key:
           prefix: sourcefile/
           suffix: .gif
```

**说明：**

``filter `` 为OSS对象过滤参数，满足过滤条件的OSS对象才可以触发函数，包含如下属性：

 ``key``：过滤器支持过滤对象键（Key），包含如下属性：
           
 ``prefix``：匹配前缀
 ``suffix``：匹配后缀



OSS触发器触发器配置参数说明见表1。

表1 OSS触发器信息表

|  字段        |  说明                                                         |
| ----------- | ------------------------------------------------------------ |
| * 触发器类型 |  在下拉列表中选择“OSS对象存储触发器“。 |
| * bucket列表 |  选择事件源的OSS存储桶。从已创建同region下的OSS存储桶中选择。|
| * 触发事件   |  选择要使其触发函数的事件。支持的事件类型请参考表1。 |
|  前缀        |  匹配前缀，您可以将通知配置为按对象名称的前缀和后缀进行过滤。 |
|  后缀        |  匹配后缀，您可以将通知配置为按对象名称的前缀和后缀进行过滤。 |  



## OSS事件定义

当OSS捕获到事件发生后，会以[event参数](../configtigger-event.md)传递给事件处理函数，OSS当前的事件触发类型与[OSS回调通知](http://docs.jdcloud.com/cn/object-storage-service/callback-notification-2)支持事件类型相同，详情见表2，* 为必填项。

表2 OSS支持事件类型

| 事件名称                                  | 说明                                                         |
| ----------------------------------------- | ------------------------------------------------------------ |
| s3:ObjectCreated:*                       | 创建Object的行为，包含Put   Object，   Post Object，Copy Object，Complete Multipart Upload |
| s3:ObjectCreated:Put                     | 使用Put Object上传文件                                       |
| s3:ObjectCreated:Post                    | 使用Post Object上传文件                                      |
| s3:ObjectCreated:Copy                    | 使用Put Object-Copy复制文件                                  |
| s3:ObjectCreated:CompleteMultipartUpload | 完成分片上传                                                 |
| s3:ObjectRemoved:*                       | 删除Object的行为，包含Delete   Object                        |
| s3:ObjectRemoved:Delete                  | 删除文件                                                     |



 

## OSS触发器使用说明

资源与事件是组成OSS触发器的两个要素：
 
 * 资源由Bucket和前缀后缀组合组成。同一个Bucket，若前缀相同或为包含关系则视为同一个资源；同理，后缀相同或为包含关系亦视为同一个资源；前缀后缀同时相同或分别为包含关系同样视为同一个资源。
 
 * 事件是触发事件，包括表1中的事件类型。
  
  目前，OSS网关触发器仅支持同地域Function绑定，OSS触发器与函数的重复绑定不做限制。
  
  **场景一**：同一个OSS资源和同一个事件可以绑定同一个或多个函数，当重复绑定时，事件只会触发绑定的第一个函数。
  
  **场景二**：同一个OSS资源和不同事件可以绑定同一个或多个函数，当重复绑定时，若事件类型有包含，例如:配置两个触发器，同一个Bucket，事件类型分别为： s3:ObjectCreated:* 和s3:ObjectCreated:Put （s3:ObjectCreated:*包含s3:ObjectCreated:Put事件），当用户上传一个文件至Bucket，只会触发第一个被绑定函数。

 
注意：
1. 只有资源和事件同时不相同时，绑定的函数才可以同时被触发。
2. 使用 OSS 触发器一定要避免 **循环触发**。一个典型的循环触发场景是 OSS 的某个 Bucket 上传文件触发函数执行，这个函数又生成了一个或多个文件，写回到 OSS 的 Bucket 里，这个写入动作又触发了函数执行，形成了链状循环。
