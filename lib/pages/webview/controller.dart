import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

import 'package:bilibili_lite/services/cookies.dart';

class WebViewPageController extends GetxController {
  late final String title;
  late final String url;

  late final WebViewController webController;
  late final WebviewCookieManager cookieManager;

  @override
  void onInit() {
    super.onInit();

    title = Get.arguments['title'];
    url = Get.arguments['url'];

    cookieManager = WebviewCookieManager();

    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        //已登录
        onPageFinished: (url) async {
          print("onPageFinished: $url");
          if (url == "https://m.bilibili.com/") {
            final cookie =
                await cookieManager.getCookies('https://m.bilibili.com');
            var sessdata = cookie[3].toString().split(';').elementAt(0);
            var csrf = cookie[4].toString().split(';').elementAt(0);

            var box = await Hive.openBox("loginStatus");
            await box.put('sessdata', sessdata);
            await box.put('csrf', csrf);
            await box.close();

            print(sessdata);

            await Cookies.init();
            print("cookies init success");
            Get.back();
          }
        },
      ))
      ..loadRequest(Uri.parse(url));
  }

  void testCookie() async {
    print("cookie test");

    final gotCookies = await cookieManager.getCookies('https://m.bilibili.com');
    //for (var item in gotCookies) {
    //  print(item);
    //}
    print(gotCookies[3]);
    print(gotCookies[4].toString());
    print(gotCookies[5]);

    print("test cookie end");
  }

  void cleanCookie() async {
    print("clean cookie");
    await cookieManager.clearCookies();
  }
}
