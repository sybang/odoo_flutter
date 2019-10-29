import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class ListViewRefreshLoad extends StatefulWidget {
  String titleStr;
  final List itemList;

  ListViewRefreshLoad(this.titleStr, this.itemList);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewRefreshLoadState(itemList, titleStr);
  }
}

class ListViewRefreshLoadState extends State<ListViewRefreshLoad> {
  final List itemList;
  final String titleStr;

  //下拉刷新
  ListViewRefreshLoadState(this.itemList, this.titleStr);


  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Toast.show('当前已是最新数据', context);
    });
  }

  //上拉加载
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.scrollController.addListener(() {
      print(scrollController.offset);
      if (!this.isLoading &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
        setState(() {
          this.isLoading = true;
          this.loadMoreData();
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.scrollController.dispose();
  }

  Future loadMoreData() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        this.isLoading = false;
        this.itemList.add('加载更多item1');
        this.itemList.add('加载更多item2');
        this.itemList.add('加载更多item3');
        this.itemList.add('加载更多item4');
        this.itemList.add('加载更多item5');
      });
    });
  }

  Widget renderBottom() {
    if (this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    itemList.add('item7');
    itemList.add('item8');
    itemList.add('item9');
    itemList.add('item10');
    itemList.add('item11');
    itemList.add('item12');
    return Scaffold(
      appBar: AppBar(
        title: Text(titleStr),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.separated(
          controller: this.scrollController,
          itemCount: itemList.length+1,
          separatorBuilder: (context, position) {
            return Divider(
              height: 1.0,
              color: Colors.black54,
            );
          },
          itemBuilder: (context, position) {
            if (position < this.itemList.length) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  itemList[position],
                  style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              );
            } else {
              return this.renderBottom();
            }
          },
        ),
      ),
    );
  }
}
