import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/controller/Textfield/textfieldC_edit_data.dart';

class TextfieldEditDataBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TextfieldEditDataController());
  }
}
