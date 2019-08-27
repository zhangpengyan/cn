## 推流示例    

1.在布局文件中加入预览View, 当前支持GLSurfaceView和TextureView：  
```
<android.opengl.GLSurfaceView
            android:id="@+id/gl_live_push"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:layout_alignParentBottom="true"
            android:layout_alignParentTop="true" />
```

2.利用ButterKnife初始化预览View：  
```
    @BindView(R.id.gl_live_push)
GLSurfaceView mGLSurface;
``` 

3.创建JDCloudLive实例并配置推流相关参数：
```
JDCloudLive mStreamer = new JDCloudLive(this);
//设置推流url
mStreamer.setUrl(“rtmp://pu.jdcloud.com/android/ {streamName}”);
// 设置推流分辨率
mStreamer.setPreviewResolution(BaseConstants.VIDEO_RESOLUTION_360P);
mStreamer.setTargetResolution(BaseConstants.VIDEO_RESOLUTION_360P);
// 设置编码方式（硬编、软编）
mStreamer.setEncodeMethod(BaseConstants.ENCODE_METHOD_HARDWARE);
mStreamer.setVideoEncodeProfile(VideoEncodeFormat.ENCODE_PROFILE_HIGH_PERFORMANCE);
// 设置推流视频码率，三个参数分别为初始码率、最高码率、最低码率
int videoBitrate = 800;
mStreamer.setVideoKBitrate(videoBitrate * 3 / 4, videoBitrate, videoBitrate / 4);
// 设置屏幕的旋转角度
mStreamer.setRotateDegrees(0);
//设置开始预览使用前置还是后置摄像头
mStreamer.setCameraFacing(CameraCapture.FACING_FRONT);
// 设置预览View
mStreamer.setDisplayPreview(mGLSurface);
```
4.创建推流事件监听:  
Note：所有回调均运行在JDCloudLive的创建线程，建议在主线程中进行，开发者可以直接在回调中操作 JDCloudLive的相关接口，但不要在这些回调中做任何耗时的操作。  
```
// 设置Info回调，可以收到相关通知信息
mStreamer.setOnInfoListener(new JDCloudLive.OnInfoListener() {
            @Override
            public void onInfo(int i, int i1, int i2) {
                
            }
        });
// 设置错误回调，收到该回调后，一般是发生了严重错误，比如网络断开等，
// SDK内部会停止推流，APP可以在这里根据回调类型及需求添加重试逻辑。
mStreamer.setOnErrorListener(new JDCloudLive.OnErrorListener() {

            @Override
            public void onError(int i, int i1, int i2) {
                
            }
        });
```
5.开始推流：  
Note：初次开启预览后需要在OnInfoListener回调中收到 BaseConstants.LIVE_CAMERA_INIT_DONE 事件后调用方才有效。  
```
mStreamer.startPush();
```
6.推流开始前及推流过程中可动态设置的常用方法：
```
// 设置屏幕的旋转角度，支持 0, 90, 180, 270
mStreamer.setRotateDegrees(0);
//设置开始预览使用前置还是后置摄像头
mStreamer.setCameraFacing(CameraCapture.FACING_FRONT);
// 开关闪光灯，true为开启，false为关闭
mStreamer.toggleTorch(true);
// 设置美颜滤镜，关于美颜滤镜的具体说明请参见专题说明
ImgFilterBase beautyFilter = new ImgBeautyProFilter(mStreamer.getGLRender(), PushActivity.this, 3);
beautyFilter.setGrindRatio(beautyVal);
beautyFilter.setWhitenRatio(beautyVal);
beautyFilter.setRuddyRatio(2 * beautyVal - 1);
mStreamer.getImgTexFilterMgt().setFilter(filter);
```
7.停止推流：
```
mStreamer.stopPush();
```
8.Activity生命周期的回调处理：
```
public class PushActivity extends Activity {
    @Override
    public void onResume() {
        super.onResume();
mStreamer.onResume();
        mStreamer.stopImageCapture();
// 一般可以在onResume中开启摄像头预览
        mStreamer.startCameraPreview();
//如果onPause中切到了DummyAudio模块，可以在此恢复
        mStreamer.setUseDummyAudioCapture(false);
        }

    @Override
    public void onPause() {
        super.onPause();
        mStreamer.onPause();
        // 一般在这里停止摄像头采集
        mStreamer.stopCameraPreview();
// 如果希望App切后台后，停止录制主播端的声音，可以在此切换为
//DummyAudio采集，该模块会代替mic采集模块产生静音数据，同时释放占用的mic资源
        mStreamer.setUseDummyAudioCapture(true);
mStreamer.startImageCapture(mBgImagePath);
    }

    @Override
    public void onDestroy() {
        // 清理相关资源
        mStreamer.release();
super.onDestroy();
    }
```
## 更多接口

* **静音设置**  
```
mStreamer.setMuteAudio(true);//设置静音，false为非静音模式  
```
* **推流过程中截屏**
 ```
mStreamer.requestScreenShot(new GLRender.ScreenShotListener() {
    @Override
    public void onBitmapAvailable(Bitmap bitmap) {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss",
                Locale.getDefault());
        String path = Environment.getExternalStorageDirectory().getPath() +
                "/jdc_live_" + dateFormat.format(date) + ".jpg";
        CommonUtils.saveBitmap(bitmap, path);
        mUIHandler.obtainMessage(MSG_SHOW_IMAGE_TOAST, path).sendToTarget();
    }
});
```
* **录制推流中视频**  
直播过程中，点击本地录制，可以录制屏幕到本地，录制格式为 MP4  
```
mStreamer.startRecord(Environment.getExternalStorageDirectory().getPath()+"/jdc_live_record.mp4");//参数为输出路径
```
* **纯音频推流**  
直播场景是声音直播时，可以调用以下方法启动纯音频推流。  
```
mStreamer.setAudioOnly(true);
```
* **水印**  
直播视频可以支持打上水印，原理是在SDK内部进行视频编码前把水印图片加上。水印类型支持图片、文字、时间等设置。
```
mStreamer.showWaterMarkLogo(bitmap, x, y, w, h, alphaVal);//图片
mStreamer.showWaterMarkLogo(path, x, y, w, h, alphaVal);//指定图片的位置
mStreamer.showWaterMarkTime(x, y, w,colorVal, alphaVal);//时间
mStreamer.showWaterMarkText(text, y, w, mWaterMarkColorVal, mWaterMarkAlphaVal);//文字
```
* **音频调用**  
在直播时可以设置自己喜欢的本地音乐加入直播中
```
mStreamer.getAudioPlayerCapture().setVolume(0.4f);//设置音量
mStreamer.setEnableAudioMix(true);
String audioPath = "file://" + Environment.getExternalStorageDirectory().getPath() + "/jdc_audio/" + titleView.getText().toString() + ".mp3";
mStreamer.startBgm(audioPath, true);// audioPath为本地音乐的url
```
* **音频升降调**  
升降调是主播唱歌时伴奏的特效处理，即从低沉到高亢的一个过程，更适用于较专业的唱歌直播，我们可以支持7[-3~3]个等级，负数为降调，正数为声调，0为原始声调。
```
AudioEffectFilter audioEffect = new AudioEffectFilter(
                        AudioEffectFilter.AUDIO_EFFECT_TYPE_PITCH);
audioEffect.setPitchLevel(mVoiceRiseFallLevel);
               mStreamer.getAudioPlayerCapture().getAudioFilterMgt().setFilter(audioEffect);
```
* **耳返**  
指的是当主播带上耳机来唱歌时，耳机中要能实时反馈主播的声音，这是由于主播自己的声音是通过头部骨骼（固体）传入耳朵，而观众听到声音最终是通过空气介质传入耳朵，这两种方式听的声音是有很大差异的，因此主播有需求直接听到观众端的效果。
如下打开耳返：   
```
mStreamer.setEnableAudioPreview(true);
```
* **旋转锁定**  
屏幕未锁定时候，旋转手机直播画面旋转，推流也要调用下面的方法进行旋转相应的角度。
```
mStreamer.setRotateDegrees(rotation);
```
* **自动对焦**  
手动点击屏幕，会根据手指聚焦的坐标进行自动对焦。
```
CameraTouchHelper cameraTouchHelper = new CameraTouchHelper();
cameraTouchHelper.setCameraCapture(mStreamer.getCameraCapture());
mGLSurface.setOnTouchListener(cameraTouchHelper);
cameraTouchHelper.setCameraHintView(mCameraHintView);// mCameraHintView为焦点上显示的view
```
* **音频降噪**  
在直播过程中，可以对周边噪音进行处理,以保证主播的声音更加清晰。
```
mStreamer.setEnableAudioNS(true);//打开音频降噪
```
* **镜像推流**  
镜像实际上直播端自己看自己永远是正的，切换的时候自己的镜头不动，但是观众的镜头看着是反转的。打开方式如下：
```
mStreamer.setFrontCameraMirror(on);
```
* **变声**  
变声，将主播声音变为搞怪的特效处理，能够增强互动时的趣味性，可支持大叔、萝莉、庄重、机器人等 效果.四种变声效果分别用：
```
AudioEffectFilter.AUDIO_EFFECT_TYPE_MALE
AudioEffectFilter.AUDIO_EFFECT_TYPE_FEMALE
AudioEffectFilter.AUDIO_EFFECT_TYPE_HEROIC
AudioEffectFilter.AUDIO_EFFECT_TYPE_ROBOT
四个参数控制，设置方式如下：
List<AudioFilterBase> filters = new LinkedList<>();
AudioEffectFilter audioEffect = new AudioEffectFilter(
                        AudioEffectFilter.AUDIO_EFFECT_TYPE_HEROIC);
filters.add(audioEffect);
mStreamer.getAudioFilterMgt().setFilter(filters);
```
* **美颜**  
美颜级别为0-5级，等级越高，美颜效果约明显。设置如下：
```
ImgFilterBase beautyFilter = new ImgBeautyProFilter(mStreamer.getGLRender(), PushActivity.this, 3);
beautyFilter.setGrindRatio(beautyVal);// beautyVal取值[o,1]
beautyFilter.setWhitenRatio(beautyVal);
beautyFilter.setRuddyRatio(2 * beautyVal - 1);
mStreamer.getImgTexFilterMgt().setFilter(filter);  
```
* **滤镜**  
滤镜模式有：清新，日光，风景，人物，日系，HDR几种选择。
```
通过ImgFilterBase filter = new ImgBeautySpecialEffectsFilter(mStreamer.getGLRender(),
                        PushActivity.this, filterIndex - 15);
mStreamer.getImgTexFilterMgt().setFilter(filter);
```
* **混音**  
推流过程中支持背景混音，支持背景音乐和麦克风的音轨混合，同时可以对其音量进行适当调节。
```
//设置背景音量输入比例
mStreamer.getMixerFilter().setInputVolume(0, volumeF); //volumeF取值[0,1]，为浮点型数据。
//设置麦克风音量输入比例
mStreamer.getMixerFilter().setInputVolume(1, volumeF); //volumeF取值[0,1]，为浮点型数据。
```
* **画中画推流**   
底层图片+视频画面+自定义位置
画中画是一种视频内容呈现方式,支持底层图片叠加视频画面，且支持自定义位置。在一部视频全屏播出的同时，于画面的小面积区域上同时播出另一部视频。
如可构造了3个图层叠加的示例:
最底层为背景图片
中间为本地视频播放画面
最上层为摄像头拍摄的画面
实例化JDCloudPIPLive  类，可以显示画中画推流：
```
JDCloudPIPLive  mStreamer = new JDCloudPIPLive(this);
((JDCloudPIPLive) mStreamer).showBgPicture(this, mPIPPicPath);//设置播放背景图
((JDCloudPIPLive) mStreamer).showBgVideo(mPIPVideoPath);//设置播放视频
((JDCloudPIPLive)mStreamer).getMediaPlayerCapture().getMediaPlayer().setVolume(0.4f, 0.4f);
((JDCloudPIPLive) mStreamer).setCameraPreviewRect(0.65f, 0.f, 0.35f, 0.3f);//设置推流视频位置
```
开始推流  
```
((JDCloudPIPLive) mStreamer).getMediaPlayerCapture().getMediaPlayer().start();
((JDCloudPIPLive) mStreamer).getPictureCapture().start(this, mPIPPicPath);
```
暂停推流
```
mStreamer.onPause();
((JDCloudPIPLive) mStreamer).getMediaPlayerCapture().getMediaPlayer().pause();
((JDCloudPIPLive) mStreamer).getPictureCapture().stop();
```
停止推流代码如下  
```
mStreamer.stopPush();
mStreamer.hideBgPicture();//隐藏背景图
mStreamer.hideBgVideo();//隐藏视频
mStreamer.setCameraPreviewRect(0.f, 0.f, 1.f, 1.f);
```
* **画笔推流**  
在直播过程中，主播使用画笔画出任意文字、图形等，通过与摄像头画面合成后，再一起推送给观众端，主播端在页面上涂鸦，观众看到的就是带涂鸦的画面。涂鸦内容于主播画面已经完成了叠加，无需其他传输渠道。无论移动端、flash等播放器，看到的涂鸦画面完全一致。  

ViewCapture显示画笔推流，首先需要初始化：  
```
ViewCapture mPaintViewCapture = new ViewCapture(mStreamer.getGLRender());//利用GLRender实例化ViewCapture。

// 连接图像混合器

mPaintViewCapture.getSrcPin().connect(mStreamer.getImgTexMixer().getSinkPin(PAINT_VIEW_IDX));//

// 设置参数显示PaintView，详细参数说明参照API说明文档

mStreamer.showPaintView(PAINT_VIEW_IDX, 0, 0, 1, 1, 1);
```
开始画笔推流：    
```
mPaintViewCapture.setTargetResolution(mStreamer.getTargetWidth(),mStreamer.getTargetHeight());//设置分辨率

mPaintViewCapture.setUpdateFps(mStreamer.getTargetFps());//设置帧率

mPaintViewCapture.start(mPaintView);//为ViewCapture设置view
```
结束画笔推流：  
```
mPaintViewCapture.stop();7.2.画笔推流
```  
