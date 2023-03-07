import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Pages/first_page.dart';
import 'package:my_apps_with_firebase_1/Pages/home.dart';
import 'package:my_apps_with_firebase_1/Pages/loading.dart';
import 'package:my_apps_with_firebase_1/Routes/route.dart';
import 'package:my_apps_with_firebase_1/controller/auth_controller.dart';
import 'package:my_apps_with_firebase_1/controller/page_index_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final authC = Get.put(AuthController(), permanent: true);
  final pageIndexC = Get.put(PageIndexController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Apps",
            //initialRoute: NameRoute.login,
            home: snapshot.data != null && snapshot.data!.emailVerified
                ? const HomePage()
                : const FirstPage(),
            getPages: AppRoute.pages,
          );
        }
        return const Loading();
      },
    );
  }
}
