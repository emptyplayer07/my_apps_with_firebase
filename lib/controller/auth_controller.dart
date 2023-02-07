import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_apps_with_firebase_1/Routes/name_route.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Stream<User?> get streamAuthStatus => auth.authStateChanges();

  Stream<User?> streamAuthStatus() {
    return auth.authStateChanges();
  }

  void login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(NameRoute.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Email salah",
          "Periksa email anda lagi lah broo...",
          duration: const Duration(seconds: 2),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Password salah ", "Coba Periksa lagi deh password mu",
            duration: const Duration(seconds: 2));
      }
    }
  }

  void register(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(NameRoute.login);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Warning",
          "Passwordmu terlalu lemah bro..",
          duration: const Duration(seconds: 2),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "warning",
          "Email $email sudah ada",
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(NameRoute.login);
  }
}
