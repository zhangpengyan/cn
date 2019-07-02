# 事件源服务

 


事件源服务是所有可以触发函数执行的服务集合。您可以将这些服务配置为Function函数的事件源，公测期间，提供OSS对象存储，API网关作为事件源服务。为函数配置事件源映射后，这些事件源检测到事件发生时会自动调用您的函数。

 

## 配置事件源服务

Function通过创建事件源触发器配置事件源服务，配置流程如下：

1. 创建事件源服务触发器，设置触发函数的事件类型。
2. 配置函数输入对象event，event对象格式因触发器而异，您编写的event为函数提供事件源信息，例如:对象存储OSS事件源，event包含指定的bucket信息，object信息，用户ID等。详情请参阅：
   - [处理程序](../../../buildfunction/programming-model/python/processing-program.md)
   - [配置触发器和事件格式](../configtigger-event.md)
