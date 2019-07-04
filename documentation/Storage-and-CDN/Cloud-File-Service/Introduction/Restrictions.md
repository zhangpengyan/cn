# 使用约束

## 支持的操作系统

云文件存储目前支持NFS v4.1和NFS v4.0协议，适用于linux云主机，兼容的京东云官方镜像版本包括：

- CentOS 6.9 64位及以上版本，其中：CentOS 7.3及以上版本支持NFSv4.1协议，CentOS 6.9 至CentOS 7.2版本支持NFSv4.0协议。
- Ubuntu 14.04 64位 和 Ubuntu 16.04 64位



## 资源限制

| **资源**                 | **限制**                 |
| ------------------------ | ------------------------ |
| 文件存储数               | 华南-广州 及 华北-北京 -  不超过5个 |
| 每个文件存储的挂载目标数 | 不超过1个                |
| 每个文件存储的VPC数      | 不超过1个                |
| 每个文件存储最大容量     | 公测期间不超过1T          |



## 单个文件大小限制

产品公测期间，支持单个文件大小最大为140G。产品正式发布后，支持最大8T的单个文件。



## 对NFS协议的支持

- 文件存储支持NFS v4.1和NFS v4.0版本协议，暂不支持NFS v2和NFS v3。


- NFSv4.1 和 NFSv4.0版本协议的以下功能暂不支持：


  - pNFS

  - 任何类型的客户端委派或回调

  - OPEN 操作始终返回 OPEN_DELEGATE_NONE作为委派类型。

  - OPEN 为 CLAIM_DELEGATE_CUR和 CLAIM_DELEGATE_PREV声明类型返回 NFSERR_NOTSUPP。

  - 强制锁定
    京东云文件存储中的所有锁定都是建议性锁定，这意味着 READ 和 WRITE 操作在执行之前不会检查是否存在冲突锁定。

  - 拒绝共享
    NFS 支持共享拒绝的概念，它主要由用户的 Windows 客户端用来拒绝其他人访问已打开的特定文件。京东云文件存储不支持该操作，并对指定除 OPEN4_SHARE_DENY_NONE之外的共享拒绝值的任何 OPEN 命令返回 NFS 错误NFSERR_NOTSUPP。Linux NFS 客户端不使用 OPEN4_SHARE_DENY_NONE之外的其他内容。

  - 访问控制列表 (ACL)

  - 京东云文件存储不更新文件读取的 time_access属性。京东云文件存储更新以下事件中的 time_access：
    1)创建文件 (将创建 inode)。
    2)在 NFS 客户端显式调用 setattr 时。
    3)由于文件大小更改或文件元数据更改等原因导致向 inode 写入内容。
    4)更新任何 inode 属性。

  - 命名空间。

  - 持久性回复缓存。

  - 基于 Kerberos 的安全性。

  - NFSv4.1 数据保留。

  - 目录上的 SetUID。

  - 使用 CREATE 操作时不支持的文件类型：块储存设备 (NF4BLK)、字符设备 (NF4CHR)、属性目录 (NF4ATTRDIR) 和命名属性 (NF4NAMEDATTR)。

  - 不支持的属性：FATTR4_ARCHIVE、FATTR4_FILES_AVAIL、FATTR4_FILES_FREE、FATTR4_FS_LOCATIONS、FATTR4_MIMETYPE、FATTR4_QUOTA_AVAIL_HARD、FATTR4_QUOTA_AVAIL_SOFT、FATTR4_QUOTA_USED、FATTR4_TIME_BACKUP 和 FATTR4_ACL，如果尝试设置这些属性，将导致向客户端发回 NFS4RR_ATTRNOTSUPP错误。
