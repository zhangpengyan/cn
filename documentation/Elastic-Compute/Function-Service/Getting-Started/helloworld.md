# Hello World示例
本章展示Hello World示例，介绍使用函数服务快速编写Hello World示例的步骤。

准备工作：开始示例操作前，请申请开通函数服务。

## 新建函数
用户登陆函数服务，进入“概览”页面或”函数列表“页面，单击”创建函数“。

  * 函数模板：Python 3.6 自定义模板；<br>
  * 函数名称：HelloWorld；<br>
  * 函数入口：根据提示填写，默认index.handler；<br>  
  * 函数代码：在代码编辑页面输入Hello World 函数，控制台编辑器默认函数为HelloWorld函数；<br>
  
 
  ```Python
def handler(event,context):
print(event)
return "hello world"

```
     
  * 函数执行内存：默认128MB；  
  * 超时时间：默认100秒； 
  * 描述、环境变量及高级配置：无需填写；  
  * 触发器：不配置触发器；
    单击”完成“，完成函数创建。

## 测试函数 
1. 创建测试事件<br>
进入”函数列表“页面，单击”HelloWorld“函数，进入函数详情页面，选择”配置测试事件”，
    * 配置测试事件：创建新的测试事件；
    * 事件模板：空白模板；
    * 事件名称：test；
    单击“保存”，完成测试事件创建。 
    ![测试事件](https://github.com/jdcloudcom/cn/blob/functionservice/image/Elastic-Compute/functionservice/test3.PNG)

2. 测试函数<br>
在“请选择测试事件”下拉列表中选择已保存的测试事件“test” ，单击“测试”。
![测试事件](https://github.com/jdcloudcom/cn/blob/functionservice/image/Elastic-Compute/functionservice/testwork.png)                  

3. 查看执行结果<br>
在控制台可直接查看函数执行结果及日志。
![控制台日志](https://github.com/jdcloudcom/cn/blob/functionservice/image/Elastic-Compute/functionservice/log1.PNG)                             
函数服务控制台只可在控制台测试后即时查看当前执行结果。函数历史日志、触发器触发函数执行结果及日志查询请参见[函数日志](../Operation-Guide/function-log.md)。


