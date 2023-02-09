import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TexfieldControllerResetPassword extends GetxController {
  late TextEditingController emailC;

  @override
  void onInit() {
    emailC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailC.dispose();
    super.onClose();
  }
}
