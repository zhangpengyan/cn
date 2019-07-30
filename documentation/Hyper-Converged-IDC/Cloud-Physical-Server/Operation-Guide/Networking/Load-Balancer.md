# 负载均衡

## 产品概述

负载均衡可将大并发流量分发到多台后端实例（专指于云物理服务器），调整资源利用情况，消除由于单台设备故障对系统的影响，提高系统的可用性、扩展服务能力，目前提供基于4层（TCP、UDP）的流量监听、转发服务。负载均衡又称“物理云负载均衡”。

## 使用限制

您在使用负载均衡时请注意以下使用限制。

1、目前每个京东云账户支持每个地域（region）最多申请10个负载均衡，如需更多配额请提交工单申请。<br/>

2、负载均衡支持与弹性公网IP进行1:1绑定。<br/>

3、一个负载均衡实例可以添加多个监听器，上限为50个。<br/>

4、一个负载均衡可以添加多个虚拟服务器组，上限为20个。<br/>

5、一个虚拟服务器组组内可以添加100个实例。<br/>

6、目前包年包月的资源不允许删除。<br/>

## 计费概述

负载均衡支持包年包月的计费方式。

**欠费/到期说明**

当您的包年包月付费网络资源到期时间早于或等于当前时间，则您的付费网络资源状态会变为过期。到期后付费网络资源将被停止服务，不能继续使用；

您的包年包月付费网络资源到期前，京东云会向您发送邮件、短信，提醒您的资源即将到期，请您注意查看并及时续费；

您的付费网络资源到期后，会向您发送邮件和短信通知您的资源已到期，请您务必注意查看通知并及时充值，以免造成不必要的损失；

从停止服务时刻起，您的付费网络资源和资源中的数据保留7天，7天后系统回收资源，数据无法找回；

您续费后被停用资源可正常使用。

## 计费规则

目前使用负载均衡产品不收费，如绑定了弹性公网IP资源，需要单独支付弹性公网IP 费用，详见弹性公网IP[价格总览](../../Pricing/Price-Overview.md)。

## 价格总览

**包年包月**

目前使用包年包月负载均衡，所有region 均免费。

## 续费流程

**续费规则**

包年包月计费实例续费：延长包年包月负载均衡的使用时长。续费时间段为1个月~9个月、1年、2年、3年。如您在实例到期前操作续费，则新订单的开始时间为原订单的到期时间；如您在资源到期后续费，则新订单的开始时间为续费当天。

关联续费：在为实例续费时，会显示该实例绑定的弹性公网IP，用户按需选择需一同续费的关联资源进行续费。

## 操作指南

负载均衡主要由以下部分组成：负载均衡实例、监听器、虚拟服务器组。目前，支持四层负载均衡。

**创建负载均衡实例**

打开控制台，在左侧导航栏依次点击云物理服务器->负载均衡，进入负载均衡列表页，点击 **创建** ，如下图：<br/>

根据需求选择 **地域** ，**网络部分**--网络类型（支持公网类型），IP版本（目前支持IPv4），私网网络，绑定的服务器类型（支持云物理服务器），**基本信息**--输入实例名称，描述，**带宽**--勾选弹性公网IP，选择带宽计费模式，线路类型，带宽上限，也支持暂不购买（待实例创建完成后在绑定IP），**购买量**--选择购买时长，点击 **确定** ，即可创建1个负载均衡。
![创建LB](https://github.com/jdcloudcom/cn/blob/cn-cloud-physical-server-latest/image/Hyper-Converged-IDC/Cloud-Physical-Server/CPS-VPC-033.png)

**负载均衡实例管理**

1.**添加监听**，点击“添加监听”跳转到监听器页面<br/>
2.**开启/关闭**，可启动、停止负载均衡（若未负载均衡未绑定EIP，“开启”按钮置灰不可点击）<br/>
3.**绑定/解绑弹性公网IP**，若负载均衡提供外网服务，需要绑定弹性公网IP；若不需要也可解绑弹性公网IP<br/>
4.**续费**，支持负载均衡单独续费，也支持负载均衡和EIP关联续费<br/>
5.点击“**ID/实例名称**”,跳转到实例详情页，如下图<br/>
![LB详情页](https://github.com/jdcloudcom/cn/blob/cn-cloud-physical-server-latest/image/Hyper-Converged-IDC/Cloud-Physical-Server/CPS-VPC-033.png)

**监听器管理**

![创建监听器](https://github.com/jdcloudcom/cn/blob/cn-cloud-physical-server-latest/image/Hyper-Converged-IDC/Cloud-Physical-Server/CPS-VPC-033.png)

![监听器列表](https://github.com/jdcloudcom/cn/blob/cn-cloud-physical-server-latest/image/Hyper-Converged-IDC/Cloud-Physical-Server/CPS-VPC-033.png)

![监听器详情页](https://github.com/jdcloudcom/cn/blob/cn-cloud-physical-server-latest/image/Hyper-Converged-IDC/Cloud-Physical-Server/CPS-VPC-033.png)


**虚拟服务器组管理**

![创建监听器](https://github.com/jdcloudcom/cn/blob/cn-cloud-physical-server-latest/image/Hyper-Converged-IDC/Cloud-Physical-Server/CPS-VPC-033.png)

![监听器详情页](https://github.com/jdcloudcom/cn/blob/cn-cloud-physical-server-latest/image/Hyper-Converged-IDC/Cloud-Physical-Server/CPS-VPC-033.png)

















