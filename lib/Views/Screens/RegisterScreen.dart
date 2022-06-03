import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Widgets/TextFeild.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  String imageUrl =
      "https://www.nicepng.com/png/detail/933-9332131_profile-picture-default-png.png";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: VxBox(
      child: VStack([
        VxBox(
                child: HStack([
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () {},
            ),
          )
        ]).px(1))
            .square(150)
            .bgImage(DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover))
            .roundedFull
            .makeCentered(),
        25.heightBox,
        TextFeild(
          controller: usernameController,
          placeholdertext: "Username..",
        ),
        25.heightBox,
        TextFeild(
          controller: emailController,
          placeholdertext: "Email...",
          isObscure: false,
        ),
        25.heightBox,
        TextFeild(
          controller: passwordController,
          placeholdertext: "password",
          isObscure: true,
        ),
        20.heightBox,
        GestureDetector(
          onTap: () {},
          child: VxBox(
              child: Center(
            child: "Register".text.bold.make(),
          )).size(150, 50).red800.rounded.makeCentered(),
        ),
        10.heightBox,
        HStack([
          "Already have an account ?"
              .text
              .white
              .textStyle(context.captionStyle)
              .make(),
          5.widthBox,
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen())),
            child: "Login Page"
                .text
                .white
                .underline
                .textStyle(context.captionStyle)
                .make(),
          )
        ]).centered()
      ]),
    ).size(400, 600).makeCentered().px(20));
  }
}
