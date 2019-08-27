# 数据迁移工具 Osstransfer --（公测）

## 功能说明

Osstransfer工具可以将本地、其它对象存储的数据迁移到OSS，它具有以下特点：


-   支持丰富的数据源：
    * 本地数据：将本地存储的数据迁移到 OSS；
    * 其他对象存储:目前支持 AWS S3，阿里云 OSS，腾讯云COS,百度BOS，华为 OBS存储迁移至京东云OSS，后续会不断扩展;
    * URL 列表：根据指定的 URL 下载列表进行下载迁移到 京东云OSS;
    * Bucket 相互复制：京东云OSS的 Bucket 数据相互复制, 支持跨账号跨地域及同区域的数据复制。
-   支持断点续传；
-   支持流量控制；
-   支持迁移特定前缀的文件；
-   支持并行数据下载、上传；
-   迁移校验：对象迁移后的校验。

## 使用环境

### 系统环境

-   linux环境

### 软件依赖

-   jdk1.8 

## 使用方法

### 1.获取工具

下载链接：[OssMigration](https://downloads.oss.cn-north-1.jcloudcs.com/transfer-tools-java-1.0.0.jar)

### 2.获取配置文件

在相同目录下创建或者下载配置文件application.yml
下载链接：[示例yml文件](https://downloads.oss.cn-north-1.jcloudcs.com/application.yml)

### 3.修改application.yml 配置文件

在执行迁移启动脚本之前，您先需根据自身需求进行 application.yml 配置文件修改。

#### 3.1 Osstransfer配置文件字段说明，如下表：

|名称|说明|默认值|
|:-|:-|:-|
|jobType|job的类型，分别为listObject，transfer。|listObject|
|sourceType| 数据来源的类型，分别为urlfile,diskfile，s3file（AWS S3、腾讯云COS、百度BOS、华为 OBS、京东云 OSS）aliyunfile,disklistfile（本地文件列表）。 |s3file|
|urlType|当sourceType为urlfile时，如果文件列表并非迁移工具生成且只有url信息，则需要配置urlType为onlyUrl。| 无|
|filePath|被读取文件的地址。当sourceType 为 urlfile ，diskfile时，filePath 为必填项。|无|
|urlFilePrefix|当文件列表为url时，我们则获取用户的key值为url地址的一部分，则需要用户配置切割url的数量。|无，如配置，建议最少设置为7，即http://的长度|
|ContentDispositionTooLongContinue|当链接的Content-Disposition超过京东云OSS限制所限制的100，如不获取该header值继续传则配置为true；否则将该url打印在错误日志里，由用户对该url的header值自行修改。|false|
|task.limit.threadCount|任务限制的同时读取的文件数。|20|
|task.limit.qps|任务限制的qps数，因为put占用带宽较低。总带宽为 partsize * qps。|50|
|transfer.coverFile|迁移是否覆盖文件,默认覆盖。|true|
|transfer.put.maxsize|迁移put和multipartupload的分界值，单位为Byte，默认为33554432，如修改，建议为4M的倍数。|33554432|
|transfer.multipart.partsize|如果使用分块复制，每块分片的大小，单位为Byte，缺省为32M。|33554432|
|transfer.multipart.threads|分片复制时最大并发的数量, 缺省为5。|5|
|src.access.id|用户的密钥 accessKeyId。|无|
|src.secret.key|用户的密钥 accessKeySecret。|无|
|src.endpoint|源endpoint，<br>阿里云：https://help.aliyun.com/document_detail/31837.html?spm=a2c4g.11186623.6.572.6a537f5ewpHZJZ<br>腾讯云：https://cloud.tencent.com/document/product/436/6224<br>百度云：https://cloud.baidu.com/doc/BOS/S3.html#.E6.9C.8D.E5.8A.A1.E5.9F.9F.E5.90.8D<br>华为云：https://support.huaweicloud.com/api-obs/zh-cn_topic_0136050628.html<br> |无|
|src.bucket|源bucket名称。|无|
|src.prefix |如果只迁移其中一部分文件，需要配置prefix。prefix 为0开头的数字时，请使用单引号或双引号|无|
|des.access.id|京东云的accessKeyId。|无|
|des.secret.key|京东云的密钥 accessKeySecret。|无|
|des.endpoint|京东云OSS的服务域名，请参考[服务器域名](https://docs.jdcloud.com/cn/object-storage-service/regions-and-endpoints)。|无|
|des.bucket |目标的bucket。|无|
|des.prefix  |如果将迁移的文件只迁移到某一目录下，则配置des.prefix。prefix 为0开头的数字时，请使用单引号或双引号|无|

#### 3.2 application.yml 示例

3.3.1 获取文件列表 （jobType: listObject）

3.3.1.1 listS3 ，获取AWS S3、腾讯云COS、百度BOS、华为 OBS、京东云 OSS 

```
jobType: listObject
sourceType: s3file
src.access.id : XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
src.secret.key: YYYYYYYYYYYYYYYYYYYYYYYYYYYYY
src.endpoint : https://s3.cn-north-1.jdcloud-oss.com
src.bucket : yourbucket
src.prefix :
```
3.3.1.2 listAliyun，获取阿里云OSS
```
jobType: listObject
sourceType: aliyunfile
src.access.id : AAAAAAAAAAAAAAAAAAAAAAAAA
src.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBB
src.endpoint : https://oss-cn-beijing.aliyuncs.com
src.bucket : yourbucket
src.prefix :
```
3.3.1.3 listdiskfile ，获取本地文件系统
```
jobType: listObject
sourceType: diskfile
filePath: /yourpath

```
3.3.2 配置迁移任务 (jobType:transfer)

3.3.2.1 从AWS S3、腾讯云COS、百度BOS、华为 OBS迁移到京东云OSS

```
jobType: transfer
sourceType: s3file

src.access.id : XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
src.secret.key: YYYYYYYYYYYYYYYYYYYYYYYYYYYYY
src.endpoint : https://s3.cn-north-1.jdcloud-oss.com
src.bucket : yourbucket
src.prefix :

des.access.id : AAAAAAAAAAAAAAAAAAAAAAAAAAAA
des.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBBBBB
des.endpoint : https://s3.cn-north-1.jdcloud-oss.com
des.bucket : yourbucket
des.prefix:

#非必填项

task.limit.threadCount: 20
task.limit.qps: 50

transfer.coverFile: true
transfer.put.maxsize: 33554432
transfer.multipart.partsize: 33554432
transfer.multipart.threads: 5

```
3.3.2.2  从阿里云OSS迁移到京东云OSS

```
jobType: transfer
sourceType: aliyunfile

src.access.id : XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
src.secret.key: YYYYYYYYYYYYYYYYYYYYYYYYYYYYY
src.endpoint : https://oss-cn-beijing.aliyuncs.com
src.bucket : yourbucket
src.prefix :

des.access.id : AAAAAAAAAAAAAAAAAAAAAAAAAAA
des.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBBBB
des.endpoint : https://s3.cn-north-1.jdcloud-oss.com
des.bucket : yourbucket
des.prefix:

#非必填项

task.limit.threadCount: 20
task.limit.qps: 50

transfer.coverFile: true
transfer.put.maxsize: 33554432
transfer.multipart.partsize: 33554432
transfer.multipart.threads: 5

```

3.3.2.3  从本地迁移到京东云OSS

```

jobType: transfer
sourceType: diskfile

filePath: /yourpath

 

des.access.id : AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
des.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
des.endpoint :https://s3.cn-north-1.jdcloud-oss.com
des.bucket : yourbucket
des.prefix:

urlFilePrefix: 1

 #urlFilePrefix设置为1，因为文件系统key如果以“/”开始，则京东云OSS不支持
```
3.3.2.4  配置URL 列表数据源迁移到京东云OSS

```
jobType: transfer
sourceType: urlfile
filePath: /path/onlyurl.txt
urlType: onlyUrl
urlFilePrefix: 35

des.access.id : AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
des.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
des.endpoint : https://s3.cn-north-1.jdcloud-oss.com
des.bucket : yourbucket

```

|配置项|说明|
|:-|:-|
|urlType|当sourceType为urlfile时，如果文件列表并非迁移工具生成且只有url信息，则需要配置urlType为onlyUrl。|
|filePath|被读取文件的地址。若从指定 URL 列表迁移至 京东云OSS，则必须进行该部分配置。URL 列表的地址，内容为 URL 文本，一行一条 URL 原始地址(如 https://abc.abc.com/xxx/yyy.txt, 无需添加任何双引号或其他符号)。URL 列表的地址要求为绝对路径：Linux 下分隔符为单斜杠，如 /a/b/c.txt 。仅支持填写文件不支持目录|


3.3.2.5 配置京东云Bucket 相互复制 

若从 京东云OSS 的一个指定 Bucket 迁移至另一个 Bucket，则sourceType指定值为 s3file。

```
jobType: transfer
sourceType: s3file

src.access.id : XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
src.secret.key: YYYYYYYYYYYYYYYYYYYYYYYYYYYYY
src.endpoint : https://s3.cn-north-1.jdcloud-oss.com
src.bucket : yourbucket
src.prefix :

 

des.access.id : AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
des.secret.key: BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
des.endpoint : https://s3.cn-north-1.jdcloud-oss.com
des.bucket : yourbucket
des.prefix:

```

### 4.运行迁移工具
#### Linux

```
java -jar transfer-tools-java-1.0.0.jar --Dspring.config.location=application.yml

```
### Osstransfer使用说明

1.Osstransfer迁移工具大体分为三种job，分别为listObject，transfer。在迁移过程中，put上传及分片上传的每片文件都已经进行了md5的对比。

2.文件迁移单文件最大为19.5T。

3.从云厂商实现数据迁移，仅支持源Bucket权限为公有读，否则将导致迁移失败。

4.京东云OSS object key最长限度为1022字节，因此超过1022字节的文件将无法迁移。

5.AWS S3 endpoint仅支持https。

6.object key包含char(10) 换行、char(13) 回车无法迁移。

7.京东云 OSS Content-Disposition最长为100字节，使用Osstransfer时建议将ContentDispositionTooLongContinue配置项设置为true，
从而当Content-Disposition超过100字节时保证文件迁移成功。


## 迁移原理及流程
### 原理说明

Osstransfer迁移工具先使用sdk对各个数据源进行list，获取到object的列表。这样做的目的是如果迁移过程中有object变化，迁移工具不会受到影响。

### 迁移流程
1.迁移过程中，迁移日志将默认打印到 ./log 目录下。

迁移的所有文件将打印到audit-0.log中，迁移成功的文件将打印到audit.success日志中，如果需要筛选迁移失败的文件，请使用命令：

```
grep "1$" audit-0.log*
```
进行筛选。

2.审计日志说明

|名称|说明|
|:-|:-|
|version|审计日志版本号，目前为1。|
|message| 如果迁移失败，内容为迁移失败的原因。 |
|readline|读取object列表的内容。| 
|time|迁移的时间。|
|url|迁移的源的url。|
|key|迁移的object的名称。|
|messageFormat|0表示格式化成功，1表示失败。|
|headHttpCode|head url的状态码。|
|objectSize|object的大小。|
|jssMethod|使用的上传方式，PUT或MULTIPART。|
|getAmazonS3Client| 获取s3client的状态，0表示成功，1表示失败。|
|getHttpCode|get url的状态码。|
|responseEntity|0表示responseEntity 不为null，1表示为null。|
|uploadStatus|0表示put上传成功，1表示上传失败。|
|checkStatus|0表示put上传后check成功，1表示check失败。|
|retryCount|上传重试的次数。|
|abortMultipartUpload|0表示分片上传成功，1表示分片失败，abort该分片上传。|
|checkMultipartUpload|0表示check 分片上传后的文件成功，1表示失败。|
|responseTime|迁移耗时。|
|result|0表示上传成功，1表示上传失败。|
