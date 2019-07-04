## 阅读对象
本文档面向所有使用京东云直播SDK的开发、测试人员等, 要求读者具有一定的Android编程开发经验。  

## 运行环境
•	最低支持版本为Android 5.0 (API level 21)  
•	支持的CPU架构： arm64-v8a, armeabi-v7a, x86

## 版本说明
* **迭代**  
当前版本为V1.0.0  

* **体系结构**  
当前播放SDK支持以下体系结构:
armeabi-v7a
arm64-v8a
x86
为了节省apk size，如果没有特殊缘由，请只集成armeabi-v7a版本。
只集成armeabi-v7a版本，会导致ARMv5 ARMv6 设备不能运行。如果APP需要适配这两类设备，需要额外集成armebi版本。 

## 快速集成
本章节提供一个快速集成京东云播放SDK基础功能的示例。

* **获取SDK**  
Android端推流SDK&播放器SDK请<a href="https://sdk-publish.oss.cn-north-1.jcloudcs.com/sdk/jdcloud_streamer_android.zip">点击下载</a><br/>  

* **工程目录结构**  
demo: 示例工程，演示本SDK主要接口功能的使用    
libs: 集成SDK需要的所有库文件    
jniLibs/[armeabi-v7a|arm64-v8a|x86]: 各平台的so库    
libs/jdc_live.jar: SDK jar包    

* **配置项目**    
引入目标库, 将libs目录下的库文件引入到目标工程中并添加依赖。
可参考下述配置方式（以Android Studio为例）：  
1)导入SDK
手动集成：
将libs目录copy到目标工程的libs下；
将jniLibs目录拷贝到目标工程的src\main\jniLibs;

2)修改proguard(混淆)文件，添加如下规则：
```
-keep class com.jdcloud.media.player.** {
  *;
}
```

3)在AndroidManifest.xml文件中申请相应权限
```
<!-- 使用权限 -->
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
```
