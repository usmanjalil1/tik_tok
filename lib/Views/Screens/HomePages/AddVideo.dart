import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tik_tok/Views/Screens/HomePages/confirm_Screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:image_picker/image_picker.dart';

class AddVideo extends StatelessWidget {
  const AddVideo({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Congratulations", "Task Succesfully Completed");
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmScreen(
            VideoPath: video.path,
            videoFile: File(video.path),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.black,
      body: VxBox(
          child: Center(
        child: GestureDetector(
          onTap: () => showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                    backgroundColor: Vx.white,
                    children: [
                      VxBox(
                        child:
                            "Select from Gallery".text.blue500.makeCentered(),
                      ).size(context.screenWidth, 40).make().onInkTap(
                          () => pickVideo(ImageSource.gallery, context)),
                      VxBox(
                        child: "camera".text.blue500.makeCentered(),
                      ).size(context.screenWidth, 40).make().onInkTap(
                          () => pickVideo(ImageSource.camera, context)),
                      VxBox(
                        child: "cancel".text.red500.makeCentered(),
                      )
                          .size(context.screenWidth, 40)
                          .make()
                          .onInkTap(() => Navigator.pop(context)),
                    ],
                  )),
          child: VxBox(
              child: Center(
            child: "Add".text.bold.make(),
          )).size(150, 50).red800.rounded.makeCentered(),
        ),
      )).size(context.screenWidth, context.screenHeight).make(),
    );
  }
}
