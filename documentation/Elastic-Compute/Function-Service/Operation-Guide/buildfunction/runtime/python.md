# Python

函数服务前支持以下 Python 运行环境：

Python 2.7 ( 支持 python2.7版本 )

Python 3.6 ( 支持 python3.6版本 )

Python 3.7 ( 支持 python3.7版本)

## 处理程序

定义一个简单的Python函数作为函数入口：

```Python
   def handler(event, context):
   return 'hello world'
```

函数创建时以[文件名].[函数名]的格式定义函数执行入口，handler函数与创建函数时，入口函数定义中的“函数名”字段对应。

使用本地ZIP包上传，请确认ZIP包根目录下包含指定的入口文件，文件内有函数名对应的入口函数，确保能够根据定义的函数入口查找到对应的文件及函数执行。

   
## 入参
Python 环境下的入参包括 event 和 context，两者均为 Python dict 类型。

event：调用函数时的输入触发事件参数。

context：使用此参数向您的处理程序传递运行时信息。


## 日志

您可以使用 print 或 logging 模块来打印日志输出，并在函数日志中查看：

```Python
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
def main_handler(event, context):
    logger.info('got event{}'.format(event))
    print("got event{}".format(event))
    return 'Hello World!'
```


## 使用内置模块

除了 Python 的标准模块，函数服务的 Python 运行环境中还包含以下常用模块，用户可以直接引用。

| 模块名称|模块介绍 | 相关链接 |
| ------ | ------ | ----- |
| boto3 | OSS Python SDK | [ OSS Python SDK](https://docs.jdcloud.com/cn/object-storage-service/sdk-python) |  

编写函数代码时，可通过如下方式引入使用OSS SDK：
```Python
import boto3
```
 
## 支持WSGI接口协议
Python Web Server Gateway Interface (简称：WSGI），函数服务Python接口已兼容WSGI， 您在Flask、Django 等基于 wsgi 协议的 web frameworks 构建的工程可以运行在函数服务的 python runtime 中，您基于WSGI协议的代码或在原有框架下的已有服务代码，都可快速迁移至京东云函数服务，详情可参考[ Python WSGI Web 框架服务迁移至函数服务](../../use-cases/wsgi.md)。

函数服务内置了API网关触发器event到WSGI接口的转换库jdcloud_wsgi_wrapper，其中，wsgi_run函数用于将API网关的event事件转换为WSGI函数格式并运行应用程序，代码如下：

```Python
from jdcloud_wsgi_wrapper import wsgi_run
def handler(event, context):
    result = wsgi_run(event, context, application)
    return result
```
