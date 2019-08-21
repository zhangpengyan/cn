# Python WSGI Web 服务迁移至函数服务

## 什么是WSGI
WSGI的全称是 Web Server Gateway Interface，译为Web服务器网关接口。具体来说，WSGI是一个规范，定义了Web服务器如何与Python应用程序进行交互，使得使用 Python写的Web应用程序可以和Web服务器对接起来。最新官方版本在Python的[PEP-3333](https://www.python.org/dev/peps/pep-3333)中定义。

## 函数服务与WSGI
用户的application函数可以完全自行实现，也可以基于WSGI的web框架进行函数开发。
目前，很多Frameworks是基于WSGI协议，比较常见的如Flask、Django等，具体可参考[Frameworks that run on WSGI](https://wsgi.readthedocs.io/en/latest/frameworks.html)

### 函数服务部署无框架函数

用户采用application方式或类方式编写的程序，可通过引用API网关触发器event到WSGI接口的转换库：jdcloud_wsgi_wrapper中的event格式转换函数wsgi_run，将API网关的event事件转换为WSGI函数格式，详情请参考如下代码段：

```Python
from jdcloud_wsgi_wrapper import wsgi_run


def application(environ, start_response):
    print(environ['function.event'])
    print(environ['function.context'])

    status = "200 OK"
    path = environ["PATH_INFO"]
    print(path)
    length = int(environ["CONTENT_LENGTH"], 0)
    body = environ["wsgi.input"].read(length)
    print(body)
    response_headers = [('Content-type', 'text/plain')]

    start_response(status, response_headers)
    return ['Function : My Own Hello World!']


class AppClass:
    def __init__(self, environ, start_response):
        self.environ = environ
        self.start_response = start_response

    def __iter__(self):
        self.start_response('200 OK', [('Content-type', 'txt/plain')])
        yield "Hello World"


def handler(event, context):
    result = wsgi_run(event, context, AppClass)
    return result

```

### 函数服务部署
