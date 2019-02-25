Flask open tracing and consul service discover demo
======

this is the demo for flask use consul for service discover and using open tracing in all request

the open-tracing for flask sdk github web site is [open-tracing-python-flask](https://github.com/opentracing-contrib/python-flask)  

the open-tracing Jaeger-client-python sdk github web site is [jaeger-client-python](https://github.com/jaegertracing/jaeger-client-python)

## 启动 demo

* 安装对应的 pip

```bash

 pip install opentracing_instrumentation
 pip install python-consul
 pip install pyYaml
 pip install requests
 pip install jaeger-client==3.2.0
 pip install Flask-OpenTracing==0.1.8
 
```

* 启动 consul 服务注册中心


* 启动 jaeger-all-in-one 镜像 or 对应的服务，注意需要安装jaeger-agent

* 修改配置文件 配置文件位置在`config/appConfig.yaml`,修改对应的配置文件属性包括注册中心地址，服务发现，注册，链路跟踪参数等

* 启动应用

```shell

 python hello.py

```