import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: HStack([
      0.1.widthBox,
      VxBox().size(4, 28).teal300.rounded.make(),
      5.widthBox,
      const Icon(Icons.add, color: Colors.black, size: 20),
      6.8.widthBox,
      VxBox().size(4, 28).red500.roundedLg.make(),
    ])).size(40, 30).white.roundedSM.make().centered();
  }
}
