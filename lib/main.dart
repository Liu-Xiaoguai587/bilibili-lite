import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:get/get.dart';

import 'package:bilibili_lite/pages/router.dart';
import './services/cookies.dart';

//import 'package:base_app/pages/home/view.dart';

void main() async {
  await Hive.initFlutter();
  await Cookies.init();
  //Cookies.clearCookie();
  print("Login Status: ${Cookies.loginStatus}");

  runApp(GetMaterialApp(
    title: "Bili",
    theme: ThemeData(
      useMaterial3: true,
      primaryColor: Colors.pink,
    ),
    initialRoute: "/",
    getPages: Routs.getPage,
  ));
}
