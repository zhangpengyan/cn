# test限制说明

京东云存储网关的使用限制说明如下：

### 部署与配置相关限制

- 仅支持云主机部署，暂不提供本地IDC部署镜像；
- 一个存储网关仅支持启动一个共享文件系统；
- 一个共享文件系统仅支持连接一个Bucket作为其后端云存储；
- 使用存储网关前需确保开通云主机及对象存储服务。

### NFS协议相关限制

- 存储网关目前不支持随机写、文件锁、软链接、硬链接。
- NFS来访客户端需使用Root用户挂载使用，暂不支持其他用户访问。

### 相关参考
- [产品概述](../Introduction/Product-Overview.md)
- [核心概念](../Introduction/Core-Concepts.md)
- [部署存储网关](../Operation-Guide/Installation-Configuration.md)
- [使用存储网关](../Operation-Guide/Use-Storage-Gateway.md)
