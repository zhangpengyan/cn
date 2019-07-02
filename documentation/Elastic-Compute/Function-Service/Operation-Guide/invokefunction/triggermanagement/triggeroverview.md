# 触发器概述

函数服务是事件触发的Serverless服务，核心组件是Function函数和事件源。事件源是事件的产生者，函数是事件的处理者，触发器定义了事件源触发函数的规则。在事件源中，当事件发生，若满足预先配置的触发器规则，事件源则调用触发器所对应的函数。

   函数可由京东云云服务触发、控制台触发或SDK触发。公测期间，函数服务支持的事件源类型参考[触发器列表](triggerlist.md)，触发器类型在陆续丰富中。

 

触发器配置:


`eventSource`：触发器类型（例如：OSS、AIP网关）。

`eventSourceId`：触发器执行的资源描述符。事件源Id，分别对应apiId和BucketId。

`configurationId`：触发器配置信息，分别对应apiId和ConfigurationId，各触发器配置信息根据触发器类型不同请参考对应[事件源服务](eventsourceservice/eventsource-service.md)。
