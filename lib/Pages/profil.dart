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
  @override
  Widget build(BuildContext context) {
    final pageIndexC = Get.find<PageIndexController>();
    final authC = Get.find<AuthController>();
    final storegeC = Get.find<CloudStorageController>();
    String imgPath = "";
    var coba;
    // Obx(() async {
    //   return cek = await storegeC.cekData();
    // });
    cek2() async {
      coba = await storegeC.cekData();
      print(coba);
      print("coba");
      return coba;
    }

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
            cek2 != 0
                ? GestureDetector(
                    child: ClipOval(
                      child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.amber,
                          child: Icon(Icons.person)),
                    ),
                    onTap: () async {
                      print(storegeC.getUserProfile().toString());
                      //imgPath = await storegeC.uploadImage();

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
                      print(storegeC.getUserProfile());
                      //imgPath = await storegeC.uploadImage();

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
                  print(await storegeC.cekData());
                  print("qwe");
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
