# OSS API简介

京东云对象存储服务（Object Storage Service，简称OSS），是京东云对外提供的海量，安全，低成本，高可靠的云存储服务。用户可以通过本文档提供的简单的RESTful接口，在任何时间、任何地点、任何互联网设备上进行上传和下载数据。基于OSS，用户可以搭建出各种网站、网盘、个人和企业数据备份等基于大规模数据的服务。

本文档详细介绍了各个接口的请求语法、请求示例、返回示例，以及使用接口时的注意事项等，帮助您快速进行二次开发以及与第三方技术集成。

## 基本概念

***存储空间（Bucket）***

存储空间是您用于存储对象（Object）的容器，所有的对象都必须隶属于某个存储空间。您可以设置和修改存储空间属性用来控制访问权限，这些属性设置直接作用于该存储空间内所有对象，因此您可以通过灵活创建不同的存储空间来完成不同的管理功能。

同一个存储空间的内部是扁平的，没有文件系统的目录等概念，所有的对象都直接隶属于其对应的存储空间。

每个用户可以拥有多个存储空间。

存储空间的名称在OSS范围内必须是全局唯一的，一旦创建之后无法修改名称。

存储空间内部的对象数目没有限制。

存储空间的命名规范如下：

1. 长度必须在3-63字符之间；

2. 仅能由小写字母、数字、中划线(-)组成；

3. 必须以小写字母或者数字开头和结尾，不能包含连续的中划线组合。

***对象/文件（Object）***

对象是 OSS 存储数据的基本单元，也被称为OSS的文件。对象由用户数据（Data）和文件名（Key）组成。对象由存储空间内部唯一的 Key 来标识。对象元信息是一个键值对，表示了对象的一些属性，比如最后修改时间、大小等信息。

根据不同的上传方式，对象的大小限制是不一样的。分片上传最大支持48.8TB的对象大小，但是单个分片（或文件）最大支持5GB。

对象的生命周期是从上传成功到被删除为止。在整个生命周期内，对象信息不可变更。重复上传同名的对象会覆盖之前的对象，因此，OSS不支持修改文件的部分内容等操作。

对象的命名规范如下：

1.使用UTF-8编码；

2.长度必须在1-1022字节之间；

3.暂不支持以\为开头的文件和文件夹。

***注意：对象名称需要区分大小写。如无特殊说明，本文档中的对象、文件称谓等同于 Object。***

***地域（Region）***

Region 表示OSS的数据中心所在的地域，物理位置。用户可以根据费用、请求来源等综合选择数据存储的Region。一般来说，距离用户更近的Region访问速度更快。

Region是在创建Bucket的时候指定的，一旦指定之后就不允许更改，该Bucket下所有的 Object都存储在对应的数据中心，目前不支持Object 级别的 Region设置。

***访问域名-Endpoint***

Endpoint表示OSS对外服务的访问域名。OSS以HTTP RESTful API的形式对外提供服务，当访问不同的Region的时候，需要不同的域名。通过内网和外网访问同一个Region 所需要的Endpoint也是不同的,其中外网指的是互联网；内网指的是京东云云主机访问云存储服务所使用的域名，通过内网访问可以获得更好的性能和更低的网络延时。例如华北Region的外网 Endpoint 是oss.cn-north-1.jcloudcs.com，内网Endpoint是oss-internal.cn-north-1.jcloudcs.com。各个Region对应的Endpoint如下表。

|数据中心|公网Endpoint|内网Endpoint|
|-|-|-|
|华北-北京|oss.cn-north-1.jcloudcs.com|oss-internal.cn-north-1.jcloudcs.com|
|华东-宿迁|oss.cn-east-1.jcloudcs.com|oss-internal.cn-east-1.jcloudcs.com|
|华东-上海|oss.cn-east-2.jcloudcs.com|oss-internal.cn-east-2.jcloudcs.com|
|华南-广州|oss.cn-south-1.jcloudcs.com|oss-internal.cn-south-1.jcloudcs.com|

公网Endpoint支持https协议，为了您的数据更加安全，推荐您使用https协议。

***访问域名- BucketName.Endpoint***

针对OSS的网络请求，除了GetService这个API以外，其他所有请求的域名都是针对具体Bucket的三级域名，由BucketName和Endpoint构成：BucketName.Endpoint。

***访问密钥（AccessKey）***

AccessKey，简称AK，指的是访问身份验证中用到的AccessKey和AccessKeySecret。OSS通过使用AccessKey和AccessKeySecret对称加密的方法来验证某个请求的发送者身份。

AccessKey用于标识用户，AccessKeySecret是用户用于加密签名字符串和OSS用来验证签名字符串的密钥，其中AccessKeySecret必须保密。对于OSS来说，AccessKey的来源有：Bucket 的拥有者申请的 AccessKey。
