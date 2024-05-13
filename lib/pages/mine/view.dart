// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';

import 'package:bilibili_lite/models/user_status.dart';
import 'package:flutter/widgets.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    var iconWithTextV = ({required Widget icon, required Widget text}) =>
        Column(children: [icon, const Divider(height: 5), text]);
    var iconWithTextH =
        ({required Widget icon, required Widget text}) => Row(children: [
              icon,
              const VerticalDivider(
                width: 20,
              ),
              text
            ]);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
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
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "空间  〉",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ))
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
                text: Text(
                  "离线缓存",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                ),
              ),
              iconWithTextV(
                icon: Image.asset(
                  "assets/icons/mine/history.png",
                  width: 30,
                  height: 30,
                ),
                text: Text(
                  "历史记录",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                ),
              ),
              iconWithTextV(
                icon: Image.asset(
                  "assets/icons/mine/favorite.png",
                  width: 30,
                  height: 30,
                ),
                text: Text(
                  "我的收藏",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                ),
              ),
              iconWithTextV(
                //icon: Image.asset("assets/icons/later.png"),
                icon: Image.asset(
                  "assets/icons/mine/later.png",
                  width: 30,
                  height: 30,
                ),
                text: Text(
                  "稍后再看",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                ),
              ),
            ],
          ),
          // 更多服务
          const Divider(height: 20, color: Color(0xFFFFFFFF)),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "更多服务",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
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
              Text(
                "$quantities",
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              Text(
                type,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
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
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "真的锡兰Ceylan",
                    style: TextStyle(fontSize: 17),
                  ),
                  UserStatus(status: 1),
                  Text(
                    "B币: 0.0    硬币: 172",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
