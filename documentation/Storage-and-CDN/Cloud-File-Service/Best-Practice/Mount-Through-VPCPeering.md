# 通过对等连接实现跨VPC挂载文件存储



# 准备工作

1. 在VPC内创建文件存储，并在该VPC内创建挂载目标，也可使用已有的文件存储。为了描述方便，下文将挂载目标所在的VPC称为“VPC 1”。在“控制台”-“云文件服务”-“文件存储”页面内，点击需要跨VPC访问的文件存储ID，确认该文件存储及其挂载目标状态均为“可用”。

创建文件存储操作可参见“创建文件存储<https://docs.jdcloud.com/cn/cloud-file-service/creating-file-system>”

2. 由于对等连接（VPC Peering）要求对等连接的两端私有网络 CIDR 不可以重叠，因此需要在“控制台”-“私有网络”-“私有网络（VPC）”列表页中分别查看文件存储挂载目标所在VPC和对等连接另一端VPC的CIDR是否有重叠。为了描述方便，下文将对等连接另一端需要访问文件存储的VPC成为“VPC 2“。

![VPCcheck](../../../../image/Cloud-File-Service/VPCpeering_VPCcheck.png)

如果对等连接另一端的VPC还未创建，可参考“VPC配置（<https://docs.jdcloud.com/cn/virtual-private-cloud/vpc-configuration>）”中的“创建VPC”部分内容进行创建。注意CIDR不可与文件存储挂载目标所在VPC的CIDR重叠。

这里有个小的实践技巧：一般实际业务中，需要跨VPC访问文件存储的云主机实例可能已经存在并且正在使用，而“对等连接“又要求两个VPC的CIDR不能重叠。为了不迁移现有云主机，可以新建VPC并将文件存储的挂载目标创建在这个新建的VPC中，以避免对现有云主机的影响。使用对等连接也不会产生额外的费用，对文件存储的访问性能也基本没有影响。

# 操作步骤

## 1. 创建对等连接

操作指南详见：VPC对等连接（https://docs.jdcloud.com/cn/virtual-private-cloud/vpc-peering-configuration ）

必须完成VPC1到VPC2和VPC2到VPC1的两个对等连接的创建，才能够实现两个VPC的互通。

首先创建VPC 1到VPC 2的对等连接：

1） 地域选择文件存储所在的同一个地域；

2） 本端VPC根据VPC名称选择VPC1（挂载目标所在VPC）；

3）对端VPC ID选择VPC2（对端云主机所在VPC）的VPC ID，可在控制台私有网络中点击该VPCid后查看；

4）填写完成后点击“确定”，提示是否配置路由，点击“前往配置”进行配置；

5）在“路由表”页面根据列表中“所属网络”找到VPC1当前关联的路由表，点击路由表名称-“路由策略”页签，点击“编辑”按钮，编辑路由表。

目的端：VPC2 或挂载目标所在子网的CIDR或范围；

下一跳类型：选择VPC对等连接；

下一跳：之前创建好的VPC 1到VPC 2的对等连接。

6）点击“保存”，完成路由策略创建。

然后创建VPC 2到VPC1的对等连接，步骤与之前相同，注意本段VPC选择VPC2，对端ID填写VPC1的VPD ID，路由策略中的“目的端”填写VPC1的CIDR或范围。

 

## 2. 在VPC2内挂载文件存储

操作指南详见：挂载文件存储 （https://docs.jdcloud.com/cn/cloud-file-service/mount-file-system）  

登录VPC2内需要挂载文件存储的云主机，按照操作指南中的挂载方式挂载文件存储，其中执行挂载命令时，挂载目标IP为VPC2内挂载目标的IP。

## 3. 验证挂载状态

挂载完成后，在VPC2 内的云主机运行 df –h，在FileSystem中可以看到文件存储即挂载成功。
