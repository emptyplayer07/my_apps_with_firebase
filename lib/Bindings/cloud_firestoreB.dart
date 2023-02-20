import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/controller/cloud_firestore_controller.dart';

class CloudFirestoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CloudFirestoreController());
  }
}
