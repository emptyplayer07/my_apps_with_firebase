import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextfieldControllerRegister extends GetxController {
  late TextEditingController emailC2;
  late TextEditingController passwordC2;

  @override
  void onInit() {
    super.onInit();
    emailC2 = TextEditingController();
    passwordC2 = TextEditingController();
  }

  @override
  void onClose() {
    emailC2.dispose();
    passwordC2.dispose();
    super.onClose();
  }
}
