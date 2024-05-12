import 'package:bilibili_lite/pages/recommend/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class VideoList extends StatelessWidget {
  VideoList({super.key});

  final RecommendController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      padding: const EdgeInsets.all(4),
      children: List.generate(controller.showSize, (index) {
        return _videoItem(index);
      }),
    );
  }

  Widget _videoItem(int index) {
    return Container(
      //height: 171,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: _videoPic(index),
          ),
          Expanded(
            flex: 7,
            child: _videoDetail(index),
          ),
        ],
      ),
    );
  }

  Widget _videoPic(int index) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8), topRight: Radius.circular(8)),
      //child: Image.asset("assets/images/example.jpg"),
      child: Image.network(
        controller.videoItem.elementAt(index).pic ?? "error",
        fit: BoxFit.cover,
        height: 1080,
        width: 1080,
      ),
    );
  }

  Widget _videoDetail(int index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(7, 5, 7, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          //"视频详情\n",
          "${controller.videoItem.elementAt(index).title}\n",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.right,
        ),
        Row(children: [
          Image.asset(
            "assets/icons/bilibili_up.png",
            width: 15,
            height: 15,
          ),
          Text(
            //"\t这是up主",
            "\t${controller.videoItem.elementAt(index).ownerName}",
            style: const TextStyle(
              height: 2,
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
        ]),
      ]),
    );
  }
}
