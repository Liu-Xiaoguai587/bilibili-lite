//import 'package:dio/dio.dart';
import 'package:bilibili_lite/models/video_item.dart';
import 'package:bilibili_lite/services/http.dart';

class RecommendController {
  // List<VideoItem>? videoItem;
  final videoItem = <VideoItem>[];
  HttpGetter httpGetter = HttpGetter();

  final _updatePerSize = 14;
  int currentPage = 1;
  int showSize = 0;

  Future refreshVideoList() async {
    videoItem.clear();
    currentPage = 1;
    showSize = 0;
    await updateVideoList();
  }

  Future updateVideoList() async {
    showSize += _updatePerSize;

    if (showSize > videoItem.length) {
      await _updateVideoItem();
    }
  }

  Future _updateVideoItem() async {
    var updateItems = await httpGetter.rcmdVideoList(freshIdx: currentPage);
    var updateSize = updateItems.data['data']['item'].length;

    for (var i = 0; i < updateSize; i++) {
      videoItem.add(VideoItem.fromAPI(updateItems.data['data']['item'][i]));
    }
    currentPage += 1;
    //print("current Page = $currentPage");
    //print("show size = $showSize");
    //print("list length = ${videoItem.length}");
  }
}
