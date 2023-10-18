import "dart:io";

import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import "package:tiktok_clone/constants.dart";
import "package:tiktok_clone/models/user.dart" as model;
import "package:tiktok_clone/views/screens/auth/login_screen.dart";
import "package:tiktok_clone/views/screens/home_screen.dart";

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Rx<File?> _pickedImage = Rx<File?>(null);
  late Rx<User?> _user;

  // getter for profile image
  File? get ProfileImage => _pickedImage.value;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(LoginScreen());
    } else {
      Get.offAll(const HomeScreen());
    }
  }

  // pick image from gallery
  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.showSnackbar(const GetSnackBar(
        message: "Successfully selected a image",
        duration: Duration(seconds: 2),
      ));
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

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
        Get.showSnackbar(
          const GetSnackBar(
            message: "Please enter all the fields",
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        Get.showSnackbar(
          const GetSnackBar(
            message: "Logged successful",
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            message: "Please enter all the fields",
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
