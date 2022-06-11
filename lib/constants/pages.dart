import 'package:flutter/material.dart';
import 'package:tik_tok/Views/Screens/HomePages/AddVideo.dart';
import 'package:velocity_x/velocity_x.dart';

List Pages = [
  Center(
    child: "Home".text.white.make(),
  ),
  Center(
    child: "search".text.white.make(),
  ),
  const AddVideo(),
  Center(
    child: "Messages".text.white.make(),
  ),
  Center(
    child: "Profile".text.white.make(),
  ),
];
