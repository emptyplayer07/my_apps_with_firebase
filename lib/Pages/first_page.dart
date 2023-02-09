import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Routes/name_route.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to the jungle",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(NameRoute.login);
                    },
                    child: Text("Login"))),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(NameRoute.register);
                    },
                    child: Text("Register"))),
          ],
        ),
      ),
    );
  }
}
