import 'package:get/get.dart';

class MinePageController extends GetxController {
  void selfInfoCardOnTap() {
    // TODO 判断是否登录
    // 登录 goto 个人信息页 否则进入登录页面
    print("on tap ");
    Get.toNamed("/login");
  }
}
