import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/controller/textfieldC_register.dart';

class TextfieldBindingRegister implements Bindings {
  @override
  void dependencies() {
    Get.put(TextfieldControllerRegister());
  }
}
