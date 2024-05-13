import 'package:get/get.dart';

//import './home/view.dart';
import './navigation/view.dart';

class Routs {
  static final List<GetPage<dynamic>> getPage = [
    GetPage(name: '/', page: () => const Navigation()),
  ];
}

//  start -> page:Navigation -> page:Home -┬-> page:recommend
//                                         ├-> Page:live
//                                         └-> page:hot
//                            
//                            
//