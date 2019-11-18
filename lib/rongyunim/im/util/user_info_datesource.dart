import 'dart:math';

class UserInfo {
  String userId;
  String name;
  String portraitUrl;
}

//用户信息，用户信息需要开发者自行处理（从 APP 服务获取用户信息并保存），此处只做了最简单的处理
class UserInfoDataSource {
  static Map<String, UserInfo> cachedUserMap = new Map(); //保证同一 userId

  static UserInfo getUserInfo(String userId) {
    int index = -1;
    if (userId == 'SealTalk') {
      index = 0;
    } else if (userId == 'RongRTC') {
      index = 1;
    } else if (userId == 'RongIM') {
      index = 2;
    } else if (userId == 'RongAndroid') {
      index = 3;
    } else if (userId == 'RongIOS') {
      index = 4;
    } else {
      index = 5;
    }
    UserInfo cachedUserInfo = cachedUserMap[userId];
    if (cachedUserInfo != null) {
      return cachedUserInfo;
    }

    List names = _getCachedNameList();
    List urls = _getCachedPortraitList();

    UserInfo user = new UserInfo();
    user.userId = userId;
//    user.name = names[Random().nextInt(names.length)];
//    user.portraitUrl = urls[Random().nextInt(urls.length)];
    user.name = names[index];
    user.portraitUrl = urls[index];

    cachedUserMap[userId] = user;
    return user;
  }

  static List _getCachedNameList() {
    List names = ["刘玄德", "关云长", "张翼德", "赵子龙", "马孟起", "曹操"];
    return names;
  }

  static List _getCachedPortraitList() {
    List urls = [
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573538816145&di=d3a5f772f0755176ae18c629677ceccf&imgtype=0&src=http%3A%2F%2Fsg.wanmei.com%2Fresources%2Fjpg%2F100510%2F10031273462194087.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573538867108&di=636386c18a752bf897d5e648cf4cf4c8&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Ffront%2F198%2Fw1154h644%2F20190102%2FSKlN-hqzxptn7528064.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573538912761&di=3d4a203ff099ea69ee186ca4961107ca&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D927072615%2C2414330373%26fm%3D214%26gp%3D0.jpg",
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573538947597&di=108651f7ec85f6ba48da30b4744b60b4&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn09%2F688%2Fw960h528%2F20180730%2F68ef-hfxsxzh8517759.jpg",
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573539174489&di=879f84a3f55cc52d810cd4d7df1b57d2&imgtype=0&src=http%3A%2F%2Fwenwen.soso.com%2Fp%2F20100603%2F20100603041503-1935798623.jpg',
      'http://n.sinaimg.cn/sinacn00/370/w640h530/20180910/68dd-hivtsyk7826752.jpg'
    ];
    return urls;
  }
}
