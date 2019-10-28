import 'package:flutter/material.dart';

Widget renderSearch(BuildContext context) {
  return Container(
    height: 45,
    margin: EdgeInsets.all(15),
    alignment: Alignment.center,
    child: TextField(
      maxLines: 1,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
      cursorColor: Colors.redAccent,
      cursorWidth: 2,
//                        cursorRadius: Radius.elliptical(2, 8),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: '请输入关键字',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        suffixIcon: new IconButton(
          icon: new Icon(Icons.search, color: Colors.black45),
          onPressed: () {
            final snackBar = new SnackBar(
              content: new Text(
                '请检查网络!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.redAccent,
              duration: Duration(seconds: 1),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    ),
  );
}
