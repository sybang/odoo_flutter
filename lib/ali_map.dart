import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class AliMap extends StatelessWidget {
  AmapController _controller;
  final String titleStr;

  AliMap(this.titleStr);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(titleStr),
        centerTitle: true,
      ),
      body: AmapView(
        onMapCreated: (controller) async {
          _controller = controller;
          if (await requestPermission()) {
            await controller.showMyLocation(true);
          }
        },
      ),
    );
  }
}
Future<bool> requestPermission() async {
  final permissions =
  await PermissionHandler().requestPermissions([PermissionGroup.location]);

  if (permissions[PermissionGroup.location] == PermissionStatus.granted) {
    return true;
  } else {
    toast('需要定位权限!');
    return false;
  }
}
