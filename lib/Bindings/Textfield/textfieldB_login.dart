import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/controller/Textfield/textfieldC_login.dart';

class TextfieldBindingLogin implements Bindings {
  @override
  void dependencies() {
    Get.put(TextfieldControllerLogin());
  }
}
