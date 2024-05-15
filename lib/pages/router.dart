import 'package:bilibili_lite/pages/login/view.dart';
import 'package:get/get.dart';

//import './home/view.dart';
import './navigation/view.dart';
import './webview/view.dart';

class Routs {
  static final List<GetPage<dynamic>> getPage = [
    GetPage(name: '/', page: () => const Navigation()),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      transition: Transition.native,
    ),
    GetPage(name: '/web', page: () => const WebViewPage()),
  ];
}

//  start -> page:Navigation -┬-> page:Home -┬-> page:recommendTab
//                            │              ├-> page:liveTab
//                            │              └-> page:hotTab
//                            ├-> page:dynamic
//                            └-> page:mine
//