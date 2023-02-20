import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Routes/name_route.dart';
import 'package:my_apps_with_firebase_1/controller/auth_controller.dart';
import 'package:my_apps_with_firebase_1/controller/cloud_firestore_controller.dart';
import 'package:my_apps_with_firebase_1/controller/page_index_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final pageIndexC = Get.find<PageIndexController>();
    final cloudFirestoreC = Get.put(CloudFirestoreController());
    pageIndexC.pageIndex.value = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to the junggle"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info),
          )
        ],
      ),
      body: StreamBuilder(
          stream: cloudFirestoreC.readDataByUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listDataUser = snapshot.data!.docs;
              return ListView.builder(
                itemCount: listDataUser.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => Get.toNamed(NameRoute.edit_data,
                        arguments: listDataUser[index].id),
                    title: Text(
                        "${(listDataUser[index].data() as Map<String, dynamic>)["name"]}"),
                    subtitle: Text(
                        "${(listDataUser[index].data() as Map<String, dynamic>)["telp"]}"),
                    trailing: IconButton(
                      onPressed: () {
                        cloudFirestoreC.deleteData(listDataUser[index].id);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  );
                },
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
