# 常见问题

**Q：单用户的云硬盘配额？**

A：单个用户支持创建40块云硬盘，单云主机可最多挂载8块云硬盘。如您需要增加云硬盘配额，请您登录控制台后[提交工单](https://ticket.jdcloud.com/myorder/form?cateId=1&questionId=162)。

**Q：旧款云硬盘容量为多大？**

A：SSD云盘的存储空间选择范围为20GB-1000GB，粒度为10GB；高效云盘的存储空间选择范围为20GB-3000GB，粒度为10GB。

**Q：三款新一代云硬盘容量为多大？**

A：通用型SSD云盘的存储空间选择范围为20GB-4000GB，粒度为10GB；容量型HDD云盘的存储空间选择范围为20GB-4000GB，粒度为10GB；性能型SSD云盘的存储空间选择范围为20GB-4000GB，粒度为10GB。

**Q：云硬盘是否支持加密？**

A：支持。当前华东-上海地域，华东-宿迁地域和华南-广州地域支持云硬盘加密（公测中）


**Q：云硬盘可有多少个备份？**

A：单用户支持创建15个手动备份，单硬盘备份数量受限于现有备份总数。

**Q：云硬盘恢复操作规则？**

A：只有当云硬盘在可用状态下才可以进行恢复操作。详情参考帮助中心[恢复云硬盘](https://docs.jdcloud.com/cn/cloud-disk-service/recover-clouddisk)。

   
**Q：云硬盘删除操作规则？**

A：处于可用状态的云硬盘可以进行删除操作。

**Q：云硬盘如何卸载？**

A：对于Linux云主机，用户需要登录云主机中进行umount操作，之后再在控制台进行卸载云硬盘操作。

对于windows云主机，用户需要登录云主机对相应卷进行脱机，之后再在控制台进行卸载云硬盘操作。

**Q：一块云硬盘可以挂载到多个云实例上吗？**

云硬盘选中多点挂载属性时，支持同时挂载最多16台云实例。

**Q：多点挂载盘适用于哪些业务场景？**

多点挂载云盘，即共享块存储。专为企业级客户的核心业务高可用架构设计，适用于对块存储的共享访问场景，比如政府、企业和金融行业常用的Oracle RAC数据库高可用架构，服务器High-availability cluster高可用架构。


**Q：多点挂载盘是否能用作系统盘？**

不可以。多点挂载盘只能用作数据盘。

**Q：多点挂载盘如何删除？**

由于多点挂载盘同时挂载至多台云实例，因此删除多点挂载盘时请卸载所有的挂载点之后再进行删除。

**Q：多点挂载盘如何扩容？**

多点挂载盘必须是“可用”状态才可以扩容

**Q：如何正确使用多点挂载盘？**

多点挂载盘是将同一块云硬盘挂载给多个云实例使用，每一个实例都可以对该硬盘任意区域的数据进行读取和写入。如果使用常规文件系统管理，会造成磁盘空间分配冲突和数据文件不一致。
正确使用共享块存储的方式是采用集群文件系统进行块设备的统一管理，如GFS, GPFS，Linux RHCS集群等。Oracle RAC业务场景中可采用ASM进行存储卷和文件系统的统一管理。

**Q: 京东云盘的IO性能如何，该如何选取？**

A：京东云硬盘提供通用型SSD云盘，性能型SSD云盘和容量型HDD云盘三种：通用型SSD云盘最大提供15000随机读写IOPS，较高的 I/O 性能，适用于引导卷、小型数据库、大型开发测试、web服务器以及其它需要随机读写的业务场景；性能型SSD云盘最大提供32000随机读写IOPS，更高的 I/O 性能，适用于高负载、核心关键业务的应用场景；容量型HDD云盘最大提供500读写IOPS，适合数据不被经常访问或者低I/O负载的应用场景。

**Q: 如何将云硬盘挂载到云主机上？**

A：**以Centos 操作系统为例，挂载步骤参考下方说明：**

1）在控制台完成挂载后，您在云主机中就可以看到一块未经分区、格式化的磁盘，您可以通过如下命令来查看当前已挂载的磁盘

fdisk -l

![faq_mount_001](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_001.png)


2）您可以通过如下命令完成分区，/dev/vdb请您修改为您需要分区的磁盘

fdisk   /dev/vdb

![faq_mount_002](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_002.png)

输入命令后，依次输入 n, p, 1, 以及 两次回车，然后是 wq，完成保存。 这样再次通过 fdisk -l 查看时，你可以看到新建的分区/dev/vdb1

注：如您创建的硬盘容量大于2T，请不要使用分区，或参考如下步骤使用parted分区：

![faq_mount_003](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_003.png)

![faq_mount_004](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_004.jpg)

3）之后您需要对分区后的硬盘进行格式化，命令如下

mkfs -t ext4 /dev/vdb1

![faq_mount_005](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_005.png)


4）在mnt目录下创建vdb1目录，并将磁盘挂在到该目录下，方便管理

mkdir -p /mnt/vdb1 && mount -t ext4 /dev/vdb1 /mnt/vdb1

5）查看磁盘的UUID

blkid /dev/vdb1

![faq_mount_006](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_006.png)

写入/etc/fstab文件实现云硬盘自动挂载

**请注意，若系统为Centos 7以上，写入fstab时必须使用nofail参数。**

**以Windows Server 2012 R2 标准版操作系统为例，加载步骤参考下方说明：**

以Windows Server 2012 R2 标准版操作系统为例，分区、格式化和创建文件系统步骤参考下方说明：

1）登录Windows主机后，右键点击左下角的“开始”按钮，在弹出的菜单中选择“磁盘管理”，弹出磁盘管理窗口，选择磁盘分区形式后，单击确定按钮；

![faq_mount_007](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_007.jpg)

2）选择未分配的磁盘，右键单击“新建简单卷”；

![faq_mount_008](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_008.jpg)

3）在弹出的“新建简单卷向导”弹窗上点击“下一步”；

![faq_mount_009](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_009.png)

4）指定卷大小；

![faq_mount_010](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_010.jpg)

5）设置磁盘驱动器号；

![faq_mount_011](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_011.jpg)


6）格式化磁盘分区；

![faq_mount_012](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_012.jpg)

7）确认已选配置后，点击“完成”按钮，完成新建卷向导；或点击上一步返回修改已选设置。


![faq_mount_013](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_013.jpg)

8）完成以上设置后，即可在“我的电脑”页面查看新添加的云硬盘；

![faq_mount_014](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/faq_mount_014.png)





