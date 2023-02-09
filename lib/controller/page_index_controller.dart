import 'dart:ffi';

import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Routes/name_route.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int i) {
    if (pageIndex.value != i) {
      pageIndex.value = i;
      switch (i) {
        case 1:
          Get.offAllNamed(NameRoute.add_data);
          break;
        case 2:
          Get.offAllNamed(NameRoute.profile);
          break;
        default:
          Get.offAllNamed(NameRoute.home);
      }
    }
  }
}
