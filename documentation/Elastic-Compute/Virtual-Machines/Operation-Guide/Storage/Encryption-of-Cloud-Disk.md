# 云硬盘加密（公测中）

云硬盘加密指对存储在云硬盘上的数据进行加密，从而保障云硬盘中静态数据的安全性和数据在云主机实例和云硬盘间传输的安全性。
加密所使用的密钥由京东云维护和管理，用户无法获取密钥信息，暂时不支持使用您的自定义密钥对云硬盘进行加密。

## 创建加密云硬盘

您可以通过以下几种方式创建一个有加密属性的云硬盘

* 实例创建时，选择二代及以上实例规格（一代实例规格主机不支持挂载加密云硬盘），并在创建空数据盘时勾选加密选项，详细请参考[创建实例](../Instance/Create-Instance.md)；
* 单独[创建云硬盘](http://docs.jdcloud.com/cn/cloud-disk-service/create-cloud-disk)时，勾选加密选项；
* [使用快照创建云硬盘](http://docs.jdcloud.com/cn/cloud-disk-service/create-disk-by-snapshot)时，如果所选快照为加密状态，则创建的云硬盘必定为加密状态。

		请注意：
		* 使用快照创建云硬盘或使用云硬盘创建快照时，加密属性自动继承且不可更改；
        * 已有云硬盘和快照的加密属性不可更改；
        * 一代实例规格的实例不支持挂载加密云硬盘；
        * 挂载加密云硬盘的实例，调整配置时不支持调整为一代实例规格；
        * 包含加密快照的私有镜像暂不支持共享和跨区域复制。



## 相关参考

[创建实例](../Instance/Create-Instance.md)

[创建云硬盘](http://docs.jdcloud.com/cn/cloud-disk-service/create-cloud-disk)

[使用快照创建云硬盘](http://docs.jdcloud.com/cn/cloud-disk-service/create-disk-by-snapshot)