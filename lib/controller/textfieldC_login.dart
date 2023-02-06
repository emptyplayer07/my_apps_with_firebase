import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextfieldControllerLogin extends GetxController {
  late TextEditingController emailC;
  late TextEditingController passwordC;

  @override
  void onInit() {
    super.onInit();
    emailC = TextEditingController();
    passwordC = TextEditingController();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
