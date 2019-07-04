# SDK-Node.js 

## 概述

本文档基于AWS Node.js SDK 编写。京东云对象存储兼容AWS S3接口，兼容接口详情请在[兼容接口](https://docs.jdcloud.com/cn/object-storage-service/compatibility-api-overview) 查看。

## 开发准备

###  npm 引入

开发前需先安装环境依赖： [npm 地址](https://www.npmjs.com/package/cos-nodejs-sdk-v5)。

### SDK 获取

为 Node.js 安装 SDK 的首选方法是使用 Node.js 程序包管理器 npm。要执行此操作，请在命令行中键入此内容。

```
npm install aws-sdk

```
**说明**

如果您在安装中遇到如下错误消息：

```
npm WARN deprecated node-uuid@1.4.8: Use uuid module instead
```
请在命令行中输入如下命令：

```
npm uninstall --save node-uuid
npm install --save uuid
```

### 开发环境

使用 SDK 需要您的运行环境包含 nodejs 以及 npm，nodejs 版本建议 7.0 版本以上。
在安装完成 npm 后，您还需要安装 npm 依赖包，在 SDK 的解压目录执行npm install。
到 [控制台 Access Key 管理](https://uc.jdcloud.com/account/accesskey) 获取您的项目 AccessKeyId 和 AccessKeySecret。

**说明：**

关于本文出现的 AccessKeyId 、 AccessKeySecret 、Bucket 等名称的含义请参考：[OSS-核心概念](https://docs.jdcloud.com/cn/object-storage-service/core-concepts)。

# 创建client

**京东云OSS 兼容绝大多数 AWS S3 API。**

在 Node.js 中使用开发工具包时，您使用 `require` 将开发工具包添加到应用程序。

### 1. 引入整个开发工具包


```JavaScript

var AWS = require('aws-sdk');

```

**如果您仅使用京东云 OSS 建议您采用仅引入对象存储服务方式，由此，通过网络传输的代码量以及代码的内存开销都会显著减少。**

### 2.仅引入对象存储服务

**如下所示是当只包含开发工具包的对象存储部分。**

```JavaScript

// Import the AWS SDK
var AWS = require('aws-sdk');
var s3 = new AWS.S3({apiVersion: '2006-03-01'});
s3.endpoint = "https://s3.cn-north-1.jdcloud-oss.com"
s3.config.update({
  accessKeyId: "your_accessKeyId",
  secretAccessKey: "your_secretAccessKey",
  s3ForcePathStyle: true,
  signatureVersion: "v4"
})

```

# 快速入门
 **说明**
 使用SDK 创建Bucket前必须在OSS控制台，开通京东云对象存储，开通流程请参见[入门指南-开通对象存储](https://docs.jdcloud.com/cn/object-storage-service/sign-up-service-1)。
 您也可通过控制台创建Bucket，[入门指南-创建存储空间](https://docs.jdcloud.com/cn/object-storage-service/create-bucket-1)。

### 创建存储空间（Bucket）

```JavaScript

// Creat  client
var AWS = require('aws-sdk');
// Import the AWS SDK only for S3
var s3 = new AWS.S3({apiVersion: '2006-03-01'});
s3.endpoint = "https://s3.cn-north-1.jdcloud-oss.com"
s3.config.update({
  accessKeyId: "XXXXXXXXXXXXXXXXXXXXXXXXXX",
  secretAccessKey: "yyyyyyyyyyyyyyyyyyyyyyyyyyy",
  s3ForcePathStyle: true,
  signatureVersion: "v4"
})


// Creat Bucket

var newBuket = {
  Bucket: 'myAPPname'
}

s3.createBucket(newBuket, function (err, data) {
    if (err) console.log(err, err.stack) // an error occurred
    else {
      console.log(data)
    }
  }
)

```


**更多例子请参见 [API 参考中的Class](https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3.html )。**
