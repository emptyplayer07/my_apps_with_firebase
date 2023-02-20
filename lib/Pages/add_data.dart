import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_apps_with_firebase_1/controller/cloud_firestore_controller.dart';
import 'package:my_apps_with_firebase_1/controller/page_index_controller.dart';
import 'package:my_apps_with_firebase_1/controller/Textfield/textfieldC_add_data.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  @override
  Widget build(BuildContext context) {
    final pageIndexC = Get.find<PageIndexController>();
    final textC = Get.find<TextfieldControllerAddData>();
    final addDataC = Get.put(CloudFirestoreController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: textC.name,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: textC.telp,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Number Telephone",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: textC.birthday,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: "Birthday",
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () async {
                var newDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2200));
                if (newDate != null) {
                  //textC.birthday.value = newDate;
                  String formatNewDate = DateFormat.yMd().format(newDate);
                  setState(() {
                    textC.birthday.text = formatNewDate;
                  });
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: textC.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                addDataC.addData(textC.name.text, textC.telp.text,
                    textC.birthday.text, textC.email.text);
                textC.name.clear();
                textC.telp.clear();
                textC.birthday.clear();
                textC.email.clear();
              },
              child: const Text("Save"),
            )
          ],
        ),
      )),
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
