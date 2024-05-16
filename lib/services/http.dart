import 'dart:async';

import 'package:dio/dio.dart';
//import 'dart:convert';

import 'api.dart';
import 'cookies.dart';

class HttpGetter {
  Dio dio = Dio();

  Future<dynamic> _get(
    String api, {
    Map<dynamic, dynamic>? data,
  }) async {
    Response response = await dio.get(api,
        data: data,
        options: Options(headers: {
          "Cookie": Cookies.sessdata,
        }));

    return response;
  }

  Future interface() async {
    if (Cookies.loginStatus == false) {
      return {
        'status': 1,
        'data': null,
        'message': "尚未登录",
      };
    }

    var info = await _get(Api.interface);
    var infoStat = await _get(Api.interfaceStatus);

    // 成功
    if (info.data['code'] == 0) {
      return {
        'status': 0,
        'data': info.data['data'],
        'subdata': infoStat.data['data'],
      };
    }

    return {
      'status': info.data['code'],
      'data': null,
      'message': info.data['message'],
    };
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
