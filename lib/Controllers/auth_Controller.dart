import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tok/Views/Screens/LoginScreen.dart';
import 'package:tik_tok/Views/Screens/home_Screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tik_tok/Models/user_model.dart' as model;

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  late UserCredential cred;
  late Rx<File?> _PickedImage;
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, _MainScreenSetting);
  }

  _MainScreenSetting(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  File? get pickedimage => _PickedImage.value;
  picImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar("Profile Picture", "Picture has been successfully selected");
    }
    _PickedImage = Rx<File?>(File(pickedImage!.path));
  }

  void registerUser(
      String email, String password, String username, File? file) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty && file != null) {
        cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String Download_url = await updateStorage(file);
        model.User user = model.User(
            email: email,
            profilePic: Download_url,
            uid: cred.user!.uid,
            username: username);

        store.collection('users').doc(cred.user!.uid).set(user.toJason());
      } else {
        Get.snackbar("Error", "Enter All Credentials",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error Ocurred", e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Error", "Please fill all feild");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<String> updateStorage(File img) async {
    Reference ref = storage.ref().child('Profile Pic').child(cred.user!.uid);

    UploadTask task = ref.putFile(img);
    TaskSnapshot snap = await task;
    String url = await snap.ref.getDownloadURL();
    return url;
  }

  void SignOut() async {
    await auth.signOut();
  }
}
