import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class CloudStorageController extends GetxController {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getDataUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final emailByUser = user.email;
      return emailByUser;
    }
  }

  void uploadImage() async {
    var myRef = storage.ref("${getDataUser()}");

//     Directory appDocDir = await getApplicationDocumentsDirectory();
// String filePath = '${appDocDir.absolute}/file-to-upload.png';
// File file = File(filePath);
  }
}
