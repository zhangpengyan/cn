# 日志记录

您可以使用日志记录语句在函数中记录函数执行情况，Function会将这些日志写入函数日志，若您使用控制台调用函数，控制台将显示相同日志。您可以在日志服务的对应函数页面查看代码中的函数日志，函数日志配置与查询详情请参见[函数日志](../../../function-log.md)。

通过以下 Python 语句生成日志条目：

* `print` 语句
* `logging` 模块中的 `Logger` 函数

`print` 和 `logging.*` 函数将日志写入函数日志中，而 `logging.*` 函数将额外信息写入每个日志条目中，例如时间戳和日志级别。

**使用 `logging` 语句写入日志**

您可以通过使用`logging`模块将信息写入函数日志，示例如下： 

```Python
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
def my_logging_handler(event, context):
  logger.info('got event{}'.format(event))
  logger.error('something is error')
return 'function is worked'  
```

 

 
**使用 `print` 语句写入日志**

您可以通过`print`语句打印函数日志，示例如下：

```Python
from __future__ import print_function
def lambda_handler(event, context):
  print('it is running')`
  return 'Hello World!'`   
```  

在此示例中，仅将打印文本发送到日志服务。日志条目将不会包含 `logging.*` 函数返回的额外信息。
