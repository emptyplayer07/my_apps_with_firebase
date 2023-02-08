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
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user!.emailVerified) {
        Get.offAllNamed(NameRoute.home);
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email $email belum diverifikasi, verifikasi ulang?",
          onConfirm: () {
            userCredential.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: "Ya",
          onCancel: () {
            Get.back();
          },
          textCancel: "Tidak",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Email salah",
          "Periksa email anda lagi",
          duration: const Duration(seconds: 2),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Password salah ", "Periksa password anda lagi",
            duration: const Duration(seconds: 2));
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Silahkan tutup aplikasinya lagi lalu masuk kembali",
      );
    }
  }

  void register(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Verification",
        middleText:
            "Kami sudah mengirimkan email verification ke email $email, silahkan verifikasi terlebih dahulu",
        onConfirm: () {
          Get.back();
          Get.back();
        },
        textConfirm: "Ya, saya mengerti",
      );
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
          "Email $email sudah digunakan",
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "silahkan ulangi lagi proses daftarnya",
      );
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(NameRoute.login);
  }
}
