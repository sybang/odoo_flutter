import 'package:flutter/material.dart';

//普通 ListView
class OrdinaryListView extends StatelessWidget {
  final String titleStr;
  final List itemList;

  OrdinaryListView(this.titleStr, this.itemList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(titleStr),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
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
        itemCount: itemList.length,
      ),
    );
  }
}
