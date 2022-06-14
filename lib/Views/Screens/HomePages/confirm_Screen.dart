import 'dart:io';
import 'package:tik_tok/Controllers/Uploading_video_controller.dart';
import 'package:tik_tok/Views/Widgets/TextFeild.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:tik_tok/Views/Widgets/TextFeild.dart';
import 'package:get/get.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String VideoPath;
  const ConfirmScreen(
      {Key? key, required this.videoFile, required this.VideoPath})
      : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  UploadVideoController uploadController = Get.put(UploadVideoController());
  late VideoPlayerController controller;
  TextEditingController songController = TextEditingController();
  TextEditingController captioncontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ZStack([
          VxBox(child: VideoPlayer(controller))
              .size(context.screenWidth, 550)
              .make(),
          Align(
            alignment: Alignment.bottomCenter,
            child: VStack([
              VxTextField(
                hint: "Song Name",
                autocorrect: true,
                controller: songController,
                icon: const Icon(Icons.music_note, color: Vx.white),
                contentPaddingLeft: 5.0,
              ).px(10),
              10.heightBox,
              VxTextField(
                hint: "Caption",
                autocorrect: true,
                controller: captioncontroller,
                icon: const Icon(Icons.notes, color: Vx.white),
                contentPaddingLeft: 5.0,
              ).px(10),
              10.heightBox,
              VxBox(
                  child: Center(
                child:
                    "Share!".text.white.textStyle(context.captionStyle).make(),
              )).size(170, 50).blue500.rounded.makeCentered().py(5).onInkTap(
                  () => uploadController.UploadVideo(songController.text,
                      captioncontroller.text, widget.VideoPath))
            ]),
          )
        ]));
  }
}
