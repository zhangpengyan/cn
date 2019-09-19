# describeAlarms


## 描述
查询规则列表

## 请求方式
GET

## 请求地址
https://monitor.jdcloud-api.com/v2/groupAlarms


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Long|False| |当前所在页，默认为1|
|**pageSize**|Long|False| |页面大小，默认为20；取值范围[1, 100]|
|**serviceCode**|String|False| |产品线标识，同一个产品线下可能存在多个product，如(redis下有redis2.8cluster、redis4.0)|
|**product**|String|False| |产品标识，如redis下分多个产品(redis2.8cluster、redis4.0)。同时指定serviceCode与product时，product优先生效|
|**dimension**|String|False| |产品下的维度标识，指定dimension时必须指定product|
|**ruleName**|String|False| |规则名称|
|**ruleType**|Long|False| |规则类型, 1表示资源监控，6表示站点监控,7表示可用性监控|
|**enabled**|Long|False| |规则状态：1为启用，0为禁用|
|**ruleStatus**|Long|False| |资源的规则状态  2：报警、4：数据不足|
|**filters**|Filter[]|False| |服务码或资源Id列表<br>products - 产品product，精确匹配，支持多个<br>resourceIds - 资源Id，精确匹配，支持多个（必须指定serviceCode、product或dimension，否则该参数不生效）<br>alarmIds - 规则id，精确匹配，支持多个|

### Filter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|False| | |
|**values**|String[]|False| | |

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**alarmList**|DescribeGroupAlarm[]|规则列表|
|**numberPages**|Long|总页数|
|**numberRecords**|Long|总记录数|
|**pageNumber**|Long|当前页码|
|**pageSize**|Long|分页大小|
### DescribeGroupAlarm
|名称|类型|描述|
|---|---|---|
|**alarmId**|String|报警规则ID|
|**alarmStatus**|Long|规则状态，当一个规则下同时存在报警、数据不足、正常的资源时，规则状态按 报警>数据不足>正常的优先级展示<br>监控项状态：-1 未启用 1正常，2告警，4数据不足|
|**alarmStatusList**|Long[]|规则的状态列表,可能同时存在多个：1正常，2告警，4数据不足|
|**createTime**|String|创建时间|
|**dimension**|String|资源维度|
|**dimensionName**|String|资源维度名称|
|**enabled**|Long|是否启用, 1表示启用规则，0表示禁用规则，默认为1|
|**product**|String|资源类型|
|**productName**|String|资源类型名称|
|**resourceOption**|ResourceOption| |
|**ruleName**|String|规则名称，规则名称，最大长度42个字符，只允许中英文、数字、''-''和"_"|
|**ruleOption**|RuleOptionDetail| |
|**ruleType**|String|规则类型, 默认为resourceMonitor|
|**ruleVersion**|String|规则版本  v1  v2|
|**tags**|Object|资源维度，指定监控数据实例的维度标签,如resourceId=id。(请确认资源的监控数据带有该标签，否则规则会报数据不足)|
### RuleOptionDetail
|名称|类型|描述|
|---|---|---|
|**rules**|BasicRuleDetail[]|规则触发条件,与模块参数同时指定时，优先使用rules|
|**templateOption**|TemplateOption| |
### TemplateOption
|名称|类型|描述|
|---|---|---|
|**templateId**|String|模板Id|
|**templateType**|Long|模板类型.1-默认模板  2-自定义模板|
### BasicRuleDetail
|名称|类型|描述|
|---|---|---|
|**calculateUnit**|String|指标的计算单位，比如bit/s、%、k等|
|**calculation**|String|统计方法，必须与定义的metric一致，可选值列表：avg,sum,max,min|
|**downSample**|String|降采样函数|
|**metric**|String|监控项唯一标识，可根据DescribeMetricsForCreateAlarm接口查询各产品线可用的监控项（创建规则时使用Metric字段）。格式：metric:downsample|
|**metricName**|String|监控项名称|
|**noticeLevel**|NoticeLevel| |
|**operation**|String|报警比较符，只能为以下几种lte(<=),lt(<),gt(>),gte(>=),eq(==),ne(!=)|
|**period**|Long|查询指标的周期，单位为分钟,目前支持的取值：1,2，5，10,15，30，60|
|**threshold**|Double|报警阈值，目前只开放数值类型功能|
|**times**|Long|连续探测几次都满足阈值条件时报警，可选值:1,2,3,5,10,15,30,60|
### NoticeLevel
|名称|类型|描述|
|---|---|---|
|**custom**|Boolean|是否为用户自己定义的级别，自定义(true) or 固定(false)|
|**levels**|Object|报警级别以及对应的阈值，是一个map[string]float64对象。key:common(一般)、critical(严重)、 fatal(紧急),value:各报警级别对应的阀值，要符合operation参数对应的递进关系。 eg: "levels":{"common":1000,"critical":10000,"fatal":15000}|
### ResourceOption
|名称|类型|描述|
|---|---|---|
|**resourceItems**|ResourceItem[]|指定具体资源ID设置报警规则，每次最多100个。优先resourceItems生效|
|**tagsOption**|TagsOption| |
### TagsOption
|名称|类型|描述|
|---|---|---|
|**operator**|String|操作项(多个tagFilter之间关关系)默认是or|
|**tags**|TagFilter[]|资源标签,对所有符合该标签的资源设置报警规则，对于新加入该标签的资源自动生效|
### TagFilter
|名称|类型|描述|
|---|---|---|
|**key**|String|Tag键|
|**values**|String[]|Tag值|
### ResourceItem
|名称|类型|描述|
|---|---|---|
|**region**|String|资源所属的region|
|**resourceId**|String|资源id|

## 返回码
|返回码|描述|
|---|---|
|**200**|查询规则列表|
