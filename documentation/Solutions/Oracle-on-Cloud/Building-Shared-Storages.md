# 共享存储的搭建
搭建Oracle RAC需要的共享存储可通过京东云硬盘的多点挂载功能来实现。多点挂载云硬盘是支持多个云实例并发读写访问的数据块级存储设备，具备多挂载点、高并发性、高可靠性等特点。单个多点挂载盘最多可同时挂载给16个云实例，多点挂载只适用于数据盘，不支持系统盘。

### 1. 创建云硬盘
首先需要创建支持多点挂载的云硬盘，具体步骤可参见文档[创建云硬盘](https://docs.jdcloud.com/cn/cloud-disk-service/create-cloud-disk)

### 2. 挂载云硬盘
支持多点挂载的云硬盘可挂载到多个云主机上，具体操作步骤可参见文档[挂载云硬盘](https://docs.jdcloud.com/cn/cloud-disk-service/attach-cloud-disk)
