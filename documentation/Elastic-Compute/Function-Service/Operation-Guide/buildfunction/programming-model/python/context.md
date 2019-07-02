# Context对象 

通过context可获取函数运行时的函数相关信息。例如：获取函数基本信息，在context中获得本次请求的 ID，并记录到函数日志中。后续通过该 ID 来追踪请求执行的详细信息。

 ## Context对象（Python）：

```Python
class FunctionMeta:
    def __init__(self, invoked_function_id, function_name, function_version, function_handler, memory_size, timeout):
        self.invoked_function_id = invoked_function_id
        self.function_name = function_name
        self.function_version = function_version
        self.function_handler = function_handler
        self.memory_size = memory_size
        self.timeout = timeout

class FContext:
    def __init__(self, request_id, function_meta, logset, logtopic):
        self.request_id = request_id
        self.function = function_meta
        self.logset = logset
        self.logtopic = logtopic
```



表1：context对象属性

| 属性                    | 说明                                                         |
| ----------------------- | ------------------------------------------------------------ |
| **request_id**          | 与请求关联的请求 ID。这是返回到调用了 `invoke` 方法的客户端的 ID。   注意  ： 如果重试调用，请求 ID 保持不变。 |
| **function_name**       | 正在执行的Function函数的名称。                               |
| **function_handler**    | 处理函数。                                                     |
| **function_version**    | 正在执行的Function函数版本。如果别名用于调用函数，`function_version` 将为别名指向的版本。 |
| **invoked_function_id** | id 用于调用此函数。一个function_id对应一个版本的函数。       |
| **memory_size**         | 为Function函数配置的内存限制（以 MB 为单位）。您在创建函数时设置内存限制，并且随后可更改此限制。 |
| **timeout**             | 函数超时时间。                                               |
| **logset**              | 函数日志集，若未创建则为空。                                   |
| **logtopic**            | 日志主题，若未创建则为空。                                     |

 

