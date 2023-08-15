import "dart:io";

import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:get/get.dart";
import "package:tiktok_clone/constants.dart";
import "package:tiktok_clone/models/user.dart" as model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  // upload to firebase storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask task = ref.putFile(image);
    TaskSnapshot snap = await task;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  // register a user
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);

        model.User user = model.User(
            uid: credential.user!.uid,
            name: username,
            email: email,
            profilePhoto: downloadUrl);

        await firestore
            .collection('user')
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar("Error", "Please enter all the fields");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
