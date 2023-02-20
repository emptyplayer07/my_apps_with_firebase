import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextfieldControllerAddData extends GetxController {
  late TextEditingController name;
  late TextEditingController telp;
  late TextEditingController birthday;
  late TextEditingController email;

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
