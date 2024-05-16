import 'package:hive/hive.dart';

class Cookies {
  static String? sessdata;
  // bili_jct
  static String? csrf;
  static late bool _isLogin;
  static bool get loginStatus => _isLogin;

  static Future init() async {
    var box = await Hive.openBox("loginStatus");
    sessdata = box.get("sessdata");
    csrf = box.get("csrf");
    await box.close();

    if (sessdata != null && csrf != null) {
      _isLogin = true;
    } else {
      _isLogin = false;
    }
  }

  static void clearCookie() async {
    var box = await Hive.openBox("loginStatus");
    await box.clear();

    _isLogin = false;
    sessdata = null;
    csrf = null;
  }
}
