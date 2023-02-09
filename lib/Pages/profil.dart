import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/controller/auth_controller.dart';

import '../controller/page_index_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageIndexC = Get.find<PageIndexController>();
    final authC = Get.find<AuthController>();
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
            ClipOval(
              child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                  child: Icon(Icons.person)),
            ),
            SizedBox(
              height: 20,
            ),
            Text("${authC.getDataUser()}")
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
