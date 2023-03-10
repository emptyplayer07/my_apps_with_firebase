import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Routes/name_route.dart';
import 'package:my_apps_with_firebase_1/controller/auth_controller.dart';
import 'package:my_apps_with_firebase_1/controller/Textfield/textfieldC_register.dart';
import 'package:my_apps_with_firebase_1/controller/cloud_firestore_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final textC = Get.find<TextfieldControllerRegister>();
    final cloudC = Get.put(CloudFirestoreController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Center(
                  child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: textC.emailC2,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: textC.passwordC2,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await authC.register(
                      textC.emailC2.text, textC.passwordC2.text);
                  cloudC.addDataProfile(" ", " ");
                },
                child: const Text("Register"),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah punya akun?"),
                  TextButton(
                      onPressed: () {
                        Get.offAllNamed(NameRoute.login);
                      },
                      child: const Text("Login")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
