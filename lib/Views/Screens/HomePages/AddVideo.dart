import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class AddVideo extends StatelessWidget {
  const AddVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.black,
      body: VxBox(
          child: Center(
        child: VxBox(
            child: Center(
          child: "Add".text.bold.make(),
        )).size(150, 50).red800.rounded.makeCentered(),
      )).size(context.screenWidth, context.screenHeight).make(),
    );
  }
}
