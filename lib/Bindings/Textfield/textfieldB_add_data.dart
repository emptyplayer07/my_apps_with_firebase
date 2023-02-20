import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/controller/Textfield/textfieldC_add_data.dart';

class TextfieldBindingAddData implements Bindings {
  @override
  void dependencies() {
    Get.put(TextfieldControllerAddData());
  }
}
