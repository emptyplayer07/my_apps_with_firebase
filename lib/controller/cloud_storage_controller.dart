import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as namefile;

class CloudStorageController extends GetxController {
  final storageRef = storage.FirebaseStorage.instance.ref();

  getDataUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final emailByUser = user.email;
      return emailByUser;
    }
  }

  Future<String> uploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    String filename = namefile.basename(image!.path.toString());
    final storage.Reference firebaseStorageRef = storage
        .FirebaseStorage.instance
        .ref()
        .child('${getDataUser()}')
        .child('image profile/${image.path.isImageFileName}');

    await firebaseStorageRef.putData(await image.readAsBytes());

    //String v = await firebaseStorageRef.getDownloadURL();
    String v = "succes";
    return v;
  }

  getUserProfile() async {
    final imageUrl = await storageRef
        .child("${getDataUser()}/image profile/true")
        .getDownloadURL();
    print(imageUrl);
    print("${imageUrl.runtimeType}");
    return imageUrl;
  }

  cekData() async {
    final cek = await storageRef;
    final listResult =
        await storageRef.child("${getDataUser()}/image profile/").listAll();
    print("cekdata");
    return listResult.items.length;
  }
}
