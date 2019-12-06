import 'package:flutter/material.dart';
import 'package:odoo_flutter/picture_load_widget.dart';
import 'package:odoo_flutter/rongyunim/other/home_page.dart';
import 'package:odoo_flutter/rongyunim/router.dart';
import 'package:odoo_flutter/widget_ordinary_listview.dart';
import 'package:odoo_flutter/widget_cut_line_listview.dart';
import 'dialog_widget.dart';
import 'boxdecoration_widget.dart';
import 'input_widget.dart';
import 'listview_refresh_load.dart';
import 'ali_map.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'rongyunim/other/home_page.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'calendar.dart';
import 'file_storage.dart';
import 'widget_pay.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //flutter生命周期初始化方法 只走一次
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }
  JPush jpush;
  //三方平台初始化
  Future<void> initPlatformState() async {
    //高德地图ios Key
    await AmapService.init('9159ee4c544ab98adb518870d6a63d3e');
    //JPush初始化
    jpush= new JPush();
    jpush.getRegistrationID().then((rid) {
      print('---->rid:${rid}');
    });
    jpush.setup(
        appKey: "d62ba7a457125500086f6860",
        channel: 'developer-default',
        production: false,
        debug: true);
    jpush.applyPushAuthority(
        NotificationSettingsIOS(sound: true, alert: true, badge: true));
    try {
      jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter 接收到推送: $message");
      }, onOpenNotification: (Map<String, dynamic> message) async {
        print("点击通知栏: $message");
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("收到自定义消息: $message");
      });
    } on Exception {
      print("---->获取平台版本失败");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OdooFlutter')),
      body: Container(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int position) {
            return Padding(
              padding: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  _clickItem(context, _testData(), position);
                },
                child: Text(
                  _homeData()[position],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int position) {
            if (position == 2) {
              return new Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          renderCircular(),
                          renderCircularNoun(),
                          renderChangeGradually(),
                          renderShadow(),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    renderSearch(context),
                    Container(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          renderCircularPicture(),
                          renderPicture(),
                          renderCircularNounPicture(),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                  ],
                ),
              );
            } else {
              return new Container(
                height: 1.0,
                color: Colors.black12,
              );
            }
          },
          itemCount: _homeData().length,
        ),
      ),
    );
  }

  void _clickItem(BuildContext context, List itemList, int position) {
    switch (position) {
      case 0:
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new OrdinaryListView(
                      _homeData()[0],
                      itemList,
                    )));
        break;
      case 1:
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new CutLineListView(
                      _homeData()[1],
                      itemList,
                    )));
        break;
      case 2:
        showAlertDialog(context, _homeData()[2], _testData(), '关闭');
        break;
      case 3:
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                    new ListViewRefreshLoad(_homeData()[3], itemList)));
        break;
      case 4:
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new AliMap(_homeData()[4])));
        break;
      case 5:
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new RongYunHomePage()));
        break;
      case 6:
        var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch+3000);
        var localNotification = LocalNotification(
            id: 234,
            title: '测试本地推送',
            buildId: 1,
            content: '我是本地推送的消息',
            fireTime: fireDate,
            subtitle: 'ios 消息推送', // 该参数只有在 iOS 有效
            badge: 5, // 该参数只有在 iOS 有效
            extra: {"fa": "0"} // 设置 extras ，extras 需要是 Map<String, String>
        );
        jpush.sendLocalNotification(localNotification).then((res) {
          print("flutter 接收到推送: $res");
        });
        break;
      case 7:
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new MultiSelectStylePage( title: _homeData()[7]+'多选')));
        break;
      case 8:
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new FileStoragePage( titleStr: _homeData()[8])));
        break;
      case 9:
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new PayPage( titleStr: _homeData()[9])));
        break;
    }
  }
}

List _homeData() {
  List itemList = new List();
  itemList.add('普通ListView');
  itemList.add('带有分割线ListView');
  itemList.add('AlertDialog弹出框');
  itemList.add('ListView下拉刷新上拉加载');
  itemList.add('高德地图amap_map_fluttify');
  itemList.add('融云即时通讯');
  itemList.add('极光推送本地消息测试(服务器推送需到极光后台模拟推送)');
  itemList.add('日历组件');
  itemList.add('文件存储');
  itemList.add('支付');
  return itemList;
}

List _testData() {
  List listData = new List();
  listData.add('item1');
  listData.add('item2');
  listData.add('item3');
  listData.add('item4');
  listData.add('item5');
  listData.add('item6');

  return listData;
}
