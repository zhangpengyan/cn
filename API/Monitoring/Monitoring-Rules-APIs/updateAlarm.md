# updateAlarm


## 描述
修改已创建的报警规则

## 请求方式
PUT

## 请求地址
https://monitor.jdcloud-api.com/v2/groupAlarms/{alarmId}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**alarmId**|String|True| |规则id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**baseContact**|BaseContact[]|False| |告警通知联系人|
|**dimension**|String|False| |资源维度，可用的维度请使用 describeProductsForAlarm接口查询|
|**enabled**|Long|False| |是否启用, 1表示启用规则，0表示禁用规则，默认为1|
|**noticeOption**|NoticeOption[]|False| |通知策略|
|**product**|String|True| |资源类型, 可用的资源类型列表请使用 describeProductsForAlarm接口查询。|
|**resourceOption**|ResourceOption|True| | |
|**ruleName**|String|True| |规则名称，规则名称，最大长度42个字符，只允许中英文、数字、''-''和"_"|
|**ruleOption**|RuleOption|True| | |
|**ruleType**|String|False| |规则类型, 默认为resourceMonitor|
|**tags**|Object|False| |资源维度，指定监控数据实例的维度标签,如resourceId=id。(请确认资源的监控数据带有该标签，否则规则会报数据不足)|
|**webHookOption**|WebHookOption|False| | |

### WebHookOption
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**webHookContent**|String|False| |回调content 注：仅webHookUrl和webHookProtocol均不为空时，才会创建webHook|
|**webHookProtocol**|String|False| |webHook协议|
|**webHookSecret**|String|False| |回调secret，用户请求签名，防伪造|
|**webHookUrl**|String|False| |回调url|
### RuleOption
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**rules**|BasicRule[]|False| |规则触发条件,与模块参数同时指定时，优先使用rules|
|**templateOption**|TemplateOption|False| | |
### TemplateOption
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**templateId**|String|False| |模板Id|
|**templateType**|Long|False| |模板类型.1-默认模板  2-自定义模板|
### BasicRule
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**calculation**|String|True| |统计方法，必须与定义的metric一致，可选值列表：avg,sum,max,min|
|**downSample**|String|False| |降采样函数|
|**metric**|String|True| |监控项唯一标识，可根据DescribeMetricsForCreateAlarm接口查询各产品线可用的监控项（创建规则时使用Metric字段）。格式：metric:downsample|
|**noticeLevel**|NoticeLevel|False| | |
|**operation**|String|True| |报警比较符，只能为以下几种lte(<=),lt(<),gt(>),gte(>=),eq(==),ne(!=)|
|**period**|Long|True| |查询指标的周期，单位为分钟,目前支持的取值：1,2，5，10,15，30，60|
|**threshold**|Double|True| |报警阈值，目前只开放数值类型功能|
|**times**|Long|True| |连续探测几次都满足阈值条件时报警，可选值:1,2,3,5,10,15,30,60|
### NoticeLevel
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**custom**|Boolean|True| |是否为用户自己定义的级别，自定义(true) or 固定(false)|
|**levels**|Object|True| |报警级别以及对应的阈值，是一个map[string]float64对象。key:common(一般)、critical(严重)、 fatal(紧急),value:各报警级别对应的阀值，要符合operation参数对应的递进关系。 eg: "levels":{"common":1000,"critical":10000,"fatal":15000}|
### ResourceOption
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**resourceItems**|ResourceItem[]|False| |指定具体资源ID设置报警规则，每次最多100个。优先resourceItems生效|
|**tagsOption**|TagsOption|False| | |
### TagsOption
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**operator**|String|False| |操作项(多个tagFilter之间关关系)默认是or|
|**tags**|TagFilter[]|False| |资源标签,对所有符合该标签的资源设置报警规则，对于新加入该标签的资源自动生效|
### TagFilter
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**key**|String|False| |Tag键|
|**values**|String[]|False| |Tag值|
### ResourceItem
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**region**|String|True| |资源所属的region|
|**resourceId**|String|True| |资源id|
### NoticeOption
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**effectiveIntervalEnd**|String|False| |生效截止时间，默认值:23:59|
|**effectiveIntervalStart**|String|False| |生效起始时间，默认值:00:00|
|**noticeCondition**|Long[]|False| |通知条件 1-告警 2-数据不足3-告警恢复|
|**noticePeriod**|Long|False| |通知沉默周期,单位:分钟，默认值：24小时,目前支持的取值“24小时、12小时、6小时、3小时、1小时、30分钟、15分钟、10分钟、5分钟”|
|**noticeWay**|Long[]|False| |通知方法    1-短信 2-邮件|
### BaseContact
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**referenceId**|Long|True| |联系人id。  注：ReferenceType=2时，联系人id请填0|
|**referenceType**|Long|True| |联系人id类型：0,联系人分组id;1,联系人id，2，pin帐号主联系人|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Result| |
|**requestId**|String|请求的标识id|

### Result
|名称|类型|描述|
|---|---|---|
|**alarmId**|String|创建成功的规则id|
|**success**|Boolean|成功则返回true|

## 返回码
|返回码|描述|
|---|---|
|**200**|更新规则|
