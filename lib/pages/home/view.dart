import 'package:flutter/material.dart';

import '../hot/view.dart';
import '../live/view.dart';
import '../recommend/view.dart';
//import 'package:base_app/models/video_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final homeTabs = <String, Widget>{
    "直播": const LiveTab(), // pages/live
    "推荐": const RecommendTab(), // this file
    "热门": const HotTab(), // pages/hot
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1, //默认启动首页推荐页
      length: homeTabs.length,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFFFFFFFF),
            shape: const Border(
                bottom: BorderSide(color: Colors.grey, width: 0.1)),
            leading: IconButton(
                onPressed: () {},
                //icon: Image.asset("assets/images/avater.jpg"),
                icon: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avater.jpg"),
                )),
            title: SizedBox(
              width: 1000,
              child: TextButton(
                onPressed: () {
                  //TODO
                  //go to search page
                },
                style: const ButtonStyle(
                  side: MaterialStatePropertyAll(
                    BorderSide(color: Colors.grey, width: 1),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                child: const Icon(Icons.search),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  //TODO
                  //go to message
                },
                icon: Image.asset(
                  "assets/icons/email.png",
                  width: 25,
                  height: 25,
                ),
                // icon: const Icon(Icons.email),
              )
            ],
            bottom: TabBar(
              tabAlignment: TabAlignment.center,
              dividerHeight: 0,
              tabs: homeTabs.keys
                  .map((key) => Tab(
                        text: key,
                      ))
                  .toList(),
            )),
        body: TabBarView(
          children: homeTabs.values.toList(),
        ),
      ),
    );
  }
}

class CustomIcon extends Image {
  CustomIcon(
    super.name, {
    super.key,
  }) : super.asset(width: 25, height: 25);
}
