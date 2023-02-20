import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CloudFirestoreController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getDataUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final emailByUser = user.email;
      return emailByUser;
    }
  }

  Future<DocumentSnapshot<Object?>> getDataById(String docID) {
    CollectionReference docRef = firestore.collection("${getDataUser()}");
    return docRef.doc(docID).get();
  }

  //fungsi tambah data
  void addData(
    String name,
    String telp,
    String birthday,
    String email,
  ) async {
    try {
      CollectionReference addDataByUser =
          firestore.collection("${getDataUser()}");
      await addDataByUser.add({
        "name": name,
        "telp": telp,
        "birthday": birthday,
        "email": email,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Data sudah berhasil ditambahkan",
        onConfirm: () {
          Get.back();
        },
        textConfirm: "Ya, saya mengerti",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Warning",
        middleText: "Gagal menambahkan data",
      );
    }
  }

  //read data by user with email
  Stream<QuerySnapshot<Object?>> readDataByUser() {
    CollectionReference userData = firestore.collection("${getDataUser()}");
    return userData.snapshots();
  }
}
