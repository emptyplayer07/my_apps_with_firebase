import 'dart:developer';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_apps_with_firebase_1/controller/auth_controller.dart';
import 'package:my_apps_with_firebase_1/controller/cloud_storage_controller.dart';

import '../controller/page_index_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storegeC = Get.find<CloudStorageController>();
  String? coba2;
  String? coba3;
  String? coba4;
  // @override
  // void initState() async {
  //   //coba4 = await storegeC.getUserProfile();
  //   print("ini adalah init state");
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final pageIndexC = Get.find<PageIndexController>();
    final authC = Get.find<AuthController>();

    String imgPath =
        "https://firebasestorage.googleapis.com/v0/b/my-apps-with-firebase-1.appspot.com/o/emptyplayer555%40gmail.com%2Fimage%20profile%2Ftrue?alt=media&token=85f407dc-3aea-401e-bb5b-b7e9ad632f0e";

    var coba;

    cek2() async {
      coba = await storegeC.cekData();
      //imgPath = await storegeC.getUserProfile();
      print(coba);
      print("coba");
      return coba;
    }

    cek3() async {
      coba2 = await storegeC.getUserProfile();
      coba3 = coba2;
      return coba2;
    }

    cek3();
    //print(storegeC.getUserProfile());
    //print(coba2);

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              authC.logout();
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //cek2 != 0
            coba4 != null
                ? GestureDetector(
                    child: ClipOval(
                      child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.amber,
                          child: Container(
                              width: 100,
                              height: 100,
                              //child: Image.network(),
                              child: Image.network(
                                "$coba4",
                                fit: BoxFit.cover,
                              ))),
                      //child: Icon(Icons.person)))
                      //child: Image.network("")),
                    ),
                    onTap: () async {
                      //print(storegeC.getUserProfile().toString());
                      //imgPath = await storegeC.uploadImage();
                      await storegeC.uploadImage();
                      imgPath = await storegeC.getUserProfile();
                      print(storegeC.getUserProfile());
                      setState(() {});
                    },
                  )
                : GestureDetector(
                    child: ClipOval(
                      child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.amber,
                          //child: Image.network(),
                          child: Icon(Icons.abc)),
                    ),
                    onTap: () async {
                      //print(storegeC.getUserProfile());
                      //imgPath = await storegeC.uploadImage();
                      await storegeC.uploadImage();
                      imgPath = await storegeC.getUserProfile();
                      print(storegeC.getUserProfile());

                      setState(() {});
                    },
                  ),
            //Container(width: 100, height: 100, child: Image.network(imgPath)),

            SizedBox(
              height: 20,
            ),
            Text("${authC.getDataUser()}"),
            ElevatedButton(
                onPressed: () async {
                  var contol = await storegeC.cekData();
                  coba4 = await storegeC.getUserProfile();
                  print(await storegeC.cekData());
                  //print(storegeC.getUserProfile());
                  print("aus");
                  print(imgPath);
                  print("qwe");
                  print(cek2);
                  setState(() {});
                },
                child: Text("test"))
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(
            icon: Icon(Icons.home),
            title: "Home",
          ),
          TabItem(
            icon: Icon(Icons.add),
            title: "Add Data",
          ),
          TabItem(
            icon: Icon(Icons.person),
            title: "Profile",
          ),
        ],
        initialActiveIndex: pageIndexC.pageIndex.value,
        onTap: (index) {
          pageIndexC.changePage(index);
        },
      ),
    );
  }
}
