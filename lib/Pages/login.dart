import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Routes/name_route.dart';
import 'package:my_apps_with_firebase_1/controller/auth_controller.dart';
import 'package:my_apps_with_firebase_1/controller/textfieldC_login.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({super.key});
  final textC = Get.find<TextfieldControllerLogin>();
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: textC.emailC,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 10,
            ),
            TextField(
                controller: textC.passwordC,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                )),
            Align(
              child: TextButton(
                onPressed: () {
                  Get.toNamed(NameRoute.reset_pass);
                },
                child: const Text("Reset Password"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                authC.login(textC.emailC.text, textC.passwordC.text);
              },
              child: const Text("Login"),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("belum punya akun?"),
                TextButton(
                  onPressed: () {
                    Get.toNamed(NameRoute.register);
                  },
                  child: Text("Register"),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
