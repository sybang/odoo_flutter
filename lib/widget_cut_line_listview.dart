import 'package:flutter/material.dart';

//带有分割线 ListView
class CutLineListView extends StatelessWidget {
  final String titleStr;
  final List itemList;

  CutLineListView(this.titleStr, this.itemList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(titleStr),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int position) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              itemList[position],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int position) {
          return Container(
            margin: EdgeInsets.all(10),
            height: 1.0,
            color: Colors.black26,
          );
        },
        itemCount: itemList.length,
      ),
    );
  }
}
