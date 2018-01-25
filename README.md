# DingTalkHelper
iOS版钉钉远程打卡插件 支持Wi-Fi和定位两种打卡模式

## Futures

- [x] 支持Wi-Fi和定位远程打卡
- [x] 连上考勤Wi-Fi或在考勤范围一键设置
- [x] 设置界面内嵌在钉钉设置中心，纯原生体验
- [x] 跟随钉钉更新，及时迭代更新

## ScreenShots

![image](https://github.com/kevll/DingTalkHelper/blob/master/screenshots/setting.PNG)

## How to install

- 越狱手机
1.  前往cydia市场，搜索 "DingTalkHelper" 进行安装 （推荐）
2.  clone到本地，手动 make package install

- 非越狱手机
1. 下载已打包好的ipa，使用[impactor](http://www.cydiaimpactor.com/)工具自行安装 （推荐）</br>
ipa百度网盘[下载链接](https://pan.baidu.com/s/1c39p11e)  密码: fhxh </br>
![image](https://github.com/kevll/WeChatRedEnvelopesHelper/blob/master/screenshots/stepone.gif)</br>
![image](https://github.com/kevll/WeChatRedEnvelopesHelper/blob/master/screenshots/steptwo.gif)</br>
2. 从XX助手上面下载越狱版ipa --> 解压缩 -->修改DingTalk二进制文件，绕过钉钉对客户端检测 --> 拷贝DingTalkHelper.dylib和libsubstate.dylib到Frameworks目录 --> 向DingTalk二进制文件注入dylib -> 更改 DingTalkHelper.dylib 依赖 --> 打包[重签名](https://github.com/kevll/resign)安装

## How to Setting
前往钉钉 “设置” —-> “钉钉小助手” —-> 开启助手并设置好保存</br>

## Hope

如果觉得有用，欢迎star</br>
如果使用发现问题，欢迎issue
