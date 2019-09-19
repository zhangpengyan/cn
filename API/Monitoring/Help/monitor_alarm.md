注：OpenAPI入门使用请参看[公共说明](http://docs.jdcloud.com/cn/common-declaration/api/introduction)


### 1.describeProductsForAlarm

**查询可用于创建监控报警规则的产品列表及其下可用的维度** 	

示例请求

```
https://monitor.jdcloud-api.com/v2/groupAlarms:products?serviceCode=redis
```

返回

```
{
    "requestId": "b7783874-8542-4ee4-8c18-3cbc6b3e7a20",
    "result": {
        "productList": [
            {
                "serviceCode": "redis",
                "product": "redis2.8cluster",
                "productName": "云缓存Redis2.8-集群",
                "tagServiceCode": "",
                "tags": {},
                "dimensions": [
                    {
                        "dimension": "redis2.8cluster-instance",
                        "dimensionName": "实例",
                        "tagServiceCode": "",
                        "isNode": false,
                        "tags": {}
                    },
                    {
                        "dimension": "redis2.8cluster-shard",
                        "dimensionName": "分片",
                        "tagServiceCode": "",
                        "isNode": true,
                        "tags": {
                            "shardId": ""
                        }
                    },
                    {
                        "dimension": "redis2.8cluster-proxy",
                        "dimensionName": "代理",
                        "tagServiceCode": "",
                        "isNode": true,
                        "tags": {
                            "proxyId": ""
                        }
                    }
                ]
            },
            {
                "serviceCode": "redis",
                "product": "redis2.8MS",
                "productName": "云缓存Redis2.8-主从",
                "tagServiceCode": "",
                "tags": {},
                "dimensions": [
                    {
                        "dimension": "redis2.8MS-instance",
                        "dimensionName": "实例",
                        "tagServiceCode": "",
                        "isNode": false,
                        "tags": {}
                    },
                    {
                        "dimension": "redis2.8MS-proxy",
                        "dimensionName": "代理",
                        "tagServiceCode": "",
                        "isNode": true,
                        "tags": {
                            "proxyId": ""
                        }
                    }
                ]
            },
            {
                "serviceCode": "redis",
                "product": "redis",
                "productName": "云缓存Redis4.0",
                "tagServiceCode": "redis",
                "tags": {},
                "dimensions": []
            }
        ]
    }
}
```

### 2.describeMetricsForAlarm

**查询可用于创建监控报警规则的指标列表** 	

示例请求

```
https://monitor.jdcloud-api.com/v2/groupAlarms:metrics?product=vm
```

返回

```
{
    "requestId": "5f66e4e0-c3b1-4b9f-b35e-1c7e361d3bf2",
    "result": {
        "metrics": [
            {
                "serviceCode": "vm",
                "product": "vm",
                "dimension": "",
                "metric": "cpu_util",
                "metricName": "CPU使用率",
                "calculateUnit": "%"
            },
            {
                "serviceCode": "vm",
                "product": "vm",
                "dimension": "",
                "metric": "memory.usage",
                "metricName": "内存使用率",
                "calculateUnit": "%"
            },
            {
                "serviceCode": "vm",
                "product": "vm",
                "dimension": "",
                "metric": "vm.disk.bytes.read",
                "metricName": "磁盘读吞吐量",
                "calculateUnit": "Bps"
            },
            {
                "serviceCode": "vm",
                "product": "vm",
                "dimension": "",
                "metric": "vm.disk.bytes.write",
                "metricName": "磁盘写吞吐量",
                "calculateUnit": "Bps"
            },
            {
                "serviceCode": "vm",
                "product": "vm",
                "dimension": "",
                "metric": "vm.network.bytes.incoming",
                "metricName": "网络入速率",
                "calculateUnit": "bps"
            },
            {
                "serviceCode": "vm",
                "product": "vm",
                "dimension": "",
                "metric": "vm.network.bytes.outgoing",
                "metricName": "网络出速率",
                "calculateUnit": "bps"
            }
        ]
    }
}
```

### 3. createAlarm

**创建报警规则**

示例请求

```
https://monitor.jdcloud-api.com/v2/groupAlarms
```


参数

```
{
    "clientToken":"{{$guid}}",    //冥等性校验参数。若该参数相同，多次提交请求，只会创建一次规则。
    "product":"vm",
    "dimension":"",
    "ruleName":"xxxxxx",
    "enabled":1,
      "tags":{},  
    "ruleOption":{
    	"rules":[          //指定触发条件设置报警规则
    	{ 
        "calculateUnit":"ms",
        "calculation":"avg",
        "downSample":"",
        "metric":"cpu_util",   
        "NoticePeriod":1,
        "Operation":"gte",
        "Period":1,        
        "tags":{            
           },             
        "threshold":25,
        "times":2
        },        
        {
        "calculateUnit":"ms",
        "calculation":"avg",
        "downSample":"",
        "metric":"cpu_util",
        "noticeLevel":{
            "custom":true,
            "levels":{"common":50,"fatal":100}
        },  
        "NoticePeriod":1,
        "Operation":"gte",
        "Period":1,        
        "tags":{            
           },             
        "threshold":50,
        "times":2
        }
        ] ,
        "templateOption":{"templateType":2,   //基于模板的触发条件创建规则。当rules与templateOption同时指定时，rules参数优先生效
        	"templateId":"t-vtp6p3i54z"
        }
    } ,
    "resourceOption":{
    	"resourceItems":[{"resourceId":"i-otkqy1sfdsf","region":"cn-north-1"},{"resourceId":"i-sfefscvsdf","region":"cn-north-1"},{"resourceId":"i-sdfdsf","region":"cn-south-1"}],    //使用指定资源创建规则
    	"tagsOption":{
    		"tags":[{"key":"77","values":["66"]},{"key":"sdf","values":["66","sdfsdff"]}]     //使用标签创建规则。当tagsOption与resourceItems同时指定时，resourceItems参数优先生效
    	}
    	
    },
    "noticeOption":[{
    	"noticeCondition":[1,2],
    	"noticeWay":[1,2],
    	"noticePeriod":180,
    	"effectiveIntervalStart":"09:00:00",
    	"effectiveIntervalEnd":"22:30:59"
    }],
    "webHookOption":{
         "webHookProtocol":"http",
        "webHookUrl":"http://www.baidu.com"	,
        "webHookContent":"{ \"action\": \"ALARM\" , \"data\": { \"resourceId\": \"${resourceId}\", \"serviceCode\": \"${serviceCode}\", \"requestId\": \"${requestId}\", \"metric\": \"${metric}\", \"currentValue\": ${currentValue}, \"times\": ${times}, \"tags\": \"${tags}\", \"alertTime\": \"${alertTime}\", \"region\": \"${region}\", \"checkType\": \"vm\", \"asGroupId\": \"asg-51vfz2vnqu\", \"threshold\": \"${threshold}\", \"value\": ${currentValue} } }",
        "webHookSecret":"11111111111111111111111111111111111111111111111111"
    },
    "baseContact":[{"referenceId":1,"referenceType":1},{"referenceId":1,"referenceType":0},{"referenceId":1,"referenceType":2}]
   
}
```

### 4. deleteAlarms

**批量删除规则**

示例请求

```
https://monitor.jdcloud-api.com/v2/groupAlarms/alarm-bapdo1w7cz,alarm-1nc9fgje63     //指定删除时，多个规则id用,逗号分隔。最多支持50个
```


返回

```
{
    "requestId": "3f807886-fdb8-42fa-85ba-25e055f7b393",
    "result": {
        "success": true
    }
}
```

### 5. updateAlarm

**修改已创建的报警规则**

示例请求

```
https://monitor.jdcloud-api.com/v2/groupAlarms/alarm-5vayu60os4
```

参数

```
{
    "clientToken":"{{$guid}}",    
    "product":"vm",
    "dimension":"",
    "ruleName":"xxxxx",
    "enabled":1,
      "tags":{},  
    "ruleOption":{
    	"rules":[
    	{ 
        "calculateUnit":"ms",
        "calculation":"avg",
        "downSample":"",
        "metric":"cpu_util",   
        "NoticePeriod":1,
        "Operation":"gte",
        "Period":1,        
        "tags":{            
           },             
        "threshold":25,
        "times":2
        },        
        {
        "calculateUnit":"ms",
        "calculation":"avg",
        "downSample":"",
        "metric":"cpu_util",
        "noticeLevel":{
            "custom":true,
            "levels":{"common":50,"fatal":100}
        },  
        "NoticePeriod":1,
        "Operation":"gte",
        "Period":1,        
        "tags":{            
           },             
        "threshold":50,
        "times":2
        }
        ]
    } ,
    "resourceOption":{
    	"resourceItems":[{"resourceId":"i-otkqy126jn","region":"cn-north-1"},{"resourceId":"i-otkqy126jc","region":"cn-north-1"},{"resourceId":"id2","region":"cn-south-1"}]    	
    },
    "noticeOption":[{
    	"noticeCondition":[1,2],
    	"noticeWay":[1,2],
    	"noticePeriod":180,
    	"effectiveIntervalStart":"09:00:00",
    	"effectiveIntervalEnd":"22:30:59"
    }],
    "webHookOption":{
         "webHookProtocol":"http",
        "webHookUrl":"http://www.baidu.com"	,
        "webHookContent":"{ \"action\": \"ALARM\" , \"data\": { \"resourceId\": \"${resourceId}\", \"serviceCode\": \"${serviceCode}\", \"requestId\": \"${requestId}\", \"metric\": \"${metric}\", \"currentValue\": ${currentValue}, \"times\": ${times}, \"tags\": \"${tags}\", \"alertTime\": \"${alertTime}\", \"region\": \"${region}\", \"checkType\": \"vm\", \"asGroupId\": \"asg-51vfz2vnqu\", \"threshold\": \"${threshold}\", \"value\": ${currentValue} } }",
        "webHookSecret":"11111111111111111111111111111111111111111111111111"
    },
    "baseContact":[{"referenceId":1,"referenceType":1},{"referenceId":1,"referenceType":0},{"referenceId":1,"referenceType":2}]
   
}
```

返回

```
{
    "requestId": "073dc34b-eb3d-4045-8892-be4bfed2e8e4",
    "result": {
        "alarmId": "alarm-3a4moysno4",
        "success": true
    }
}
```

### 6. describeAlarms

查询规则

示例请求

```
https://monitor.jdcloud-api.com/v2/groupAlarms?pageNumber=1&pageSize=2
```

返回

```
{
    "requestId": "ec990c3e-76ff-4a20-91c5-0bb03cad38cc",
    "result": {
        "alarmList": [
            {
                "product": "vm",
                "productName": "云主机",
                "dimension": "vm",
                "dimensionName": "实例",
                "resourceOption": {
                    "resourceItems": [
                        {
                            "resourceId": "id2",
                            "region": "cn-south-1"
                        },
                        {
                            "resourceId": "i-otkqy126jc",
                            "region": "cn-north-1"
                        },
                        {
                            "resourceId": "i-otkqy126jn",
                            "region": "cn-north-1"
                        }
                    ],
                    "tagsOption": null
                },
                "ruleOption": {
                    "rules": [
                        {
                            "metric": "cpu_util",
                            "period": 1,
                            "calculation": "avg",
                            "operation": "gte",
                            "threshold": 25,
                            "times": 2,
                            "noticeLevel": {
                                "levels": null,
                                "custom": null
                            },
                            "downSample": "",
                            "metricName": "CPU使用率",
                            "calculateUnit": "%"
                        },
                        {
                            "metric": "cpu_util",
                            "period": 1,
                            "calculation": "avg",
                            "operation": "gte",
                            "threshold": 50,
                            "times": 2,
                            "noticeLevel": {
                                "levels": {
                                    "common": 50,
                                    "fatal": 100
                                },
                                "custom": true
                            },
                            "downSample": "",
                            "metricName": "CPU使用率",
                            "calculateUnit": "%"
                        }
                    ],
                    "templateOption": null
                },
                "enabled": 1,
                "ruleName": "wujiang",
                "ruleType": "resourceMonitor",
                "alarmId": "alarm-3a4moysno4",
                "ruleVersion": "v2",
                "alarmStatus": 1,
                "alarmStatusList": [],
                "createTime": "2019-09-19T11:42:16+08:00"
            },
            {
                "product": "redis2.8cluster",
                "productName": "云缓存Redis2.8-集群",
                "dimension": "redis2.8cluster-shard",
                "dimensionName": "分片",
                "resourceOption": {
                    "resourceItems": [
                        {
                            "resourceId": "id2",
                            "region": "cn-south-1"
                        },
                        {
                            "resourceId": "i-otkqy126jc",
                            "region": "cn-north-1"
                        },
                        {
                            "resourceId": "i-otkqy126jn",
                            "region": "cn-north-1"
                        }
                    ],
                    "tagsOption": null
                },
                "ruleOption": {
                    "rules": [
                        {
                            "metric": "jmiss.redis.instance.mem_fragmentation_ratio",
                            "period": 1,
                            "calculation": "avg",
                            "operation": "gte",
                            "threshold": 25,
                            "times": 2,
                            "noticeLevel": {
                                "levels": null,
                                "custom": null
                            },
                            "downSample": "",
                            "metricName": "分片内存碎片率",
                            "calculateUnit": " "
                        },
                        {
                            "metric": "jmiss.redis.instance.keyspace_hit_rate",
                            "period": 1,
                            "calculation": "avg",
                            "operation": "gte",
                            "threshold": 50,
                            "times": 2,
                            "noticeLevel": {
                                "levels": {
                                    "common": 50,
                                    "fatal": 100
                                },
                                "custom": true
                            },
                            "downSample": "",
                            "metricName": "分片命中率",
                            "calculateUnit": "%"
                        }
                    ],
                    "templateOption": null
                },
                "enabled": 1,
                "ruleName": "wujiang",
                "tags": {
                    "role": "M"
                },
                "ruleType": "resourceMonitor",
                "alarmId": "alarm-d5q7fwpl0s",
                "ruleVersion": "v2",
                "alarmStatus": 4,
                "alarmStatusList": [
                    4
                ],
                "createTime": "2019-09-04T09:58:35+08:00"
            }
        ],
        "pageNumber": 1,
        "numberPages": 11,
        "numberRecords": 21,
        "pageSize": 2
    }
}
```

