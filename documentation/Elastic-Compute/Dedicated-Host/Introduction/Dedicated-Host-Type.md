# 专有宿主机规格

专有宿主机规格标识其对应的计算、内存、存储、网络能力以及支持调度在该宿主机上的云主机实例类型。

创建专有资源池时需指定其创建的，专有资源池

以下为当前京东云在售的专有宿主机规格信息，不同地域可售卖规格不完全相同，请以实例创建页面所显示为准。具体在售实例规格类型根据不同应用场景可以分为：

* [通用型](instance-type-family#user-content-1)、
* [内存型](instance-type-family#user-content-2)
* [高频计算型](instance-type-family#user-content-3)
* GPUp40h型：[p40型](instance-type-family#user-content-4)、[p40h型](instance-type-family#user-content-5)、[v100型](instance-type-family#user-content-6)

## 通用型
<div id="user-content-1"></div>

**配置详情:**

* vCPU数：72C
* 内存：288GB
* 处理器：2.4 GHz主频的Intel Xeon Gold 6148 （Skylake）

**支持的云主机实例规格**

实例规格|vCPU（核）|内存（GB）|网卡多队列
:---|:---|:---|:---
|g.n2.medium|1|4|1
|g.n2.large|2|8|2
|g.n2.xlarge|4|16|4
|g.n2.2xlarge|8|32|4
|g.n2.4xlarge|16|64|4
|g.n2.8xlarge|32|128|4
|g.n2.16xlarge|64|256|4
|g.n2.18xlarge|72|288|4
|c.n2.large|2|4|2
|c.n2.xlarge|4|8|4
|c.n2.2xlarge|8|16|4
|c.n2.4xlarge|16|32|4
|c.n2.8xlarge|32|64|4
|c.n2.16xlarge|64|128|4
|c.n2.18xlarge	|72|144|4
|m.n2.large|2|16|2
|m.n2.xlarge|4|32|4
|m.n2.2xlarge|8|64|4
|m.n2.4xlarge|16|128|4
|m.n2.8xlarge|32|256|4


## 内存型
<div id="user-content-2"></div>

**配置详情:**

* vCPU数：72C
* 内存：576GB
* 处理器：2.4 GHz主频的Intel Xeon Gold 6148 （Skylake）

**支持的云主机实例规格**

实例规格|vCPU（核）|内存（GB）|网卡多队列
:---|:---|:---|:---
|g.n2.medium|1|4|1
|g.n2.large|2|8|2
|g.n2.xlarge|4|16|4
|g.n2.2xlarge|8|32|4
|g.n2.4xlarge|16|64|4
|g.n2.8xlarge|32|128|4
|g.n2.16xlarge|64|256|4
|g.n2.18xlarge|72|288|4
|c.n2.large|2|4|2
|c.n2.xlarge|4|8|4
|c.n2.2xlarge|8|16|4
|c.n2.4xlarge|16|32|4
|c.n2.8xlarge|32|64|4
|c.n2.16xlarge|64|128|4
|c.n2.18xlarge|72|144|4
|m.n2.large|2|16|2
|m.n2.xlarge|4|32|4
|m.n2.2xlarge|8|64|4
|m.n2.4xlarge|16|128|4
|m.n2.8xlarge|32|256|4
|m.n2.16xlarge|64|512|4
|m.n2.18xlarge|72|576|4

## 高频计算型
<div id="user-content-3"></div>

**配置详情：**

* vCPU数：72C
* 内存：576GB
* 处理器：3.2 GHz主频的Intel Xeon Gold 6146（Skylake）

**支持的云主机实例规格**

实例规格|vCPU（核）|内存（GB）|网卡多队列
:---|:---|:---|:---
|h.g2.large|2|8|2
|h.g2.xlarge|4|16|4
|h.g2.2xlarge|8|32|4
|h.g2.4xlarge|16|64|4
|h.g2.8xlarge|32|128|4

## GPU型

GPU型当前提供三类：P40型、P40h型及V100型。
<div id="user-content-4"></div>
### P40型

**配置详情：**

* vCPU数：56C
* 内存：220GB
* 处理器：2.1 GHz主频的Intel Xeon E5-2683 v4（Broadwell）
* GPU：Nvidia Tesla P40
* 本地存储：4 x 960GB SSD，请注意 **关机时本地数据盘数据将被清空**

**支持的云主机实例规格**

实例规格|vCPU（核）|内存（GB）|GPU|本地数据盘（临时存储）|网卡多队列
:---|:---|:---|:---|:---|:---|
|p.n1p40.3xlarge|12|48|1 x Nvidia Tesla P40|1 x 960GB SSD|4
|p.n1p40.7xlarge|28|110|2 x Nvidia Tesla P40|2 x 960GB SSD|4
|p.n1p40.14xlarge|56|220|4 x Nvidia Tesla P40|4 x 960GB SSD|4

### P40h型
<div id="user-content-5"></div>
**配置详情：**

* vCPU数：56C
* 内存：220GB
* 处理器：2.1 GHz主频的Intel Xeon E5-2683 v4（Broadwell）
* GPU：Nvidia Tesla P40
* 本地存储：4 x 1200GB HDD，请注意 **关机时本地数据盘数据将被清空**

**支持的云主机实例规格**

实例规格|vCPU（核）|内存（GB）|GPU|本地数据盘（临时存储）|网卡多队列
:---|:---|:---|:---|:---|:---|
|p.n1p40h.3xlarge|12|48|1 x Nvidia Tesla P40|1 x 1200GB HDD|4
|p.n1p40h.7xlarge|28|110|2 x Nvidia Tesla P40|2 x 1200GB HDD|4
|p.n1p40h.14xlarge|56|220|4 x Nvidia Tesla P40|4 x 1200GB HDD|4


### V100型
<div id="user-content-6"></div>
**配置详情：**

* vCPU数：40C
* 内存：220GB
* 处理器：2.1 GHz主频的Intel Xeon E5-2650 v4（Broadwell）
* GPU：Nvidia Tesla V100
* 本地存储：4 x 1200GB HDD，请注意 **关机时本地数据盘数据将被清空**

**支持的云主机实例规格**

实例规格|vCPU（核）|内存（GB）|GPU|本地数据盘（临时存储）|网卡多队列
:---|:---|:---|:---|:---|:---|
|p.n1v100.2xlarge|8|44|1 x Nvidia Tesla V100|1 x 6000GB HDD|4
|p.n1v100.5xlarge|20|110|2 x Nvidia Tesla V100|2 x 6000GB HDD|4
|p.n1v100.10xlarge|40|220|4 x Nvidia Tesla V100|4 x 6000GB HDD|4



