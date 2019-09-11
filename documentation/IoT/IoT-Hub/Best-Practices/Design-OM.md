# 设计物模型

物模型是对物理设备的数字化描述，包括设备的遥测数据、设备状态、以及设备指令的定义。

# 物模型的定义

一个完整的物模型定义包括5中类型数据的定义：

1. Device Telemetry Data

	设备上行的报文流式数据，是一个描述客观事实的观测值，不可被Sever-Side Application修改。

2. Device State Data

	设备状态数据，例如设备的运行状态，设备版本号，设备报文数据的发送频率等，相对于报文数据，更新频率较低。状态数据可以被Server-Side Application修改，此状态数据会对应存在Expected Value和Reported Value。
	修改State的Expected Value，需要设备端实现监听Expected Value改变，并触发对应的设备动作。例如设备的运行状态Expected Value由“Start”修改为“Restart”，设备端应该自行执行重启操作。

3. Device Metadata

	设备的元数据，例如设备的分组标签，由Sever-Side Application创建和维护。

4. Events

	基于设备上行报文（或者state data）数据，云端或设备端（例如Edge Node）通过云端或者设备端规则引擎中的规则计算后创建。或者设备主动上报事件。

5. Commands

	Server-Side Application主动调起或者规则引擎中某条规则触发的对设备的控制指令，此类指令不修改Device State Data。例如对于所有的车机设备消息广播指令。

		请注意：
		* 当前版本不支持Device Metadata和Events，计划在下一个版本升级支持；

## 如何理解Device Telemetry Data和Device State Data差异？
Device Telemetry Data是设备上报的遥测数据，是一个测量值，不可被更改；而Device State Data是设备的状态数据，是可以被设置更改的数值。
举例来说，对于一个空调设备来说，空调温度探头读取的环境温度是Device Telemetry Data，是一个客观事实，不可修改。
而空调的温控器温度设置值是Device State Data，是可以被设备或者云端的应用修改。

## 物模型示例
请参考附件 [OM示例](../../../../image/IoT/IoT-Hub/TempHumiditySensor-OM.json)

		请注意：
		* 请按照附件的物模型示例编辑您的物模型；
		* 后续版本升级计划提供物模型编辑器，您可以在线使用可视化工具更方便的编辑物模型；


