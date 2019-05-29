# OSS触发器示例

京东云OSS可将事件（例如：上传文件至Bucket中）映射至Function函数，将event参数传递至Function处理函数来调用您的函数。


本示例介绍如何配置OSS触发器，实现从OSS Bucket触发器中下载文件至临时磁盘存储。

 
## 创建OSS Bucket


1．   创建触发器前，请您先开通OSS对象存储服务，登陆OSS控制台，在华北-北京地域，创建名为”donwloadfunction“的新空间（Bucket），“访问权限”为“私有读写”。<br>
2．   在新创建的Bucket中上传test.txt本地文件。<br>
3．   完成。<br>

详细操作指南参见[创建存储空间](/documentation/Storage-and-CDN/Object-Storage-Service/Operation-Guide/Manage-Bucket/Create-Bucket-2.md)。



 

## 创建函数

 注意：函数和OSS Bucket需在同一region。
 
 登陆函数服务控制台，在华北-北京地域，进入“概览”页面或”函数列表“页面，单击”创建函数“。

* 函数模板：Python 3.6 从对象存储OSS bucket中下载文件
* 函数名称：downloadOSS（您可以设置自己的函数名）
* 函数入口：根据提示填写，默认index.handler
* 函数代码：参考代码如下，用户AK、SK信息需手动录入
  
```Python

import boto3


def handler(event, context):
  access_key = '用户AK'   
  secret_key = '用户SK'

  region = event['Records'][0]['region']
  bucket_name = event['Records'][0]['detail']['s3']['bucket']['name']
  object_name = event['Records'][0]['detail']['s3']['object']['key']

  endpoint = 'https://s3.{}.jdcloud-oss.com'.format(region)
  s3 = boto3.client(
    service_name='s3',
    aws_access_key_id=access_key,
    aws_secret_access_key=secret_key,
    endpoint_url=endpoint
  )

  # download file
  try:
    response = s3.get_object(Bucket=bucket_name, Key=object_name)
    if response['ResponseMetadata']['HTTPStatusCode'] != 200:
      print("download file failed")
      return "download file failed"
    stream = response['Body']
    chunk_size = 1024
    with open('/tmp/test', 'wb') as f:
      while True:
        data = stream.read(chunk_size)
        if not len(data):
          break
        print(data)
        f.write(data)
  except Exception as e:
    print(str(e))
    print("download file failed")
    return "download file failed"

  print("download file successfully")
  return "download file successfully"

```

* 函数执行内存：128MB
* 超时时间：100秒
* 描述、环境变量及高级配置：无需填写
* 触发器：不配置触发器

单击”完成“，完成函数创建。



## 测试函数

在创建触发器之前，先通过控制台配置测试事件模拟函数执行。

OSS事件源会以 event 的形式作为输入参数传递给函数，您可以将 event 传给函数，测试编码是否正确。

1.创建测试事件
  
  在downloadOSS函数详情页面，选择”配置测试事件”，
* 配置测试事件：创建新的测试事件
* 事件模板：OSS-event-template
* 事件名称：test（您可以设置自己的测试事件名）
* 修改该事件模板，输入创建的OSSbucket参数，参考如下：

```JSON
{
     "Records": [
        {
            "version": "0",
            "id": "6a7e8feb-b491-4cf7-a9f1-bf3703467718",
            "time": "2006-01-02T15:04:05.999999999Z",
            "source": "oss",
            "base64OwnerPin": "NTk0MDM1MjYzMDE5",
            "resources": [
                "jrn:oss:cn-north-1:accountID:bucketname/objectname"
            ],
            "region": "cn-north-1",
            "detailType": "MessageReceived",
            "detail": {
                "eventName":"event-type",
                "responseElements":{
                    "x-amz-request-id":"OSS generated request ID"
                },
                "s3":{
                    "s3SchemaVersion":"1.0",
                    "configurationId":"ID found in the bucket notification configuration",
                    "bucket":{
                        "name":"downloadfunction",
                        "ownerIdentity":{
                            "principalId":"userId-of-the-bucket-owner"
                        }
                     },
                    "object":{
                        "key":"test.txt",
                        "eTag":"object eTag",
                        "size":"object size",
                        "type":"object type"
                    }
                },
                "callBackVar": {
                    "callBackVars": {
                        "var1":["value1","value3"],
                        "var2":["value2"]
                    }
                }
            }
        }
    ]
}
```

单击“保存”，完成测试事件创建。

2.测试函数

在“请选择测试事件”下拉列表中选择已保存的测试事件“test” ，单击“测试”。


3.执行成功后，可在控制台查看实时函数执行日志，完成从bucket：downloadfunction下载test.txt至函数的临时磁盘空间。
 

## 创建OSS触发器

控制台测试完成后，可为函数配置OSS：downloadfunction触发器，触发函数运行。

1.在“OSSfunction”函数详情页面，选择”触发器”tab,单击“创建触发器”。

* 触发器类型：OSS触发器
* Bucket：选择已创建准备绑定Function的Bucket:"downloadfunction"
* 事件类型：s3:ObjectCreated:*
* 前缀：空
* 后缀：空

完成创建。

2.在OSS控制台，上传任意一个文件至"downloadfunction"Bucket，Function被触发，执行下载该bucket中的test.txt文件至临时磁盘存储。

以上，完成OSS触发器触发Function的简单示例。


