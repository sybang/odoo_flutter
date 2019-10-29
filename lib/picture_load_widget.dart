import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final String path =
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1570615665196&di=f7bd76a434195a32d35b79c550234bf5&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fq_70%2Cc_zoom%2Cw_640%2Fimages%2F20190507%2F3063caef79e049a994af6a0aef0ed6f8.jpeg';

//圆形图片(网络加载)
Widget renderCircularPicture() {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xFFCCCCCC),
          backgroundImage: NetworkImage(path,),
        ),
        new Padding(padding: EdgeInsets.only(top: 5)),
        Text(
          '圆形(网络加载)',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

//普通图片(网络加载)
Widget renderPicture() {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        Image.network(
          path,
          fit: BoxFit.cover, //图片填充方式
          width: 80,
          height: 80,
        ),
        new Padding(padding: EdgeInsets.only(top: 5)),
        Text(
          '普通(网络加载)',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

//圆角图片(本地加载)
Widget renderCircularNounPicture() {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('assets/pics/timg.jpeg', width: 80, height: 80,fit: BoxFit.cover,),
        ),
        new Padding(padding: EdgeInsets.only(top: 5)),
        Text(
          '圆角(本地加载)',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
