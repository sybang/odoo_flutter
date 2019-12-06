import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';

//七牛云
import 'package:image_picker/image_picker.dart';
import 'package:sy_flutter_qiniu_storage/sy_flutter_qiniu_storage.dart';
//getTemporaryDirectory()
//
//获取临时目录
//
//getApplicationDocumentsDirectory()
//
//获取应用文档目录
//
//getExternalStorageDirectory()
//
//获取外部存储目录

//其中getExternalStorageDirectory()方法中代码有平台类型的判断：IOS平台没有外部存储

//Future<Directory> getExternalStorageDirectory() async {
//  if (Platform.isIOS) //如果是iOS平台则抛出不支持的错误
//    throw new UnsupportedError("Functionality not available on iOS");
//  final String path = await _channel.invokeMethod('getStorageDirectory');
//  if (path == null) {
//    return null;
//  }
//  return new Directory(path);
//}
class FileStoragePage extends StatefulWidget {

  final String titleStr;

  const FileStoragePage({Key key, this.titleStr}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FileStoragePageState();
  }

}

class FileStoragePageState extends State<FileStoragePage>{
  double _process = 0.0;
  String result = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleStr),
        centerTitle: true,
      ),
      body: SafeArea(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                _writeFile(context, "我劝天公重抖擞，天公对我大声吼");
              },
              child: Text('获取当前应用目录并写入数据(本地)'),
            ),
            new RaisedButton(
              onPressed: () {
                _getNotesFromCache();
              },
              child: Text('读取写入的数据并显示(本地)'),
            ),
            new Text(result),

            Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  LinearProgressIndicator(
                    value: _process,
                  ),
                  RaisedButton(
                    child: Text('上传(使用别人的Token谨慎操作)'),
                    onPressed: _onUpload,
                  ),
                  RaisedButton(
                    child: Text('取消上传'),
                    onPressed: _onCancel,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void _writeFile(BuildContext context, String notes) async {
    // 获取应用文档目录并创建文件
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;

    File file = new File('$documentsPath/notes');
    if (!file.existsSync()) {
      file.createSync();
    }
    _writeToFile(context, file, notes);
  }

//将数据内容写入指定文件中
  void _writeToFile(BuildContext context, File file, String notes) async {
    File file1 = await file.writeAsString(notes);
    if (file1.existsSync()) {
      Toast.show('保存成功', context);
    }
  }

  void _getNotesFromCache() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;

    File file = new File('$documentsPath/notes');
    if (!file.existsSync()) {
      return;
    }
    String notes = await file.readAsString();
    //读取到数据后设置数据更新UI
    setState(() {
      result=notes;
    });
  }

  //七牛云上传
  _onUpload() async {
    //token 需要用accessKey/secretKey生成

    String token = 'qhApHZzTRglz0RRCUgUu4Qn3JDhVe552aw2E9-IH:SwCR3OBanDKfNRIH7vsao4xg2Vw=:eyJkZWFkbGluZSI6MzUzOTcyMzQxNSwic2NvcGUiOiJtcC1yZXNvdXJjZSJ9';
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }
    final syStorage = new SyFlutterQiniuStorage();
    //监听上传进度
    syStorage.onChanged().listen((dynamic percent) {
      double p = percent;
      setState(() {
        _process = p;
      });
      print(percent);
    });

    String key = DateTime.now().millisecondsSinceEpoch.toString() +
        '.' +
        file.path.split('.').last;
    //上传文件
    bool result = await syStorage.upload(file.path, token, key);
    print(result);//true 上传成功，false失败


  }

  //取消上传
  _onCancel() {
    SyFlutterQiniuStorage.cancelUpload();
  }
}


