import 'package:bilibili_lite/pages/login/view.dart';
import 'package:get/get.dart';

//import './home/view.dart';
import './navigation/view.dart';
import './webview/view.dart';
import './setting/view.dart';

class Routs {
  static final List<GetPage<dynamic>> getPage = [
    //主页 包含 首页 动态 我的页面
    GetPage(name: '/', page: () => const Navigation()),
    //注册界面
    GetPage(name: '/login', page: () => const LoginPage()),
    //网页浏览器
    GetPage(name: '/web', page: () => const WebViewPage()),
    //设置页面
    GetPage(name: '/setting', page: () => SettingPage()),
  ];
}

//  start -> page:Navigation -┬-> page:Home -┬-> page:recommendTab
//                            │              ├-> page:liveTab
//                            │              └-> page:hotTab
//                            ├-> page:dynamic
//                            └-> page:mine
//