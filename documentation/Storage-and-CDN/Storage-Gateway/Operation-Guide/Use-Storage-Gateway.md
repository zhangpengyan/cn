# 使用存储网关

部署存储网关并启动完成后，可使用Linux实例作为NFS客户端访问存储网关，存储网关与各来访NFS客户端需部署在同一VPC下。

首先需要将本地的一个文件目录挂载到存储网关的NFS文件系统上，挂载成功后会在本地的目录和存储网关上的NFS文件系统间建立映射，您可以通过操作本地的目录实现对存储网关上NFS文件系统的操作，对于NFS文件系统的数据读写会首先缓存在存储网关本地，并异步地将数据传输到对象存储上。

**1.安装依赖**

挂载前，请确保系统中已经安装了 nfs-utils 或 nfs-common，安装方法如下：

```
CentOS: sudo yum install nfs-utils
Ubuntu 或 Debian: sudo apt-get install nfs-common
```

**2.NFS 挂载**

您可以使用以下命令执行挂载：

```
mount -t nfs <IP>:/gw <local-directory> 
```

说明：

- IP：存储网关的内网IP
- local-directory：本地待挂载目录，不能指定不存在的文件目录

执行挂载命令后，使用`df -h`查看是否挂载成功。

![mount](../../../../image/Storage-Gateway/storagegateway11-6.png)

**3.访问NFS文件系统**

挂载成功后，您可以对做过映射的本地目录进行文件读写操作，该操作会同步在存储网关上的NFS文件系统执行。NFS文件系统会与指定的Bucket进行数据传输，您对本地目录的操作最终会落到对象存储的Bucket中。

**4.NFS 卸载**

您可以使用以下命令执行卸载，<local-directory>为本地已挂载目录。

```
umount <local-directory>
```

**5.使用限制**

存储网关当前不支持文件锁、软链接、硬链接等操作，NFS客户端需使用root用户执行访问操作，暂不支持其他用户访问。

注：NFS Client若为CentOS 7.1/CentOS 7.2系统，需手动升级系统内核，相关说明请参考[运维指南](../Operation-Guide/Operation-Maintenance.md)。
