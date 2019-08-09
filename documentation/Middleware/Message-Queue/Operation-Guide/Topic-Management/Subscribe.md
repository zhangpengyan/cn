# 订阅topic
## 前提条件
- 已经创建好topic

## 注意事项
- 对于某个topic的订阅Consumer Group数量没有限制。
- 可以选择已有的Consumer Group，也可选择新建Consumer Group。


## 操作步骤
### 1. 在topic列表，选择想要订阅topic所在行的“订阅”按钮

![订阅步骤1](https://github.com/jdcloudcom/cn/blob/edit/image/Internet-Middleware/Message-Queue/订阅-01.png)

### 2.填写完订阅者信息，点击“订阅”按钮

![订阅步骤2](https://github.com/jdcloudcom/cn/blob/edit/image/Internet-Middleware/Message-Queue/订阅-02.png)  
I. Consumer Group ID为Topic下唯一，如果有相同名称的Consumer Group ID被创建，则无法创建成功。并且Consumer Group ID只能包含字母、数字、连字符(-)和下划线(_)，长度7-64字符。  
II. Consumer Group ID 和topic的关系是多对多关系（N：M），同一个Consumer Group ID可以订阅多个topic，同一个topic可以对应多个Consumer Group ID。  

### 3.可在topic详情-订阅管理，查询订阅信息

![订阅步骤3](https://github.com/jdcloudcom/cn/blob/edit/image/Internet-Middleware/Message-Queue/订阅-03.png)
可以点击“取消订阅”，完成取消订阅的操作
