# NodeJS

函数服务前支持以下 NodeJS 运行环境：

NodeJS 6 ( 支持  NodeJS 6.17 版本 )

NodeJS 8 ( 支持  NodeJS 8.16 版本 )

## 处理程序

定义一个简单的NodeJS函数作为函数入口：

```JavaScript
exports.handler = function(event, context, callback) {
  console.log('hello world');
  callback(null, 'hello world');
}
```

函数创建时以[文件名].[函数名]的格式定义函数执行入口，handler函数与创建函数时，入口函数定义中的“函数名”字段对应。

使用本地ZIP包上传，请确认ZIP包根目录下包含指定的入口文件，文件内有函数名对应的入口函数，确保能够根据定义的函数入口查找到对应的文件及函数执行。

   
## 入参
NodeJS环境下的入参包括 event、 context、callback，其中 callback为可选参数。

event：调用函数时的输入触发事件参数。

context：此参数向您的处理程序传递运行时信息。

callback：此参数用于将您所希望的信息返回给调用方。如果没有此参数值，返回值为null。


## 日志

您可以使用如下语句来打印日志输出，并在函数日志中查看输出：

```JavaScript
console.log()
console.error()
console.warn()
console.info()
```


## 使用内置模块

除了NodeJS的标准模块，函数服务目前未内置其他模块，您可以提交工单与我们联系。
