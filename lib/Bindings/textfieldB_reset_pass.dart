import 'package:get/get.dart';

import '../controller/textfieldC_reset_password.dart';

class TextfieldResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TexfieldControllerResetPassword());
  }
}
