import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Routes/name_route.dart';
import 'package:my_apps_with_firebase_1/controller/auth_controller.dart';
import 'package:my_apps_with_firebase_1/controller/Textfield/textfieldC_login.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({super.key});
  final textC = Get.find<TextfieldControllerLogin>();
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
                controller: textC.emailC,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun?"),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed(NameRoute.register);
                  },
                  child: const Text("Register"),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
