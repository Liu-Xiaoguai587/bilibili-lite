import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

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
        onPageFinished: (url) {
          print("onPageFinished: $url");
          if (url == "https://m.bilibili.com/") {
            print("登录成功");
          }
        },
      ))
      ..loadRequest(Uri.parse(url));
  }

  void testCookie() async {
    print("cookie test");

    final gotCookies = await cookieManager.getCookies('https://m.bilibili.com');
    for (var item in gotCookies) {
      print(item);
    }

    print("test cookie end");
  }

  void cleanCookie() async {
    print("clean cookie");
    await cookieManager.clearCookies();
  }
}
