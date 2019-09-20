#  调用链分析服务
调用链分析服务即提供了对某个服务、某个逻辑操作的执行情况进行的监控的功能。在微服务架构下，一个请求从发出到响应，中间可能经过了很多个服务的调用，调用链分析服务对分析服务调用关系、耗时操作、性能瓶颈上价值很大。
	
调用链分析服务包括新建分析服务、删除、修改、调用链查询、依赖图谱。

## 操作步骤：

### 新建分析服务
第1步：选择地域。
先选择分区，然后再在此分区中点击新建分析服务。如图所示，先选择“华北-北京”分区，再点击“新建分析服务”。
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dyl-list.png)
   
   
第2步：新建分析服务
您需依次录入服务名称、选择集群网络及子网ID、调用日志并发写入数量、填写备注。然后点击保存，完成创建过程
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dyl-add.png)
   
这里的调用日志并发写入数量需要您根据集群的TPS进行估计，其含义可以理解为整个业务集群总TPS乘以采样率。如果不太确定，建议选较低的档，然后根据系统运行起来后的实际TPS进行扩容。调用链分析服务只支持扩容，不支持缩容，请避免选择的规格过大。

调用链分析服务直接部署在用户VPC中，会根据用户选择的不同规格占用VPC中的不同数量的内网IP，请确保所选子网动态IP充足。
 
第3步：保存并创建成功后，可在调用链分析服务列表中，看见新增的调用链分析服务。


### 查看调用链服务详情


第1步：选择调用链，然后点击服务名称
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dyl-list.png)

第2步：查看详情。
 
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dyl-detail.png)

请根据连接调用链服务使用的不同网络协议，选择合适的调用链地址。



###  依赖图谱

第1步：先选择调用链，然后点击列表右侧的依赖图谱操作。
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dyl-list.png)
 
第2步：选择时间单位，查看依赖图谱
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dyl-yltp.png)
   
第3步：点击具体的服务，查看Trace信息
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dly-trace.png)
   
第4步：点击一个具体的Trace，查看Trace详情
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dly-trace-detail.png)




###   修改服务规格和信息
修改功能，仅支持对调用日志并发写入数量和备注的修改，其余内容不可更改。

第1步：选择需要修改的服务
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dyl-list.png)
 
第2步：变更调用日志并发写入数量
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dyl-up.png)


###   删除服务

###  第1步：选择需要删除的服务
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dyl-list.png)
 
###  第2步：点击确定进行删除。
   ![](../../../../../image/Internet-Middleware/JD-Distributed-Service-Framework/dyl-del.png)

说明：
- 删除后调用链数据会丢弃，请谨慎操作。


