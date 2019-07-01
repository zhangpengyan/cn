# SDK-Go

## 概述

本文档基于[AWS Go SDK](https://docs.aws.amazon.com/sdk-for-go/api/) 编写。京东云对象存储支持AWS S3接口，具体兼容的接口可在
[兼容接口](../Compatibility-API/Compatibility-API-Overview.md)查看。

## 环境准备
请使用Go 1.5及以上版本，如需安装或更新Golang，请访问[Golang](https://golang.org/doc/install)。

## 安装方式

安装AWS SDK for Go，请运行以下命令

```
go get github.com/aws/aws-sdk-go
```

## 初始化Client

您可以创建S3Client，用于管理存储空间和文件等OSS资源。使用Go SDK发起OSS请求，您需要使用您的AccessKey和SecretKey初始化一个S3Client，并根据需要修改Config的默认配置项。

下面为创建client的例子，更多Go SDK示例请访问[S3 Go Example Code](https://github.com/awsdocs/aws-doc-sdk-examples/tree/master/go/example_code/s3)。

```Go
package main

import (
    "github.com/aws/aws-sdk-go/aws"
    "github.com/aws/aws-sdk-go/aws/credentials"
    "github.com/aws/aws-sdk-go/aws/session"
    "github.com/aws/aws-sdk-go/service/s3"
)

func main() {

    ak := "your accesskey"
    sk := "your secretkey"
    creds := credentials.NewStaticCredentials(ak, sk, "")
    _,err := creds.Get()

    config := &aws.Config{
        Region          :aws.String("cn-north-1"),
        Endpoint        :aws.String("s3.cn-north-1.jdcloud-oss.com"),
        DisableSSL      :aws.Bool(false),
        Credentials     :creds,
    }

    client := s3.New(session.New(config))
    
    //use s3 client to create bucket、put object....
    
}    
```
