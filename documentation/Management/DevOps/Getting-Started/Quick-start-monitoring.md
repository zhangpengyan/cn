# 监控接入指南
## 智能监控  
智能监控的实现包括以下各部分，

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started8.jpg) 

【**数据采集**】通过采集插件获取需要监控的数据并使其标准化。目前支持四个层级共9种监控类型，包括机器监控、死机监控、端口监控、进程监控、日志监控、方法监控、组件监控、域名监控、自定义监控。除机器监控由agent默认采集外，其余均需要配置对应的采集。

【**数据可视化**】提供趋势图、仪表盘、单IP搜图三种不同用途的数据可视化功能，以实现日常巡检，问题排查等。

【**报警配置**】通过配置报警规则、报警通知人、报警方式等，对需要监控的对象配置报警。

【**智能分析**】事件流将报警，部署，服务树变更等事件通过流型图的方式整合起来，方便用户快速排查和定位问题。


## 快速入门操作指南

**步骤一：部署agent，接入监控**

在使用智能监控之前，首先应确保ifrit-agent部署成功 。部署后，可按以下方式查看agent状态：选择服务树产品线及以下节点， 在“主机列表”页，可查看机器的agent状态。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started9.jpg)

**步骤二：采集配置**

(1) 选中服务树产品线或产品线以下节点，菜单选择【智能监控】-【监控配置】，进入如下【采集配置】页面。

PS：在此添加除机器监控外的其他采集任务，机器监控的数据agent默认采集，无需配置。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started10.JPG)

(2) 点击右侧“新建”按钮，打开创建配置窗口，如图所示，支持通过表单和JSON两种方式进行配置。

首先选择监控类型，然后设置采集任务的名称，范围，具体节点，采集周期，及其他监控所必填的内容。此处可根据需求和推荐，添加多个采集任务，逐步完善采集配置。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started11.jpg)

**步骤三：趋势图查看**

采集配置任务创建后，即可通过趋势图查看采集到的数据。

**入口一**：在步骤二中的采集配置页添加任务后，可在采集配置任务列表的“操作”列，点击“查图”进入如下查图页，即可查看当前采集任务的趋势图。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started12.jpg)

**入口二**：在左侧服务树选择已添加采集配置任务的节点，菜单选择【智能监控】-【数据可视化】-【趋势图】，进入如下趋势图页面。

在左侧窗口选择要查看趋势图的NS（监控对象），然后在右侧窗口选择监控类型--监控项，勾选后即可在下方看到对应的趋势图。
在该页面，可切换服务树节点，NS，监控类型及监控项，查看所有采集配置的趋势图。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started13.jpg)

**步骤四：报警组和值班组配置**

创建完采集任务且已确认采集到所需的数据后，接下来就可以对需要监控的机器、服务等添加报警。在添加报警之前，可先对服务树各个节点，添加对应的报警联系人。

（1）添加报警组：菜单选择【智能监控】-【监控配置】，在页面选择【报警组配置】tab. 报警组分为节点报警组和全局报警组两种。

节点报警组：当NS触发报警时，根据NS所属节点，给对应的节点角色发送报警。根据创建节点时的服务树角色，系统会自动生成系统PM、系统运维、系统测试和应用研发 四种角色报警组。用户可根据实际需求对报警组人员进行编辑。

全局报警组：在当前产品线范围内的任何节点都可见可用。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started14.jpg)

点击“新建”打开创建报警组窗口，如图，设置报警组名称并添加联系人即可，支持通过erp,手机号，邮箱三种方式添加联系人。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started15.jpg)

(2) 添加值班组：在系统和产品线节点可创建值班组，且每个节点仅可创建一个值班组。值班组的一般定义是接收语音报警的值班人员，减少对非值班人员的报警影响。

**步骤五：配置报警**

（1）添加报警配置：菜单选择【智能监控】-【监控配置】，在页面选择【报警配置】tab. 进入如下窗口。其中，

名称：设置该条报警配置的名称；

报警级别：共有P0，P1，P2，P3四个级别，严重程度依次减轻。

描述：为报警添加中文描述。

报警规则：支持添加多个报警规则，并设置且、或的依赖关系。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started16.jpg)

报警间隔：设置报警通知发送的间隔时间；

报警回调：可用于配置触发一些操作, 支持HTTP请求的GET和POST方式。

最大报警次数：一次报警事件最多发送报警通知的次数。

生效时间：开启报警时，报警配置生效时间段，语音报警不受此限制。
开启报警合并：有效的报警收敛方式，监控项的ns类型为HOST或INSTANCE时才可进行合并。方式包括按应用、按分组合并，当多个ns同时触发报警时，第一条报警通知里包含一个ns，其后的报警通知将合并发送，展示一个ns，其余用"N台NS报警合并"的方式告知。

接收恢复通知：在报警事件恢复时，是否发送通知。

点击“下一步”，添加报警联系人组，即完成报警配置。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started17.jpg)

**步骤六：报警管理**

（1）报警历史：菜单选择【智能监控】-【报警管理】-【报警历史】，在如图打开的报警列表页面，记录了所有发生的报警事件，包括监控对象，报警时间，报警次数、规则、恢复等详情，并允许用户查看报警配置，查图，进行ack，手动修复等操作。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started18.JPG)

（2）报警屏蔽：菜单选择【智能监控】-【报警管理】-【报警屏蔽】，对于有些无需接收和处理的报警事件，可对其设置屏蔽。屏蔽的报警仍会记录报警历史，只是在屏蔽期间不发送报警通知。

按NS屏蔽：屏蔽所选NS的所有报警

按规则屏蔽：针对某一屏蔽规则，可设置屏蔽某些NS的报警

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started19.jpg)

**步骤七：配置仪表盘**

仪表盘允许用户自由组合图形图表，将需要经常查看的数据集中在一起，配置成功后可随时查看.

（1）选择一个服务树节点，菜单选择【智能监控】-【数据可视化】-【仪表盘】，在打开的页面，点击“新建dashboard菜单”，首先创建仪表盘菜单。如图所示，最多可添加三级菜单。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started20.JPG)

（2）创建完菜单后，点击“dashboard”查看，进入仪表盘配置页，点菜单下的设置按钮，选择“添加趋势图”，即可打开如图所示的趋势图配置页面，产品线及以下节点支持通过表单和JSON两种方式配置。
页面左侧为ns，监控项，统计值等的选择区域，右侧为图形预览区。配置后可即时查看图形图表。

![image](https://github.com/jdcloudcom/cn/blob/DevOps-guhezhu1/image/DevOps/Getting-Started21.jpg)
