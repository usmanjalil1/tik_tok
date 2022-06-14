import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'dart:io';
import 'package:tik_tok/Models/VideoModel.dart';

class UploadVideoController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  _CompressVideo(String VideoPath) async {
    final compressVideo = await VideoCompress.compressVideo(VideoPath,
        quality: VideoQuality.MediumQuality);
    return compressVideo!.file;
  }

  Future<String> UploadVideoToStorage(String id, String VideoPath) async {
    Reference ref = storage.ref().child('videos').child(id);
    UploadTask uploadTask = ref.putFile(await _CompressVideo(VideoPath));
    TaskSnapshot snap = await uploadTask;
    String Url = await snap.ref.getDownloadURL();
    return Url;
  }

  _getThumbnail(String VideoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(VideoPath);
    return thumbnail;
  }

  Future<String> _UploadImageToStorage(String id, String VideoPath) async {
    Reference ref = storage.ref().child('thumbnails').child(id);
    UploadTask uploadtask = ref.putFile(await _getThumbnail(VideoPath));
    TaskSnapshot snap = await uploadtask;
    String Url = await snap.ref.getDownloadURL();
    return Url;
  }

  UploadVideo(String songname, String caption, String VideoPath) async {
    try {
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(auth.currentUser!.uid).get();
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      String VideoUrl = await UploadVideoToStorage("Video no $len", VideoPath);
      String ImageUrl = await _UploadImageToStorage("Video no $len", VideoPath);
      Video video = Video(
          caption: caption,
          commentCount: 0,
          likes: [],
          shareCount: 0,
          profilePhoto:
              (userDoc!.data() as Map<String, dynamic>)['profilePhoto'],
          songName: songname,
          thumbnail: ImageUrl,
          videoUrl: VideoUrl,
          uid: auth.currentUser!.uid,
          id: "Video no $len",
          username: (userDoc!.data() as Map<String, dynamic>)['username']);
      await firestore
          .collection('videos')
          .doc("video no $len")
          .set(video.toJson());
      Get.back();
    } catch (e) {
      Get.snackbar("Error Uploading Video", e.toString());
    }
  }
}
