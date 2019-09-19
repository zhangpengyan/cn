# 云主机使用NAT网关

创建一个测试环境包括一个VPC，两个Subnet，一台云主机和一台NAT网关，验证NAT网关的Internet连通性

## 创建VPC，Subnet和云主机

1. 创建一个测试VPC(test-vpc)，在测试VPC中创建两个测试子网(subnet1,subnet2)，详细步骤请参见[VPC配置](../../Virtual-Private-Cloud/Operation-Guide/VPC-Configuration.md)和[子网配置](../../Virtual-Private-Cloud/Operation-Guide/Subnet-Configuration.md)

2. 在测试子网subnet1中创建一台测试没有公网IP的云主机(test-vm)，详细步骤参见[创建实例](../../../Elastic-Compute/Virtual-Machines/Operation-Guide/Instance/Create-Instance.md)

3. 创建两个路由表(rt1,rt2), rt1关联子网subnet1，rt2关联子网subnet2，详细步骤请参见[路由表配置](../../Virtual-Private-Cloud/Operation-Guide/Route-Table-Configuration.md)

## 创建NAT网关

1. 打开私有网络控制台 https://cns-console.jdcloud.com/host/vpc/list

2. 在左侧导航栏，点击**NAT 网关**

3. 在NAT网关页面，点击**创建**

4. 根据以下信息，配置NAT网关

| 配置 | 说明 |
| :- | :- |
| 地域与可用区 |	选择需要配置NAT网关的VPC所在的地域并选择可用区 |
| 规格 |	选择NAT网关的规格。NAT网关的规格会影响SNAT功能的最大连接数和每秒新建连接数，但不会影响数据吞吐量。详情参见[产品规格](../Introduction/Specifications.md) |
| 网络 |	选择需要配置NAT网关的VPC和子网 注：不要将NAT网关和要使用NAT网关的虚机创建在同一子网 |
| NAT网关公网IP |	选择NAT网关公网带宽 |
| 基本信息 |	填写NAT网关名称和描述 |

5. 确认信息无误后，点击**立即购买**

6. 确认订单信息，勾选**已阅读NAT《网关服务协议》**，点击**立即开通**

7. 返回NAT网关页面确认新购买NAT网关已显示，状态为运行中

## 配置路由表

1. 打开私有网络控制台 https://cns-console.jdcloud.com/host/vpc/list

2. 在左侧导航栏，点击**路由表**

3. 选择NAT网关所在子网关联的路由表，进入路由表详情页

4. 选择**路由策略**，点击**编辑**，增加一条路由，目的为**0.0.0.0/0**  下一跳类型为**Internet**，确认后点击保存

5. 选择需要使用NAT网关的虚机所在的子网关联的路由表，进入路由表详情页

6. 选择**路由策略**，点击**编辑**，增加一条路由，目的为**0.0.0.0/0**  下一跳类型为**NAT 网关**，确认后点击**保存**

## 验证NAT网关Internet连通性

1. 确认在虚机所在子网内已经创建了一台没有关联公网IP的虚机

2. 打开云主机控制台 https://cns-console.jdcloud.com/host/compute/list

3. 在左侧导航栏，点击**实例**

4. 选择用来测试的云主机，在右侧操作列点击**远程连接**，登录云主机

5. 在命令行运行 "ping www.jd.com", 确认可以ping通
