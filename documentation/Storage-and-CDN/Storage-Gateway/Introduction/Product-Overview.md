# 产品概述

京东云存储网关（JD Cloud Storage Gateway）以京东云对象存储为后端存储，帮助企业或个人实现本地存储与云端存储的无缝衔接。存储网关支持使用 NFS 标准文件存储协议，并通过本地缓存来提供低延迟性能，部署后即可拥有访问速率媲美本地性能的海量云端存储。

存储网关目前正在进行公测，欢迎提交[公测申请](https://www.jdcloud.com/cn/public/testApply/storagegateway)！

## 网关类型

京东云存储网关提供支持NFS、FTP协议的文件网关。文件网关将OSS Bucket的对象结构与NAS文件系统的目录与文件建立映射关系。用户通过标准的的文件存储协议即可读写指定OSS Bucket里的对象。同时，网关还利用本地存储空间做为热数据缓存，使用户在享受OSS Bucket海量空间的同时，保障数据访问的高性能。

## 使用建议

使用对象存储且不希望通过RESTful API来访问时，您可以通过存储网关使用NFS或FTP等文件协议来访问对象存储。

当您需要使用支持NFS文件协议的NAS存储时，建议您使用京东云[云文件服务](https://docs.jdcloud.com/cn/cloud-file-service/product-overview)。
