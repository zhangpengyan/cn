函数服务前支持以下 Python 运行环境：

Python 2.7 ( runtime = python2.7 )
Python 3.6 ( runtime = python3.6 )
Python 3.7 ( runtime = python3.7 )

# 处理程序

定义一个简单的Python函数作为函数入口：

```Python
   def handler(event, context):
   return 'hello world'
```

handler函数与创建函数时，入口函数定义中的“handler”字段对应。Function从处理程序开始执行您的代码，函数入口格式为：文件名.函数名。例如，用户指定函数入口为：index.handler，则函数服务会在代码程序包中寻找index.py中的handler函数开始执行。

   
# 入参
Python 环境下的入参包括 event 和 context，两者均为 Python dict 类型。

event：调用函数时的输入触发事件参数。
context：使用此参数向您的处理程序传递运行时信息。


# 日志

您可以在程序中使用 print 或使用 logging 模块来完成日志输出。例如如下函数：

```Python
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
def main_handler(event, context):
    logger.info('got event{}'.format(event))
    print("got event{}".format(event))
    return 'Hello World!'
```
您可以在函数日志中查看日志输出。

# 使用内置模块

除了 Python 的标准模块，函数服务的 Python 运行环境中还包含以下常用模块，用户可以直接引用。
| 模块名称 | 模块介绍 | 相关链接 |
| ---------- | -------- | -------- |
| boto3 | OSS Python SDK  | [ OSS Python SDK](https://docs.jdcloud.com/cn/object-storage-service/sdk-python) |  
| Python 3.6   | Python 3.6 版本 | [编程模型](programming-model/basic-concept.md) | 

