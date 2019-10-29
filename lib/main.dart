import 'package:flutter/material.dart';
import 'package:odoo_flutter/picture_load_widget.dart';
import 'package:odoo_flutter/widget_ordinary_listview.dart';
import 'package:odoo_flutter/widget_cut_line_listview.dart';
import 'dialog_widget.dart';
import 'boxdecoration_widget.dart';
import 'input_widget.dart';
import 'listview_refresh_load.dart';

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
    }
  }
}

List _homeData() {
  List itemList = new List();
  itemList.add('普通ListView');
  itemList.add('带有分割线ListView');
  itemList.add('AlertDialog弹出框');
  itemList.add('ListView下拉刷新上拉加载');
  itemList.add('GridView');
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
