import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_apps_with_firebase_1/controller/Textfield/textfieldC_edit_data.dart';
import 'package:my_apps_with_firebase_1/controller/cloud_firestore_controller.dart';

class EditDataPage extends StatefulWidget {
  const EditDataPage({super.key});

  @override
  State<EditDataPage> createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
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
            var data = snapshot.data!.data() as Map<String, dynamic>;
            textC.name.text = data["name"];
            textC.telp.text = data["telp"];
            textC.email.text = data["email"];

            if (textC.temp == 0) {
              textC.birthday.text = data["birthday"];
            } else {
              textC.birthday.text = textC.temp2.string;
            }

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
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Birthday",
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                    onTap: () async {
                      var editDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2200),
                      );

                      if (editDate != null) {
                        String formatNewDate1 =
                            DateFormat.yMd().format(editDate);
                        textC.temp2 = formatNewDate1.obs;

                        setState(() {
                          textC.birthday.text = textC.temp2.string;
                          textC.temp = 1.obs;
                        });
                      }
                    },
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
                    onPressed: () {
                      cloudFirestoreC.editData(
                          Get.arguments,
                          textC.name.text,
                          textC.telp.text,
                          textC.birthday.text,
                          textC.email.text);
                    },
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
