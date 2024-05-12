import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:bilibili_lite/pages/recommend/controller.dart';

// import 'package:base_app/services/http.dart';
import 'video_list.dart';

class RecommendTab extends StatefulWidget {
  const RecommendTab({super.key});

  @override
  State<RecommendTab> createState() => _VideoListState();
}

class _VideoListState extends State<RecommendTab> {
  final controller = Get.put(RecommendController());
  late Future futureBuilder;

  @override
  void initState() {
    super.initState();
    futureBuilder = controller.updateVideoList();
  }

  @override
  void reassemble() {
    super.reassemble();

    controller.currentPage = 1;
    controller.showSize = 0;
    controller.videoItem.clear();
  }

  @override
  Widget build(BuildContext context) {
    //super.build(context);
    //controller.updateVideoList();
    return Scaffold(
      backgroundColor: const Color(0xf1f2f6FF),
      body: EasyRefresh(
          header: const MaterialHeader(),
          footer: const ClassicFooter(),
          onRefresh: () async {
            await controller.refreshVideoList();
            setState(() {});
          },
          onLoad: () async {
            await controller.updateVideoList();
            setState(() {});
          },
          // child: VideoList(),
          child: FutureBuilder(
            future: futureBuilder,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  //TODO
                  return Text("Err: ${snapshot.error}");
                } else {
                  print("future builder");
                  return VideoList();
                }
              } else {
                //return const CircularProgressIndicator();
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.pink,
                  ),
                );
              }
            },
          )),
    );
  }
}
