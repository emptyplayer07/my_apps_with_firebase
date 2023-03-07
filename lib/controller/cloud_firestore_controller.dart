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

  //add data contact
  void addData(
    String name,
    String telp,
    String birthday,
    String email,
  ) async {
    String dateNow = DateTime.now().toIso8601String();
    try {
      CollectionReference addDataByUser =
          firestore.collection("${getDataUser()}");
      await addDataByUser.add({
        "name": name,
        "telp": telp,
        "birthday": birthday,
        "email": email,
        "created_at": dateNow,
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

  //add data user profile
  void addDataProfile(String name, String imgUrl) async {
    try {
      CollectionReference addUserProfile =
          firestore.collection("${getDataUser()}");

      addUserProfile.doc('a').set({
        "name": name,
        "imgUrl": imgUrl,
      });

      print("succes add data profile");
    } catch (e) {
      print(e);
    }
  }

  //edit data profile
  void editDataProfile(String docId, String imgUrl) async {
    DocumentReference docData =
        firestore.collection("${getDataUser()}").doc(docId);
    try {
      await docData.update({
        "imgUrl": imgUrl,
      });
      Get.defaultDialog(
        title: "Succes",
        onConfirm: () => Get.back(),
        textConfirm: "Berhasil",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Warning",
        middleText: "Gagal edit data",
      );
    }
  }

  //edit data
  void editData(String docID, String name, String telp, String birthday,
      String email) async {
    DocumentReference docData =
        firestore.collection("${getDataUser()}").doc(docID);
    try {
      await docData.update({
        "name": name,
        "telp": telp,
        "birthday": birthday,
        "email": email,
      });

      Get.defaultDialog(
          title: "Mantap",
          middleText: "Data sudah di edit",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Ya, saya mengerti");
    } catch (e) {
      Get.defaultDialog(title: "Warning", middleText: "Gagal edit data");
    }
  }

  //edit image profile
  // void editImageProfile(String imgUrl) {
  //   DocumentReference docData = firestore.collection("${getDataUser}").doc()
  // }

  //delete data
  void deleteData(String docID) {
    DocumentReference docData =
        firestore.collection("${getDataUser()}").doc(docID);
    try {
      Get.defaultDialog(
        title: "Warning",
        middleText: "Apakah anda yakin untuk hapus data?",
        onConfirm: () async {
          await docData.delete();
          Get.back();
        },
        textConfirm: "Yes",
        textCancel: "No",
      );
    } catch (e) {
      Get.defaultDialog(
        title: "Warning",
        middleText: "Gagal hapus data",
      );
    }
  }

  //read data by user with email
  Stream<QuerySnapshot<Object?>> readDataByUser() {
    CollectionReference userData = firestore.collection("${getDataUser()}");
    return userData.snapshots();
  }

  //get data user profile
  Stream<DocumentSnapshot<Object?>> readUserProfile() {
    DocumentReference userData =
        firestore.collection("${getDataUser()}").doc("a");
    print(userData);
    return userData.snapshots();
  }
}
