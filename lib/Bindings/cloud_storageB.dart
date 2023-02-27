import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/controller/cloud_storage_controller.dart';

class CloudStorageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CloudStorageController());
  }
}
