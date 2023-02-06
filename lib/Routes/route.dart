import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Bindings/textfieldB_login.dart';
import 'package:my_apps_with_firebase_1/Pages/home.dart';
import 'package:my_apps_with_firebase_1/Pages/login.dart';
import 'package:my_apps_with_firebase_1/Pages/register.dart';
import 'package:my_apps_with_firebase_1/Routes/name_route.dart';

class AppRoute extends GetxController {
  static final pages = [
    GetPage(
      name: NameRoute.login,
      page: () => LoginPage(),
      binding: TextfieldBindingLogin(),
    ),
    GetPage(
      name: NameRoute.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: NameRoute.register,
      page: () => RegisterPage(),
    )
  ];
}
