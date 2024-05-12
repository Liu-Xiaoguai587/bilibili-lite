import 'package:get/get.dart';

import './home/view.dart';

class Routs {
  static final List<GetPage<dynamic>> getPage = [
    GetPage(name: '/', page: () => const HomePage()),
  ];
}

//class CustomerGetPage extends GetPage {
//
//  
//}
