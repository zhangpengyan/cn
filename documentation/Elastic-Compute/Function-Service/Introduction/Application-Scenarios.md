# 应用场景

在函数服务上构建应用程序时，核心组件是Function函数和事件源。事件源是发布事件的京东云服务，Function函数是处理事件的自定义代码。

**多媒体内容分析处理** – OSS对象存储是函数服务支持的京东云事件源之一，支持多类型事件并调用您的Function函数，通过向对象存储上传事件可以触发相关的分析处理函数。例如：用户使用您的应用程序上传多媒体文件，应用程序将这些文件存储到OSS的Bucket中。您的应用程序可通过创建Function函数自动处理（提取、转码、缩放等）用户的多媒体文件，然后将处理后的结果保存到指定OSS的Bucket中。

 ![OSS场景](https://github.com/jdcloudcom/cn/blob/functionservice/image/Elastic-Compute/functionservice/scenarios1.png)
 
**Serverless后端服务** –在创建网站时，您可以在Function上托管后端逻辑。通过HTTP调用Function函数，使用API网关作为HTTP终端节点。通过 Web 客户端调用 API，API网关将请求路由到Function来调用函数，完成用户网站后端逻辑的处理。

 ![APIG场景](https://github.com/jdcloudcom/cn/blob/functionservice/image/Elastic-Compute/functionservice/scenarios2.png)
