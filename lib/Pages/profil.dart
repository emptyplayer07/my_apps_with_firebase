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

    String imgPath;

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
      body: StreamBuilder(
          stream: cloudC.readDataByUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listDataUser = snapshot.data!.docs;
              var imgUrl =
                  (listDataUser[0].data() as Map<String, dynamic>)['imgUrl'];
              print(imgUrl);
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imgUrl != " "
                          //    listDataUser.id.contains('a') == ""
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
                                          imgUrl,
                                          fit: BoxFit.cover,
                                        ))),
                                // child: Icon(Icons.person)))
                                //child: Image.network("")),
                              ),
                              onTap: () async {
                                //print(storegeC.getUserProfile().toString());
                                //imgPath = await storegeC.uploadImage();
                                await storageC.uploadImage();
                                imgPath = await storageC.getUserProfile();
                                cloudC.editDataProfile("a", imgPath);
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
                                await storageC.uploadImage();
                                imgPath = await storageC.getUserProfile();
                                cloudC.editDataProfile("a", imgPath);
                                setState(() {});
                              },
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("${authC.getDataUser()}"),
                      ElevatedButton(
                          onPressed: () async {
                            var coba = await cloudC.readUserProfile();
                            //var =
                            print(coba);
                          },
                          child: Text("test")),
                    ]),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
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
