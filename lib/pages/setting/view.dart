import 'package:bilibili_lite/models/simple_widget.dart';
import 'package:bilibili_lite/pages/setting/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: simpleText("设置", size: 17),
      ),
      backgroundColor: const Color(0xf1f2f6FF),
      body: ListView(
        children: [
          const Divider(
            indent: double.infinity,
            endIndent: double.infinity,
          ),
          Container(
            color: const Color(0xFFFFFFFF),
            child: Center(
              child: TextButton(
                onPressed: controller.logout,
                child: simpleText("退出登录", size: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
