import 'package:bilibili_lite/pages/DEBUG.dart';
import 'package:bilibili_lite/services/http.dart';
import 'package:get/get.dart';

import 'package:bilibili_lite/services/cookies.dart';

class MinePageController extends GetxController {
  final http = HttpGetter();
  //RxBool isLogin = false.obs;

  RxString? name = ''.obs;
  RxString? face = ''.obs;

  // 硬币数
  RxInt? money = 0.obs;
  // B币
  RxInt? bcoinBalance = 0.obs;

  // 动态数
  RxInt? dynamicCount = 0.obs;
  // 关注数
  RxInt? following = 0.obs;
  // 粉丝数
  RxInt? follower = 0.obs;

  @override
  void onInit() async {
    super.onInit();

    var interface = await http.interface();
    if (interface['status'] != 0) {
      // TODO
      // print Error message
      return;
    }
    print(interface);

    name?.value = interface['data']['uname'];
    print(interface['data']['uname']);
    print(name);
    face?.value = interface['data']['face'];
    money?.value = interface['data']['money'];
    bcoinBalance?.value = interface['data']['wallet']['bcoin_balance'];

    dynamicCount?.value = interface['subdata']['danamic_count'];
    follower?.value = interface['subdata']['follower'];
    following?.value = interface['subdata']['following'];
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
