## 阅读对象
本文档面向所有使用京东云直播SDK的开发、测试人员等, 要求读者具有一定的iOS编程开发经验。
## 运行环境
**支持平台**  
SDK支持iOS 8.0以上系统
硬件CPU支持arm64 arm7 arm7s  
**开发环境**  
SDK编译环境Xcode 8.0及以上版本，Xcode运行环境OS X 10.10 及以上版本  

## 版本说明  
**迭代**  
当前版本为V1.0.0    

## 快速集成  
本章节提供一个快速集成京东云播放器SDK基础功能的示例。  
具体可以参考demo工程中的相应文件。  
**下载工程**   
iOS端推流SDK&播放器SDK请<a href="https://sdk-publish.oss.cn-north-1.jcloudcs.com/sdk/jdcloud_streamer_ios.zip">点击下载</a>  
**工程目录结构**   
推流SDK的工程目录如下：包含头文件Headers。  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/ios%E6%92%AD%E6%94%BE1.png)  
**配置项目**  
1.手动导入SDK。从Demo中拷贝JDCloudPlayerFramework.framework，导入拖入您的Xcode工程中    
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/ios%E6%92%AD%E6%94%BE2.png)      
2.在 Building Setting > Valid Architectures 删除armv7、armv7s，只保留arm64。    
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/ios%E6%92%AD%E6%94%BE3.png)      
3.在 Building Setting > Enable Bitcode 修改为 NO。  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/ios%E6%92%AD%E6%94%BE4.png)   
4.在 Building Setting > Other Linker Flags增加-all_load。  
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/ios%E6%92%AD%E6%94%BE5.png)   
5.若新建工程，发生如下错误：  
```
dyld: Library not loaded: @rpath/JDCloudPlayerFramework.framework/JDCloudPlayerFramework
  Referenced from: /var/containers/Bundle/Application/5429BB4B-DD9C-4240-9F0F-F64B4EFCE50F/JDCloud_IOS_Player_Test_Demo.app/JDCloud_IOS_Player_Test_Demo
  Reason: image not found
```
解决方案：动态库设置    
![](https://github.com/jdcloudcom/cn/blob/cn-Live-Video/image/live-video/ios%E6%92%AD%E6%94%BE6.png)   

