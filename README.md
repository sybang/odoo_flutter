# odoo_flutter

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 高德地图各平台配置

Android:AndroidManifest.xml文件配置高德key 
<meta-data
            android:name="com.amap.api.v2.apikey"
            android:value="43cd85ea4cce52379234cad539366758"/>
            
            
IOS:如果出现闪退或者地图加载不出来请检查权限文件 info.list 是否缺少
<key>io.flutter.embedded_views_preview</key>
    	<string>YES</string>
    	<key>NSLocationWhenInUseUsageDescription</key>
    	<string>需要定位权限</string> 这两个权限
    	
    	
 高德开发者账号 18192833867 android5611623
 融云开发者账号 18192833867 melaka89546  	     
 极光开发者账号 417802597@qq.com android5611623
 极光推送Android真机运行报错 请添加对应平台的so库  ios平台暂未适配 缺少开发者账号
 ndk {
           //选择要添加的对应 cpu 类型的 .so 库。消息推送需要用到 根据情况选择
           abiFilters 'armeabi', 'armeabi-v7a' //'x86', 'x86_64', 'mips', 'mips64','arm64-v8a',
       }       