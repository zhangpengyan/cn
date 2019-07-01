# 日志监控

- 日志监控是根据用户配置的日志全路径，去匹配一个采集周期内日志中实时出现的关键字、流量、响应时间等。主要解决服务性能慢的问题，且能初步定位问题边界。
- 日志的采集不会读取旧日志的数据。所配置的关键字出现后，才会生成对应的监控指标，如一直查不到日志的监控指标，请先检查对应时间段，日志中是否有对应的关键字出现。
- 请确保所选范围的系统或应用下的机器都有该日志，否则监控出错。

## 操作指南


步骤一：菜单选择【智能监控】-【监控配置】，左侧服务树选择产品线或产品线以下节点，在下图所示的采集配置列表页，点击“新建”。

步骤二：打开如图所示的采集配置新建窗口。其中，

**监控类型**：选择日志监控

**名称**：该条采集任务的名称，将作为监控指标的前缀。支持字母、数字以及_，且必须以字母开头

**范围**：日志采集配置的范围，与服务树所选节点相关联，原则是向下可选。当服务树选中应用节点时，范围只能选“应用”，服务树选中系统节点时，范围可选“系统”或“应用”，服务树选中产品线节点时，范围可选“产品线”、“系统”、“应用”

**节点**：进程采集配置的具体节点，选择系统或产品线节点时，将覆盖所属的所有应用。

**采集周期**：选择欲配置的采集周期。

**日志路径**：填写日志路径

**监控内容**：

​    日志类型：表单支持选择错误或流量

​    包含/不包含：添加匹配包含和不包含的关键词

​    监控项命名：为该条日志监控产生的结果命名，即自定义一个易于辨识理解的监控项名字（不能以数字开头）

​    描述：为该日志监控添加描述

​    无数据时取值：设定一个默认值，当未匹配到关键字时，监控项的取值。

​    触发报警时，返回日志现场，是指在报警通知中展示触发报警的日志行。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Operation-Guide35.jpg)



## JSON配置用例


**(1) 日志采集快速入门**

当只监控一个日志里的简单关键字时，以下是一个日志采集配置的例子：

```json
{
     "method": "log",
     "cycle": 60,
     "para": {
          "logPath": "/A/B/C/d.ERROR",
          "filters": [
               {
                    "matchStr": "can not follow scaler:",
                    "items": [
                         {
                              "classify":"errno",
                              "metricName": "followscaler_error",
                              "value": "",
                              "tags": "",
                              "desc":"描述该日志监控指标",
                              "scene":false,
                              "defaultValue": 0
                         }
                    ]
               },
               {
                    "matchStr": "getsockopt: connection refused",
                    "items": [
                         {
                              "classify":"errno",
                              "metricName": "ping_error",
                              "value": "",
                              "tags": "",
                              "desc":"描述该日志监控指标",
                              "scene":false,
                              "defaultValue": 0
                         }
                    ]
               }
          ]
     }
}
```

**必填部分**：

logPath: 填入日志的全路径。

matchStr: 填入日志中的关键字。

metricName: 填入您对这个关键字所生成的监控项的命名，仅支持英文、数字和下划线_且不能以数字开头。

tags: 填入生成的监控指标中的key，以,分隔。key的命名，支持 英文字母、数字、"、_"（下划线）、 "."(英文句号）和"-"(英文中划线)。

value: 填入的内容表示要监控的是哪种数值，默认不填时表示计算PV，还可填入cost等其他值是数值型的内容。

**其他字段的解释**：cycle指采集周期，统计出每一个采集周期内关键字出现的次数。defaultValue指当一个周期内配置的关键字从未出现，那么给予一个默认值，通常情况下记为0。

**其他重要补充**：如果同一个日志内需要监控的关键字有多个，我们支持关键字配置的数组形式，在filter内多次添加此字段即可（注意以,分隔）。


**(2) 多路径配法**

当同一个系统或者应用有多个日志，且日志类型是一样的，需要监控的关键字也一样，可按照下面的例子在一个配置中添加多个日志路径。

```json
{
     "method": "log",
     "para": {
          "multiLogFilePath": {
               "logFilePattern": "/a/b/c/$ulog_pattern$/d.log",
               "patternValues": [
                    {
                         "value": "b2b.abcd.com",
                         "trans": "b2b.abcd"
                    },
                    {
                         "value": "bbj.abcd.com",
                         "trans": "bbj.abcd"
                    },
                    {
                         "value": "book.abcd.com",
                         "trans": "book.abcd"
                    },
                    {
                         "value": "buyer.b2b.abcd.com",
                         "trans": "buyer.b2b.abcd"
                    }
               ]
          },
          "filters": [
               {
                    "items": [
                         {
                              "classify":"latency",                                                           
                              "metricName": "res_time",
                              "value": "res_time",
                              "tags": "res_code"
                         }
                    ],
                    "matchStr": ".*\\|\\|(?P<res_code>\\d+)\\|\\|(?P<res_tim>[\\.\\d]+)\\|\\|\\S+$"
               }
          ]
     },
     "cycle": 60
}
```

logFilePattern中填入每个日志路径的共同部分，不同的地方用$ulog_pattern$替代。patternValues中填入每个日志路径不同的部分，value为原来的内容，trans的作用是当原来的内容过长时可用来转换成其他描述。

**(3) prematch的使用**

prematch的作用是在提取关键字时，先根据prematch中的字段筛选出可能存在关键字的日志内容，再去匹配正则的部分。prematch不支持正则。另外，还有preNotMatch字段，意为不匹配所填关键字，同样不支持正则。

以下是一个使用prematch配置的举例：

```json
{
     "method": "log",
     "para": {
          "logPath": "/a/b/c/error.log",
          "filters": [
               {
                    "preMatch": "Connect to mysql fail",
                    "items": [
                         {
                              "classify":"errno",                                                           
                              "metricName": "Connectfail",
                              "defaultValue": 0,
                              "value": "",
                              "tags": ""
                         }
                    ],
                    "matchStr": "^."
               },
               {
                    "preMatch": "task not exists in db id",
                    "items": [
                         {
                              "classify":"errno",                                                          
                              "metricName": "task_not_exists",
                              "defaultValue": 0,
                              "value": "",
                              "tags": ""
                         }
                    ],
                    "matchStr": "^."
               }
          ]
     },
     "cycle": 60
}
```

**(4) 动态未知路径的配置方法**

支持动态路径的通配符有$DEPLOY_PATH$、$INS_NAME$、$APP$等。后两者用于当日志路径随APP名称和实例名称变化时使用。

使用$DEPLOY_PATH$的场景有两种：

1.当日志路径是动态变化的路径时，无法填写固定的路径，这时需要使用$DEPLOY_PATH$字段去匹配路径。

2.当应用很多，一个一个去配太繁琐，并且每个应用的日志都需要监控时，使用$DEPLOY_PATH$可以在更高的节点配置所有的日志采集。前提是需要在服务树去配置各个应用节点的日志路径。

以下是一个动态未知路径的配置模板：

```json
{
     "method": "log",
     "para": {
          "logPath": "$DEPLOY_PATH$",
          "filters": [
               {
                    "items": [
                         {
                              "classify":"errno",                                                           
                              "metricName": "jss_access_error",
                              "defaultValue": 0,
                              "value": "",
                              "tags": ""
                         }
                    ],
                    "matchStr": "失败"
               }
          ]
     },
     "cycle": 60
}
```

**(5) 筛选APP或group的配法**

当采集配置针对一个系统下部分APP或者一个APP下部分group时，可使用“apps"或者"groups"字段进行筛选，具体模板如下：

```json
{
     "method": "log",
     "cycle": 60,
     "apps":"填入APPName，多个以,分隔",
     "para": {
          "logPath": "/a/b/c.ERROR",
          "filters": [
               {
                    "matchStr": "can not follow scaler:",
                    "items": [
                         {
                              "classify":"errno",                                                           
                              "metricName": "followscaler_error",
                              "value": "",
                              "tags": "",
                              "defaultValue": 0
                         }
                    ]
               },
               {
                    "matchStr": "getsockopt: connection refused",
                    "items": [
                         {
                              "classify":"errno",                                                           
                              "metricName": "ping_error",
                              "value": "",
                              "tags": "",
                              "defaultValue": 0
                         }
                    ]
               }
          ]
     }
}
```

