import 'dart:io';

import 'package:bilibili_lite/services/cookies.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  void logout() {
    Cookies.clearCookie();
  }
}
