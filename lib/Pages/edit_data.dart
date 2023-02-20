import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/controller/Textfield/textfieldC_edit_data.dart';
import 'package:my_apps_with_firebase_1/controller/cloud_firestore_controller.dart';

class EditDataPage extends StatelessWidget {
  const EditDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textC = Get.find<TextfieldEditDataController>();
    final cloudFirestoreC = Get.find<CloudFirestoreController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: cloudFirestoreC.getDataById(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // print(cloudFirestoreC.getDataById(Get.arguments));
            // inspect(snapshot.data!.data() as Map<String, dynamic>);
            print(snapshot.data!.data());
            var data = snapshot.data!.data() as Map<String, dynamic>;

            textC.name.text = data["name"];
            textC.telp.text = data["telp"];
            textC.birthday.text = data["birthday"];
            textC.email.text = data["email"];
            return SafeArea(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: textC.name,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: textC.telp,
                    decoration: InputDecoration(
                      labelText: "Number Telephone",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: textC.birthday,
                    decoration: InputDecoration(
                      labelText: "Birthday",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: textC.email,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Save"),
                  )
                ],
              ),
            ));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
