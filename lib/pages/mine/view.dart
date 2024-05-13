// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';

import 'package:bilibili_lite/models/user_status.dart';
import 'package:bilibili_lite/models/simple_widget.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/mine/dark_mode.png",
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //个人信息卡
          Stack(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: _selfInfoCard(),
            ),
            Align(
              alignment: Alignment.centerRight,
              // child: simpleText("空间  〉", color: Colors.grey, size: 20),
              child: TextButton(
                onPressed: () {},
                child: simpleText("空间  〉", color: Colors.grey),
              ),
            )
          ]),
          // 动态&关注&粉丝 数量
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 30),
            child: _infoDFFQuantities(dynamic: 129, follow: 566, fans: 300),
          ),
          //一些组件: 缓存 历史记录 收藏 稍后再看
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconWithTextV(
                icon: Image.asset(
                  "assets/icons/mine/download.png",
                  width: 30,
                  height: 30,
                ),
                text: simpleText("离线缓存", size: 12, color: Colors.grey.shade800),
              ),
              iconWithTextV(
                icon: Image.asset(
                  "assets/icons/mine/history.png",
                  width: 30,
                  height: 30,
                ),
                text: simpleText("历史记录", size: 12, color: Colors.grey.shade800),
              ),
              iconWithTextV(
                icon: Image.asset(
                  "assets/icons/mine/favorite.png",
                  width: 30,
                  height: 30,
                ),
                text: simpleText("我的收藏", size: 12, color: Colors.grey.shade800),
              ),
              iconWithTextV(
                //icon: Image.asset("assets/icons/later.png"),
                icon: Image.asset(
                  "assets/icons/mine/later.png",
                  width: 30,
                  height: 30,
                ),
                text: simpleText("稍后再看", size: 12, color: Colors.grey.shade800),
              ),
            ],
          ),
          // 更多服务
          const Divider(height: 20, color: Color(0xFFFFFFFF)),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: simpleText("更多服务", size: 17, isBold: true),
          ),
          // 更多服务下的选项
          const Divider(height: 20, color: Color(0xFFFFFFFF)),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(children: [
              iconWithTextH(
                icon: Image.asset(
                  "assets/icons/mine/setting.png",
                  width: 20,
                  height: 20,
                ),
                text: const Text("设置"),
                divide: 20,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _infoDFFQuantities({
    required int dynamic,
    required int follow,
    required int fans,
  }) {
    // 别问为什么这样写,单纯觉得这样写比较牛逼点
    var customText = (String type) => (int quantities) {
          return Column(
            children: [
              simpleText(quantities.toString(), size: 15, color: Colors.black),
              simpleText(type, size: 12, color: Colors.grey),
            ],
          );
        };

    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            child: customText("动态")(dynamic),
          ),
          VerticalDivider(
            color: Colors.grey.shade300,
            indent: 15,
            endIndent: 15,
          ),
          TextButton(
            onPressed: () {},
            child: customText("关注")(follow),
          ),
          VerticalDivider(
            color: Colors.grey.shade300,
            indent: 15,
            endIndent: 15,
          ),
          TextButton(
            onPressed: () {},
            child: customText("粉丝")(fans),
          ),
        ], //
      ),
    );
  }

  Widget _selfInfoCard() {
    return Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        height: 90,
        child: Row(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(35),
                child: Image.asset(
                  "assets/images/avater.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  simpleText("真的锡兰Ceylan", size: 17),
                  const UserStatus(status: 1),
                  simpleText("B币0.0    硬币: 172", size: 12, color: Colors.grey),
                ],
              ),
            ),
          ],
        ));
  }
}
