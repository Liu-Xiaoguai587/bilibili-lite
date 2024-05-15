import 'package:get/get.dart';

class MinePageController extends GetxController {
  void selfInfoCardOnTap() {
    // TODO 判断是否登录
    // 登录 goto 个人信息页 否则进入登录页面
    //print("on tap ");
    //Get.toNamed("/login");

    //web端登录页面
    Get.toNamed('/web', arguments: {
      'title': '登录',
      'url': 'https://passport.bilibili.com/h5-app/passport/login',
    });
  }
}
