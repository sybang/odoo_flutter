
import 'package:flutter/material.dart';


//AlertDialog 操作提示框

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final List contentList;
  final String flatButtonText;

  AlertDialogWidget(this.title, this.contentList, this.flatButtonText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      padding: EdgeInsets.all(10),
      child: Text(
        '显示 AlertDialog',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      color: Theme.of(context).accentColor,
      elevation: 4,
      splashColor: Colors.blueAccent,
      onPressed: () {
        showAlertDialog(context);
      },
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            //防止内容溢出尽量使用SingleChildScrollView避免使用ListView,GridView
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  buildItem(contentList)
                  //new Text(contentList[0])
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  flatButtonText,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

Widget buildItem(List contentList) {
  List<Widget> items = []; //先建一个数组用于存放循环生成的widget
  Widget content; //单独一个widget组件，用于返回需要生成的内容widget
  for (var item in contentList) {
    items.add(new Row(children: <Widget>[new Text(item)]));
  }
  content =
      new Column(children: items //重点在这里，因为用编辑器写Row生成的children后面会跟一个<Widget>[]，
          //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
          );
  return content;
}
