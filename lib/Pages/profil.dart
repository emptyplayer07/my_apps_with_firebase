import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/page_index_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageIndexC = Get.find<PageIndexController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Text("Profile Page"),
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
