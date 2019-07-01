# 运维指南

1.存储网关已经正常运行，如需修改秘钥或Bucket等配置信息，该如何操作？

存储网关配置文件路径为`/etc/gateway/gw.conf`，相关配置项为accessKeyID、accessKeySecret、endpoint、bucket。也可以通过执行`gw install`来重新配置。执行`gw restart`重启NFS服务后，新配置项才会生效。

2.存储网关重启后，使用NFS Client访问文件时，报错`Stale file handle`时该如何处理？

当Client端mount上了存储网关的共享文件系统后，如果存储网关重启了NFS服务，那么Client端就会出现`Stale file handle`这个错误。如果遇到这个情况，需要先执行umount后，再次执行mount操作，即可以正常访问共享文件。由于NFS V4是有状态的，当NFS Server重启后，之前Client PUT的ROOTFD失效，导致报错`Stale file handle`。

3.NFS Client在执行umount时，当提示`device is busy`时，该如何操作？

当提示`device is busy`时，说明该挂载点被进程占用。可以执行`umount -l /mountpoint`，系统将会在目录空闲后umount。如需立刻umount，可以执行`fuser -m -v -k -i /mountpoint`kill掉占用进程，每次kill进程都需要确认，防止误kill进程。

4.存储网关停止NFS服务后，会导致使用Hard模式的相关NFS Client的操作hang住，且无法强制umount，此场景该如何操作？

当使用Hard模式Mount时，当Client调用NFS服务不成功时，会一直重试，且无法中断调用。当遇到此情况时，建议启动原有NFS服务，然后执行umount。若不再使用NFS Server，仍需强制umount，请执行`fuser -m -v -k -i /mountpoint`kill掉相关NFS进程。如无法Kill占用NFS进程，请重启NFS Client。

5.NFS Server关闭后导致的Client调用hang住，且无法中断，该如何避免此问题？

Client在执行mount时，默认是Hard模式，即当客户端加载NFS不成功时，会一直重试，直到NFS服务器有响应。如需避免此情况，建议在mount时，指定intr参数，即RPC的呼叫是可以中断的。或指定Soft模式挂载，并设置retry（重试次数）、timeo（超时时间），当重试指定次数后，NFS Client便会抛出`IO Error`，而不是一直重试。

6.存储网关使用云硬盘作为缓存空间，当缓存写满时，S3fs会自动清理缓存，缓存在自动清理过程中，会导致写入速度变慢；如果需要手动清理该如何操作？

存储网关的缓存目录为/cache，其下缓存有您近期访问的数据，该缓存可手动清理。您也可以执行定时脚本任务来清理缓存。

7.如需查看存储网关NFS服务日志，该如何操作？

NFS-Ganesha日志存储路径为`/var/log/ganesha.log`，默认日志输出级别为INFO，如需修改日志级别，请编辑`/etc/ganesha/ganesha.conf`配置文件。

8.存储网关单机部署提供NFS服务，不提供高可用，若存储网关因异常情况导致宕机，请重启机器并启动NFS服务。

9.当前CentOS 7.1/7.2系统不支持挂载存储网关使用，如需使用，请参考以下操作手动升级系统内核：

下载kernel-3.10.0-514.26.2.el7.x86_64内核：

```
wget https://buildlogs.centos.org/c7.1611.u/kernel/20170704132018/3.10.0-514.26.2.el7.x86_64/kernel-3.10.0-514.26.2.el7.x86_64.rpm
```

安装：

```
yum install kernel-3.10.0-514.26.2.el7.x86_64.rpm
```

设置新安装的内核为系统默认启动项：

```
grub2-set-default 0
```

设置完成后重启系统：

```
reboot
```

重启完成后，输入如下命名查看当前系统内核是否为最近安装的版本：

```
uname -r
```
10.存储网关1_0_4镜像相对于早期版本，修复了以下两个漏洞：
- [Intel处理器Meltdown和Spectre安全漏洞](https://docs.jdcloud.com/cn/security-instruction/intel-meltdown-spectre-solution)
- [NTP服务和Monlist漏洞](https://docs.jdcloud.com/cn/security-instruction/ntp-monlist-vulnerability)

若您使用的早期版本的镜像（如：存储网关1_0_0），请尽快升级至存储网关1_0_4版本。

若因业务原因不便升级，请参考以上漏洞解决方案在原系统上进行修复即可。
