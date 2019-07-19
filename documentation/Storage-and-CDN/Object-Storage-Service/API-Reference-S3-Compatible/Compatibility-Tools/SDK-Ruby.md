# SDK-Ruby

## 概述

本文档基于[AWS Ruby SDK](https://docs.aws.amazon.com/zh_cn/sdk-for-ruby/v3/developer-guide/welcome.html)编写。京东云对象存储支持AWS S3接口，具体兼容的接口可在[兼容接口](../Compatibility-API/Compatibility-API-Overview.md)查看。

## 环境准备

请使用Ruby 1.9及以上版本，如需安装或更新Ruby，请访问[Ruby](http://www.ruby-lang.org/en/)。

## SDK安装
安装AWS SDK for Ruby，请运行以下命令：
```
gem install aws-sdk-s3 -V
```

## 初始化

您可以初始化S3实例，用于管理存储空间和文件等OSS资源。使用Ruby SDK发起OSS请求，您需要使用您的AccessKey和SecretKey初始化一个S3实例，并根据需要修改Endpoint、Region等默认配置项。

```Ruby
require 'aws-sdk-s3'

endpoint = 'https://s3.<REGION>.jdcloud-oss.com'
region = '<REGION>'
cred = Aws::Credentials.new('<your-ak>','<your-sk>')

#初始化Client
s3C = Aws::S3::Client.new(
  credentials: cred,
  endpoint: endpoint,
  region: region
)

#初始化Resource
s3R = Aws::S3::Resource.new(
  credentials: cred,
  endpoint: endpoint,
  region: region
)
```

## 使用示例

以下为部分使用示例，更多说明请参考[Class: Aws::S3::Client](https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/S3/Client.html)。

### 创建存储空间
初始化Client实例，并使用其创建存储空间：
```Ruby
require 'aws-sdk-s3'

endpoint = 'https://s3.cn-north-1.jdcloud-oss.com'
region = 'cn-north-1'
cred = Aws::Credentials.new('<your-ak>','<your-sk>')

#初始化Client实例
s3C = Aws::S3::Client.new(
  credentials: cred,
  endpoint: endpoint,
  region: region
)

#Create Bucket
bucket = 'bucket-ruby-test'
s3C.create_bucket(bucket: bucket)
```

### 上传文件
初始化Resource实例，并使用其上传文件（支持5G以上文件）：
```Ruby
require 'aws-sdk-s3'

endpoint = 'https://s3.cn-north-1.jdcloud-oss.com'
region = 'cn-north-1'
cred = Aws::Credentials.new('<your-ak>','<your-sk>')

#初始化Resource
s3R = Aws::S3::Resource.new(
  credentials: cred,
  endpoint: endpoint,
  region: region
)

#Upload File
file = 'local-file'
bucket = 'bucket-ruby-test'
obj = s3R.bucket(bucket).object(File.basename(file))
obj.upload_file(file)
```
