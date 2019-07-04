

# 一般性问题

### 什么是OSS？

京东云对象存储服务（Object Storage Service，简称 OSS），是京东云一种面向 Internet 的存储服务，提供提供的海量、安全、低成本、高可靠的云存储服务。它具有与平台无关的RESTful API接口，能够提供99.999999999%（11个9）的数据可靠性和99.9%的服务可用性。您可以在任何应用、任何时间、任何地点存储和访问任意类型的数据。数据多地域跨集群的存储，以实现资源统一利用，降低使用难度，提高工作效率。

### OSS可以用来做什么？

OSS提供简单的 Web 服务接口，可用于存储和提取任意数量的数据。开发人员可以轻松地构建利用互联网存储的应用程序。同时OSS具有很高的可扩展性，用户只需按实际用量付费。开发人员可以为了解决存储空间扩展受限或是为了数据安全而将海量数据上云备份，也可以从较小用量起步，根据需要扩展应用程序，而不影响性能或可靠性。如灾备系统、内容存储分享、数据分析存储、网盘等应用。

### 如何开始使用OSS？

使用OSS，需要先注册京东云账号。如果还没有京东云账号，请进入[京东云注册页面](https://accounts.jdcloud.com/p/regPage?source=jdcloud&ReturnUrl=https%3a%2f%2fuc.jdcloud.com%2fpassport%2fcomplete%3freturnUrl%3dhttps%3a%2f%2fwww.jdcloud.com)  按提示进行注册。注册完成后，可参考[OSS入门指南-开通OSS服务](https://docs.jdcloud.com/cn/object-storage-service/sign-up-service-1)。

### OSS提供哪些存储类别?

OSS目前支持标准存储与低冗余存储。

| 产品对比 | 标准存储（Standard）| 低冗余存储（Reduced Redundancy Storage）|
| :------------- |:-------------:| -----:|
| 产品介绍 | 高可靠、高可用、高性能对象存储服务 | 高可靠、较低存储费用的对象存储服务|
| 特点及应用场景|适合数据频繁读取，对数据高可用性，高可靠较低冗余有更高的要求。场景：移动应用、网站视频、数据分析|低冗余存储使客户能够以低于OSS 标准存储<br>的冗余级别来存储非关键性的可再生数据。它提供一种可用性高的解决方案，场景：适用于分发或共享在其他位置持久存储的内容，<br>或用于存储缩略图、转码媒体或其他可轻松复制的经过处理的数据 |
| 存储价格 | 0.00427元/GB/天（0.128元/GB/月）  |0.00233元/GB/天（0.07元/GB/月） |

注：两种存储类型定价具体请参考[OSS价格总览](https://docs.jdcloud.com/cn/object-storage-service/price-overview)。

### 如何使用低冗余存储类型?

京东云支持通过兼容AWS S3 的 API、各语言SDK 方式使用低冗余存储。

通过京东云OSS兼容AWS S3 的 API、各语言SDK 使用低冗余存储，即在上传Object 时请求增加x-amz-storage-class属性，并设置其值为REDUCED_REDUNDANCY。具体参考[PUTObject](https://github.com/jdcloud-cmw/oss/blob/master/S3-API-Document/Operations-on-Objects/Put-Object.md)。
