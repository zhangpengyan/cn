## 简单播放示例

1.新建播放器：  
播放SDK核心类是JDCloudPlayer，提供的核心view是JDCloudVideoView，JDCloudVideoView可以实现播放器开始、暂停、重播、seek等功能，能满足基础的播放器功能。也可以利用JDCloudPlayer自己实现view。创建代码如下：  
```
JDCloudVideoView  mJDCloudVideoView =new JDCloudVideoView(context);
```
2.设置监听：  
播放器准备完毕的监听：
```  
mJDCloudVideoView.setOnPreparedListener(new IMediaPlayer.OnPreparedListener() {
@Override
public void onPrepared(IMediaPlayer iMediaPlayer) {
//do something
}});
```  
视频播放完成的监听：
```
mJDCloudVideoView. setOnCompletionListener (new IMediaPlayer. OnCompletionListener () {
@Override
public void onCompletion (IMediaPlayer iMediaPlayer) {
// 播放完成，可释放播放器
		if(mJDCloudVideoView!= null) {
			mJDCloudVideoView.pause ();
			mJDCloudVideoView.release(false);
		}
}});
```  
收集信息的监听：
```
mJDCloudVideoView.setOnInfoListener(new IMediaPlayer.OnInfoListener(){
@Override
Public Boolean onInfo(IMediaPlayer iMediaPlayer,int i,int infoIndex){
//i为消息类型，保存在IMediaPlayer类以MEDIA_INFO开头的常量中
return true;
}})
```  
出现错误的监听：
```
mJDCloudVideoView.setOnErrorListener(new IMediaPlayer.OnErrorListener(){
@Override
public boolean onError(IMediaPlayer iMediaPlayer,int i,int errorIndex) {
//i为消息类型，保存在IMediaPlayer类以MEDIA_ERROR开头的常量中
 return true;
}});
```  
3.设置播放地址播放视频,支持RMVB、AVI、MKV、MP4、MOV等格式。
```
mJDCloudVideoView.setVideoPath(videoUrl);
mJDCloudVideoView.start();//首次播放
jdcVideoView.switchDataSource(videoURL);//调用start启动播放后,切换视频。
```  
4.暂停播放，暂停后可以用start()再次播放。
```
if(mJDCloudVideoView!=null) mJDCloudVideoView.pause();
```  
5.结束播放,和暂停播放不同，会清除播放地址。
```
mJDCloudVideoView.stopPlayback();
```  
6.播放完成后，可以释放播放器
```
 if (mJDCloudVideoView!= null) {
            mJDCloudVideoView.release(false);
            mJDCloudVideoView = null;
        }
```  
## 更多接口

* **播放器的各种控制**  
播放器的控制接口，基本控制功能有播放、暂停、恢复播放、Seek。其中Seek功能对直播失效。  
```
//暂停播放
mJDCloudVideoView.pause();
//启动播放、暂停后恢复播放
mJDCloudVideoView.start();
//跳转到指定时间点的视频画面，单位为秒
mJDCloudVideoView.seekTo(position);
```
* **缩放模式**  
视频画面的显示模式，如裁剪、填充、全屏等效果；通过setScalingMode来设置播放模式，播放前或者播放中设置均生效。  
三种播放模式如下：  

  IRenderView.SCALING_MODE_ASPECT_FIT   
  填充：在保证视频画面全部展示的提前下，将视频的中心对准mJDCloudVideoView的中心，等比例放大或缩小视频画面，直到视频的宽高完全匹配mJDCloudVideoView 的宽高为止。  
  和ImageView的scaleType属性的值为fitCenter效果相同。  

  IRenderView.SCALING_MODE_ASPECT_FILL    
  剪裁：以填满整个mJDCloudVideoView为目的，将视频的中心对准mJDCloudVideoView的中心，等比例放大原图，直到填满mJDCloudVideoView为止（指的是mJDCloudVideoView的宽和高都要填满），视频超过mJDCloudVideoView的部分作裁剪处理。  
  和ImageView的scaleType属性的值为centerCrop效果相同。  

  IRenderView.SCALING_MODE_MATCH_PARENT  
  全屏：视频画面宽高完全匹配mJDCloudVideoView设置的区域，画面可能被拉伸  

* **倍速播放**  
在播放器创建之后，可设置倍速，播放中也可以设置，直播的视频不可设置，倍速播放支持0.5～2倍的设置。  
```
mJDCloudVideoView.setSpeed(speedLevel); 
```
* **获取播放进度和时间**  
播放器中显示的当前时间和播放的总时长，在准备播放成功后，可以获取。  
示例代码：    
```
//获取当前播放时间,单位：毫秒
int mPosition=mJDCloudVideoView.getCurrentPosition()
//总时长,单位：毫秒
int mDuration=mJDCloudVideoView.getDuration()
```
* **镜像播放**  
镜像功能可使播放的画面左右镜像翻转,示例代码：  
```
mJDCloudVideoView.setMirror(true);
```
* **后台播放**  
开启后台播放后，当用户点击home按钮后，播放器进入后台继续读取数据并播放音频。当APP回到前台后，音频继续播放。  
```
mJDCloudVideoView.enterBackground();
```
* **纯音频播放**  
设置播放过程中有无画面输出，设置该属性后，底层不再进行视频的渲染动作。播放前后均可设置。  
```
mJDCloudVideoView.setVisibility(View.INVISIBLE)
```
* **播放中截图**  
获取播放视频当前时间点的图片：   
```
Bitmap bmp=mJDCloudVideoView.takeSnapShot()
```
* **截gif小视频**  
JDCloudVideoTool工具类封装了截取gif动图所需的方法，  
getSnapShotSequence():获取指定视频指定时间段内的图片序列，  
recordVideo():录制视频的指定时间段内的视频，  
recordGif():根据视频和指定时间段，生成gif动图，  
注：指定时间段需要在视频总时长内。  
这三个方法均是静态方法，详细参数参考sdk说明文档。  

* **边播边缓存功能**  
边播边下缓存功能是在视频被成功播放后，文件会缓存到本地，再次播放视频时会直接使用本地缓存文件，不再请求网络   
新建缓存：  
JDCloudVideoCache  cache=new JDCloudVideoCache(cachePath);  
整个APP周期，缓存只能新建一次，可以采用单例模式。  
JDCloudVideoCache cache=DemoApplication.getCache(mContext)；  
播放视频时，在cache中获取播放地址：  
String proxyUrl = cache.getProxyUrl(videoURL);  
mJDCloudVideoView.setVideoPath(proxyUrl);  

* **日志**  
播放过程中状态发生改变，获取不同播放状态和播放信息作为日志。设置IMediaPlayer.OnInfoListener监听可以获取各种类型的消息，设置方式如下：  
mJDCloudVideoView.setOnInfoListener();  
