import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'controller.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final controller = Get.put(WebViewPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
        actions: [
          IconButton(onPressed: controller.testCookie, icon: Icon(Icons.work)),
          IconButton(
              onPressed: controller.cleanCookie, icon: Icon(Icons.clean_hands)),
        ],
      ),
      body: WebViewWidget(
        controller: controller.webController,
      ),
    );
  }
}
