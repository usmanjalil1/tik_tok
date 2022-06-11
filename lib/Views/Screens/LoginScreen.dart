import 'package:flutter/material.dart';
import 'package:tik_tok/Controllers/auth_Controller.dart';
import 'package:tik_tok/Views/Screens/RegisterScreen.dart';
import 'package:tik_tok/Views/Widgets/TextFeild.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: VxBox(
            child: VStack([
      50.heightBox,
      "Login".text.red700.xl3.bold.makeCentered().shimmer(
          gradient: const LinearGradient(
              colors: [Vx.red700, Vx.red500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      25.heightBox,
      TextFeild(
        controller: emailController,
        placeholdertext: "Email..",
      ).px(20),
      25.heightBox,
      TextFeild(
        controller: PasswordController,
        placeholdertext: "Password",
        isObscure: true,
      ).px(20),
      20.heightBox,
      GestureDetector(
        onTap: () =>
            controller.login(emailController.text, PasswordController.text),
        child: VxBox(
            child: Center(
          child: "Login".text.bold.make(),
        )).size(150, 50).red800.rounded.makeCentered(),
      ),
      10.heightBox,
      HStack([
        "Don't have an Account ?"
            .text
            .white
            .textStyle(context.captionStyle)
            .make(),
        5.widthBox,
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterScreen())),
          child: "Register yourself"
              .text
              .blue300
              .underline
              .textStyle(context.captionStyle)
              .make(),
        )
      ]).centered()
    ])).square(400).makeCentered());
  }
}
