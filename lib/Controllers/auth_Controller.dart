import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  late UserCredential cred;

  void registerUser(
      String email, String password, String username, File? file) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty && file != null) {
        cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String Download_url = await updateStorage(file);
      } else {
        Get.snackbar("Error", "Enter All Credentials",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error Ocurred", e.toString());
    }
  }

  Future<String> updateStorage(File img) async {
    Reference ref = storage.ref().child('Profile Pic').child(cred.user!.uid);

    UploadTask task = ref.putFile(img);
    TaskSnapshot snap = await task;
    String url = await snap.ref.getDownloadURL();
    return url;
  }
}
