# 图片原图保护

对于图片文件，为了在业务中避免被盗图的风险，需要限制向外暴露的图片URL，使匿名访问者只能获取到经过缩略处理或者添加水印后的图片。该场景可以通过开启原图保护的方式实现。

## 原图保护规则

开启原图保护以后，无法通过下面两种方式访问：

* 外链地址直接访问：http://downloads.s3.cn-north-1.jdcloud-oss.com/lena.jpg

* 使用处理参数访问：http://downloads.s3.cn-north-1.jdcloud-oss.com/lena.jpg?x-oss-process=img/s/200/300

只能通过样式方式访问图片：http://downloads.s3.cn-north-1.jdcloud-oss.com/lena.jpg?x-oss-process=imgalias/stylename

说明：

a.该规则仅针对非owner用户有效，配置原图保护后，owner用户可以通过签名的访问方式获取到图片原图。

b.原图保护主要针对于图片文件，必须配置被保护图片的后缀。例如配置限制了.png后缀文件，仍然可以访问.jpg后缀的原图。支持可配置的图片格式有png、jpg、jpeg、gif、bmp、webp、svg、jp2（jpeg 2000）、tiff、jbig

c.原图保护支持图片处理新老接口，也同样支持OSS域名及兼容S3域名，推荐使用[新版服务域名](https://docs.jdcloud.com/cn/object-storage-service/regions-and-endpoints)。

## 配置规则

1.进入对象存储控制台Bucket管理页面，点击要设置原图保护的Bucket进入设置页面。

2.进入图片处理页面，该页面可查看当前Bucket所建图片样式并进行设置。

![原图1](../../../../../image/Object-Storage-Service/OSS-152.png)

3.点击 【图片访问设置】进入设置页面，可选择开启原图保护，并设置保护后缀。

![原图2](../../../../../image/Object-Storage-Service/OSS-153.png)

**说明**
  自定义分隔符。
  * 你可以选择一个或者多个分隔符;
  * 分隔符与原图保护设置可分别设置;
  * 详见[自定义分隔符](./Delimiter-Guidance.md)。

4.设置好您所需的选项后，点击确定完成当前Bucket原图保护的设置。
