# Python WSGI Web 服务迁移至函数服务

## 什么是WSGI
WSGI全称： Web Server Gateway Interface，Web服务器网关接口。WSGI定义了Web服务器与Python应用程序的交互，使得使用Python写的Web应用程序可以和Web服务器对接起来。最新官方版本在Python的[PEP-3333](https://www.python.org/dev/peps/pep-3333)中定义。

## 函数服务与WSGI
用户的application函数可以完全自行实现，也可以基于WSGI的web框架进行函数开发。
目前，很多Frameworks是基于WSGI协议，比较常见的如Flask、Django等，具体可参考[Frameworks that run on WSGI](https://wsgi.readthedocs.io/en/latest/frameworks.html)。

### 函数服务Python接口支持WSGI

函数服务内置API网关触发器event到WSGI接口的转换库jdcloud_wsgi_wrapper，通过引用jdcloud_wsgi_wrapper中的wsgi_run函数将API网关的event事件转换为WSGI协议格式，并运行应用程序。

参考以下用户采用application方式或类方式编写函数入口函数：

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

### 迁移 django 框架服务至函数服务

#### step1：virtualenv开发代码迁移
在使用virtualenv的开发环境中，使用pip freeze 查看代码的依赖，将依赖包和源代码一起打包。
这里使用引入beatifulsoup库的代码作为示例，具体操作如下：

```Shell
➜  dev$ mkdir venv-test
➜  dev$ cd venv-test
➜  venv-test$ virtualenv --no-site-packages venv
➜  venv-test$ . ./venv/bin/activate
(venv) ➜  venv-test$ pip install beautifulsoup4
(venv) ➜  venv-test$ vim test.py
from bs4 import BeautifulSoup
soup = BeautifulSoup("<p>Some<b>bad<i>HTML",features="html.parser")
print(soup.prettify())
(venv) ➜  venv-test$ pip freeze
beautifulsoup4==4.7.1
soupsieve==1.9.2
(venv) ➜  venv-test$ cp -R venv/lib/python3.7/site-packages/bs4  .
(venv) ➜  venv-test$ cp -R venv/lib/python3.7/site-packages/soupsieve .
(venv) ➜  venv-test$ zip -r  code.zip bs4  soupsieve test.py

```
code.zip作为程序包上传置函数服务中，其中包括：

* 源码：test.py
* 依赖库：bs4 soupsieve

#### step2：django代码迁移
在工程目录下执行以下文件pack.sh，其中：

1.修改project为django project名称；

2.LIBPATH为virtualenv的路径下的依赖包目录。

pack.sh完成以下工作：

1.生成index.py，作为函数服务的入口函数；

2.将代码和依赖包打包成code.zip，作为上传到函数服务的代码包。

```Shell
#!/bin/bash
export PROJECT=mysite
export LIBPATH=venv/lib/python3.7/site-packages
 
cat << EOF > index.py
import sys,os
sys.path.append(os.path.dirname(os.path.abspath(__file__))+'/' + '$PROJECT')
sys.path.append(os.path.dirname(os.path.abspath(__file__))+'/' + '$LIBPATH')
 
from $PROJECT.wsgi  import application as app
from jdcloud_wsgi_wrapper import wsgi_run
def handler(event, context):
    result=wsgi_run(event, context, app)
    return result
EOF
 
ZIPFILE="index.py "$PROJECT" "
require=`pip freeze $PROJECT | awk -F'==' '{print tolower($1)}'`
for i in $require
do
    ZIPFILE=$ZIPFILE" "$LIBPATH"/"$i" "
done
echo $ZIPFILE
zip -r -q code.zip  $ZIPFILE

```

index.py函数如下：

```Python
import sys,os
sys.path.append(os.path.dirname(os.path.abspath(__file__))+'/' + 'mysite')
sys.path.append(os.path.dirname(os.path.abspath(__file__))+'/' + 'venv/lib/python3.6/site-packages')
 
from mysite.wsgi  import application as app
from jdcloud_wsgi_wrapper import wsgi_run
def handler(event, context):
    result=wsgi_run(event, context, app)
    return result

```

#### step3：创建函数并配置触发器验证
1.在京东云函数服务控制台创建函数，上传code.zip代码包，入口函数为index.handler。
![创建函数](https://github.com/jdcloudcom/cn/blob/function3/image/Elastic-Compute/functionservice/apigw%E8%A7%A6%E5%8F%91%E5%99%A8-wsgi-1.png) 

2.配置测试事件进行控制台测试，符合代码预期后，配置API网关触发器，验证触发器执行结果，配置步骤及方法请参见[如何使用API网关触发器](../use-cases/apig-case.md) 。
![apigw触发器](https://github.com/jdcloudcom/cn/blob/function3/image/Elastic-Compute/functionservice/apigw%E8%A7%A6%E5%8F%91%E5%99%A8-wsgi-3.png) 

在浏览器中打开链接，返回执行结果如下：

![验证触发器执行](https://github.com/jdcloudcom/cn/blob/function3/image/Elastic-Compute/functionservice/apigw%E8%A7%A6%E5%8F%91%E5%99%A8-wsgi-2.png) 

以上，快速完成代码迁移与验证。

同理，可从flask框架迁移服务代码至函数服务，只需将服务代码及依赖打包上传至函数服务，修改入口函数完成API网关的event事件转换为WSGI函数格式，参考step2中的index.py函数，即可轻松完成服务迁移。




