import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Pages/add_data.dart';
import 'package:my_apps_with_firebase_1/Pages/first_page.dart';
import 'package:my_apps_with_firebase_1/Pages/home.dart';
import 'package:my_apps_with_firebase_1/Pages/login.dart';
import 'package:my_apps_with_firebase_1/Pages/profil.dart';
import 'package:my_apps_with_firebase_1/Pages/register.dart';
import 'package:my_apps_with_firebase_1/Pages/reset_password.dart';
import 'package:my_apps_with_firebase_1/Routes/name_route.dart';
import '../Bindings/textfieldB_login.dart';
import '../Bindings/textfieldB_register.dart';
import '../Bindings/textfieldB_reset_pass.dart';

class AppRoute extends GetxController {
  static final pages = [
    GetPage(
      name: NameRoute.first_page,
      page: () => FirstPage(),
    ),
    GetPage(
      name: NameRoute.home,
      page: () => const HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRoute.login,
      page: () => LoginPage(),
      binding: TextfieldBindingLogin(),
      transition: Transition.size,
    ),
    GetPage(
      name: NameRoute.register,
      page: () => const RegisterPage(),
      binding: TextfieldBindingRegister(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: NameRoute.reset_pass,
        page: () => const ResetPasswordPage(),
        binding: TextfieldResetPasswordBinding()),
    GetPage(
      name: NameRoute.profile,
      page: () => ProfilePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: NameRoute.add_data,
      page: () => AddDataPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
