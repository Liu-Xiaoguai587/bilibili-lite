import 'package:bilibili_lite/pages/login/view.dart';
import 'package:get/get.dart';

//import './home/view.dart';
import './navigation/view.dart';

class Routs {
  static final List<GetPage<dynamic>> getPage = [
    GetPage(name: '/', page: () => const Navigation()),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      transition: Transition.native,
    ),
  ];
}

//  start -> page:Navigation -┬-> page:Home -┬-> page:recommendTab
//                            │              ├-> page:liveTab
//                            │              └-> page:hotTab
//                            ├-> page:dynamic
//                            └-> page:mine
//