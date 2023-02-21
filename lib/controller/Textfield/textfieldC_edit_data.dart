import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextfieldEditDataController extends GetxController {
  late TextEditingController name;
  late TextEditingController telp;
  late TextEditingController birthday;
  late TextEditingController email;
  late var temp = 0.obs;
  late var temp2 = "".obs;

  @override
  void onInit() {
    name = TextEditingController();
    telp = TextEditingController();
    birthday = TextEditingController();
    email = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    telp.dispose();
    birthday.dispose();
    email.dispose();
    super.onClose();
  }
}
