import 'package:dio/dio.dart';
//import 'dart:convert';

import 'api.dart';

class HttpGetter {
  Dio dio = Dio();

  Future<dynamic> _get(
    String api, {
    Map<dynamic, dynamic>? data,
  }) async {
    Response response = await dio.get(api, data: data);

    return response;
  }

  Future rcmdVideoList({required int freshIdx}) async {
    var result = await _get(
      Api.recommend,
      data: {
        'version': 1,
        'feed_version': 'V8',
        'homepage_ver': 1,
        'ps': 20,
        'fresh_idx': freshIdx,
        'brush': freshIdx,
        'fresh_type': 4
      },
    );

    return result;
  }
}
