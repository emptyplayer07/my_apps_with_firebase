import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Pages/home.dart';
import 'package:my_apps_with_firebase_1/Pages/loading.dart';
import 'package:my_apps_with_firebase_1/Pages/login.dart';
import 'package:my_apps_with_firebase_1/Routes/name_route.dart';
import 'package:my_apps_with_firebase_1/Routes/route.dart';
import 'package:my_apps_with_firebase_1/controller/auth_controller.dart';
import 'package:my_apps_with_firebase_1/controller/textfieldC_login.dart';
import 'package:my_apps_with_firebase_1/controller/textfieldC_register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    final textClogin = Get.put(TextfieldControllerLogin());
    final textCregister = Get.put(TextfieldControllerRegister());
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: "Apps",
            //initialRoute: NameRoute.login,
            home: snapshot.data != null && snapshot.data!.emailVerified
                ? HomePage()
                : LoginPage(),
            getPages: AppRoute.pages,
          );
        }
        return Loading();
      },
    );
  }
}
