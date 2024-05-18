import 'package:bilibili_lite/services/http.dart';
import 'package:get/get.dart';

import 'package:bilibili_lite/services/cookies.dart';

class MinePageController extends GetxController {
  final http = HttpGetter();
  //RxBool isLogin = false.obs;

  RxString name = "请登录".obs;
  RxString face = "".obs;

  // 硬币数
  RxString money = "-".obs;
  // B币
  RxString bcoinBalance = "-".obs;

  // 动态数
  RxString dynamicCount = "-".obs;
  // 关注数
  RxString following = "-".obs;
  // 粉丝数
  RxString follower = "-".obs;

  @override
  void onInit() async {
    super.onInit();

    var interface = await http.interface();
    if (interface['status'] != 0) {
      // TODO
      // print Error message
      return;
    }
    //print(interface);

    name.value = interface['data']['uname'];
    face.value = interface['data']['face'];

    money.value = interface['data']['money'].toString();
    bcoinBalance.value =
        interface['data']['wallet']['bcoin_balance'].toString();

    dynamicCount.value = interface['subdata']['danamic_count'].toString();
    follower.value = interface['subdata']['follower'].toString();
    following.value = interface['subdata']['following'].toString();
  }

  Future initInterface() async {}

  void selfInfoCardOnTap() {
    // TODO 判断是否登录
    if (Cookies.loginStatus) {
      // TODO
      // goto and off 个人页面
      return;
    } //esle

    //web端登录页面
    Get.toNamed('/web', arguments: {
      'title': '登录',
      'url': 'https://passport.bilibili.com/h5-app/passport/login',
    });
  }
}
