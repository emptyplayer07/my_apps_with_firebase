import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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

  void register() {}
  void logout() async {
    await auth.signOut();
  }
}
