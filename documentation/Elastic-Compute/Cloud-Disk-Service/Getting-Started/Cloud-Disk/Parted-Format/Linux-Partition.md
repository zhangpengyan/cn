# Linux分区、格式化和创建文件系统

<br>


## 手动完成数据盘的分区、格式化及挂载

如您需要手动进行分区、格式化并创建文件系统，我们以Centos操作系统为例，说明如下：

1.在控制台完成挂载后，您在云主机中就可以看到一块未经分区、格式化的磁盘，您可以通过如下命令来查看磁盘分区信息：

```
fdisk -l
```

![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/cloud-disk/parted-format/parted_001.png)

2.您可以通过如下命令完成分区，/dev/vdb请您修改为需要分区的设备名

```
fdisk /dev/vdb

```

输入命令后，依次输入 n, p, 1, 以及 两次回车，然后是 wq，完成保存。 这样再次通过 fdisk -l 查看时，你可以看到新建的分区/dev/vdb1


![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/cloud-disk/parted-format/parted_002.png)

注：如您创建的硬盘容量大于2T，请不要使用分区或参考如下步骤使用parted分区：

1）创建分区表，选择GPT格式：

![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/cloud-disk/parted-format/parted_003.png)

2）创建分区

![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/cloud-disk/parted-format/parted_004.jpg)

3）再次运行fdisk -l命令，确认分区

![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/cloud-disk/parted-format/parted_005.jpg)

3.之后您需要对分区后的硬盘进行格式化，命令如下

```
mkfs -t ext4 /dev/vdb1
```
警告：此命令会格式化并删除vdb1设备盘。如果该磁盘已有数据，请勿使用此命令。


![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/cloud-disk/parted-format/parted_006.png)


备注：本示例创建了ext4格式的文件系统，您也可以选择创建其他文件系统。为了从文件系统层面保证数据的完整性和可用性，不建议使用ext2等不提供jounral机制的格式。

4.在mnt目录下创建vdb1目录，并将磁盘挂载到该目录下，方便管理


```
mkdir -p /mnt/vdb1 && mount -t ext4 /dev/vdb1 /mnt/vdb1
```

5.查看磁盘的UUID

```
blkid /dev/vdb1
```
6.使用查到的UUID和挂载目标位置替换下列代码并执行，即写入/etc/fstab文件实现云硬盘在云主机下次启动时自动挂载

```
echo "UUID="以第五步查到的UUID替换此处"             /mnt/vdb1                 ext4    defaults,nofail        0 0" >> /etc/fstab
```
![](https://github.com/jdcloudcom/cn/blob/edit/image/Elastic-Compute/CloudDisk/cloud-disk/parted-format/parted_007.png)


**请注意，若系统为Centos 7以上，写入fstab时必须使用nofail参数，否则若对当前云主机制作私有镜像，基于该私有镜像创建的新云主机将无法正常启动。**

