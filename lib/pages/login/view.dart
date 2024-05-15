import 'dart:ffi';

import 'package:bilibili_lite/models/simple_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        centerTitle: true,
        title: simpleText("密码登录", isBold: true, size: 18),
        actions: [
          TextButton(
            onPressed: () {},
            child: simpleText("短信登录", color: Colors.grey, size: 13),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Divider(color: Color(0xFFFFFFFF)),
          customTextField(text: "账号", hint: "请输入手机号或邮箱"),
        ],
      ),
    );
  }

  Widget customTextField({
    required String text,
    String? hint,
    bool isPassword = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: simpleText(text, size: 15),
        ),
        const VerticalDivider(),
        Expanded(
            flex: 4,
            child: TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hint),
            )),
      ]),
    );
  }
}
