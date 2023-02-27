import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CloudStorageController extends GetxController {
  final storageRef = storage.FirebaseStorage.instance.ref();

  getDataUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final emailByUser = user.email;
      return emailByUser;
    }
  }

  Future<String> uploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    String filename = basename(image!.path.toString());
    final storage.Reference firebaseStorageRef = storage
        .FirebaseStorage.instance
        .ref()
        .child('${getDataUser()}')
        .child('image profile/${image.path.isImageFileName}');

    await firebaseStorageRef.putData(await image.readAsBytes());

    String v = await firebaseStorageRef.getDownloadURL();
    return v;
  }

  getUserProfile() async {
    final imageUrl = await storageRef
        .child("${getDataUser()}/image profile/true")
        .getDownloadURL();
    print(imageUrl);
    return imageUrl;
  }

  cekData() async {
    final cek = await storageRef;
    // // await storageRef.child("files/uid");
    final listResult = await storageRef.listAll();
    return listResult.items.length;
    // for (var prefix in listResult.prefixes) {
    //   prefix.fullPath;
    //   print("$prefix  prefix");
    //   print("assu");
    // }
    // for (var item in listResult.items) {
    //   print("$item item");
    //   print("assu");
    //   // The items under storageRef.
    // }
    // print("$cek 1");
    //return cek;

    // final cek = storageRef;
    // try {
    //   final listResult = await cek.listAll();
    // } on FirebaseException catch (e) {
    //   // Caught an exception from Firebase.
    //   return print("Failed with error '${e.code}': ${e.message}");
    // }
  }
}
