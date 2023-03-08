import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/controller/auth_controller.dart';
import 'package:my_apps_with_firebase_1/controller/cloud_firestore_controller.dart';
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
    final cloudC = Get.put(CloudFirestoreController());
    final storageC = Get.find<CloudStorageController>();

    String imgPath = " ";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              authC.logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder(
          stream: cloudC.readUserProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listDataUser = snapshot.data!;
              print(listDataUser);
              var imgUrl =
                  (listDataUser.data() as Map<String, dynamic>)['imgUrl'];
              var name = (listDataUser.data() as Map<String, dynamic>)['name'];
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //imgPath != " "
                      imgUrl != " "
                          ? GestureDetector(
                              child: ClipOval(
                                child: Container(
                                    width: 200,
                                    height: 200,
                                    color: Colors.black12,
                                    child: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Image.network(
                                          imgUrl,
                                          //imgPath,
                                          fit: BoxFit.cover,
                                        ))),
                              ),
                              onTap: () async {
                                await storageC.uploadImage();
                                imgPath = await storageC.getUserProfile();
                                cloudC.editDataProfile("user", imgPath);
                                setState(() {});
                              },
                            )
                          : GestureDetector(
                              child: ClipOval(
                                child: Container(
                                    width: 200,
                                    height: 200,
                                    color: Colors.black12,
                                    child: const Icon(
                                      Icons.person,
                                      size: 100,
                                    )),
                              ),
                              onTap: () async {
                                await storageC.uploadImage();
                                imgPath = await storageC.getUserProfile();
                                cloudC.editDataProfile("user", imgPath);
                                setState(() {});
                              },
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("$name"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("${authC.getDataUser()}"),
                    ]),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
      bottomNavigationBar: ConvexAppBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const TabItem(
            icon: Icon(Icons.home),
            title: "Home",
          ),
          const TabItem(
            icon: Icon(Icons.add),
            title: "Add Data",
          ),
          const TabItem(
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
