# 物联网引擎


## 简介
API related to IoT Core


### 版本
v2


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**addDevice**|POST|注册单个设备并返回秘钥信息|
|**createProduct**|POST|新建产品|
|**deleteProduct**|DELETE|删除产品|
|**describeProduct**|GET|查看产品|
|**describeThingShadow**|GET|查看设备影子|
|**exportThingModel**|GET|导出物模型|
|**importThingModel**|PUT|导入物模型|
|**invokeThingService**|POST|设备服务调用|
|**listProductAbilities**|GET|查看产品功能列表接口|
|**listProducts**|GET|查看产品列表接口|
|**queryDeviceDetail**|GET|查询设备详情|
|**queryDevicePage**|GET|分页查询设备信息,支持一个或多个条件|
|**removeDevice**|DELETE|删除设备|
|**updateDevice**|POST|修改设备详情|
|**updateProduct**|PATCH|修改产品|
|**updateThingShadow**|PATCH|更新设备影子的期望值|
