import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tik_tok/Controllers/auth_Controller.dart';
import 'package:tik_tok/Views/Screens/LoginScreen.dart';
import 'package:tik_tok/Views/Screens/home_Screen.dart';
import 'Views/Screens/RegisterScreen.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) {
      Get.put(AuthController());
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
