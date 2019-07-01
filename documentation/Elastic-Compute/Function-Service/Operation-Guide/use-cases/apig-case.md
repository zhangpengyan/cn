
# API网关触发器示例
京东云API网关可将事件（例如：put/post API ）映射至Function函数，将event参数传递至Function处理函数来调用您的函数。

场景：当有请求到达已经设置Function为后端服务的 API 网关时，API 网关会触发函数的执行，Function会将执行结果返回给 API 网关。

本示例对 API 网关触发函数服务的使用步骤进行详细介绍。介绍如何配置API网关触发器，使用API网关函数模板，通过函数获取API网关传入的函数参数，并将处理结果返回API网关。

## 创建API


1．创建触发器前，请您先开通API网关服务，并创建一个region为华北-北京的API。

2．登陆API控制台，创建API分组及API

详细操作指南参见 [使用Function函数作为API后端服务](/documentation/Middleware/API-Gateway/Getting-Started/example_function.md)。

完成API创建。

## 创建函数

登陆函数服务控制台，进入“概览”页面或”函数列表“页面，单击”创建函数“。

* 函数模板：API网关模板
* 函数名称：APIGfunction（您可以设置自己的函数名）
* 函数入口：根据提示填写，默认index.handler
* 函数代码：默认选中的API网关模板
* 函数执行内存：128MB
* 超时时间：100秒
* 描述、环境变量及高级配置：无需填写
* 触发器：不配置触发器<br>
单击”完成“，完成函数创建。

## 测试函数

在创建触发器之前，可以先通过控制台配置测试事件模拟一函数执行。

API网关事件源会以 event 的形式作为输入参数传递给函数，您可以将 event 传给函数，测试编码是否正确。

1. 创建测试事件<br>
进入”函数列表“页面，单击”APIGfunction“函数，进入函数详情页面，选择”配置测试事件”，
    * 配置测试事件：创建新的测试事件
    * 事件模板：API Gateway-event-template
    * 事件名称：test<br>
    单击“保存”，完成测试事件创建。<br> 

2. 测试函数<br>
在“请选择测试事件”下拉列表中选择已保存的测试事件“test” ，单击“测试”。<br> 

3. 执行成功后，可在控制台查看实时函数执行日志。

## 创建API网关触发器


1. 在API网关控制台，创建API。

2. 在“APIGfunction”函数详情页面，选择”触发器”tab,单击“创建触发器”。
    * 触发器类型：API网管触发器
    * API分组：选择已创建准备绑定Function的未发布的API分组
    * 版本号：选择API版本号
    * API：选择API
    
3. 测试成功后，在API网关控制台，发布API即可。<br>
以上，完成API网关触发器触发Function的简单示例。





