import 'package:flutter/material.dart';
import 'widget_alert_dialog.dart';
import 'package:odoo_flutter/widget_ordinary_listview.dart';
import 'package:odoo_flutter/widget_cut_line_listview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    final List itemList = new List();
    itemList.add('普通ListView');
    itemList.add('带有分割线ListView');
    return Scaffold(
      appBar: AppBar(title: Text('OdooFlutter')),
      body: Container(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int position) {
            return Padding(
              padding: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  _clickItem(_testData(), position);
                },
                child: Text(
                  itemList[position],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int position) {
            return new Container(
              height: 1.0,
              color: Colors.black12,
            );
          },
          itemCount: itemList.length,
        ),
      ),
    );

//
//    final List contentList = new List();
//    contentList.add('请勿删除!');
//    contentList.add('请勿删除!');
//    contentList.add('请勿删除!');
//
//    final List itemList = new List();
//    itemList.add('item1');
//    itemList.add('item2');
//    itemList.add('item3');
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            RaisedButton(
//              child: Text('显示AlertDialog'),
//              onPressed: () {
////                Navigator.push(
////                  context,
////                  new MaterialPageRoute(
////                      builder: (context) => new AlertDialogWidget(
////                          '警告!重要的话说三遍', contentList, '关闭')),
////                );
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) => new OrdinaryListView(
//                              '普通 ListView',
//                              itemList,
//                            )));
//              },
//            ),
//          ],
//        ),
//      ),
//    );
  }

  void _clickItem(List itemList, int position) {
    switch (position) {
      case 0:
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new OrdinaryListView(
                      '普通ListView',
                      itemList,
                    )));
        break;
      case 1:
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new CutLineListView(
                      '带有分割线ListView',
                      itemList,
                    )));
        break;
    }
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
}
