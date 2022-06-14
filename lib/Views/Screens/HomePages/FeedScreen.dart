import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Vx.black,
        body: PageView.builder(
            controller: PageController(viewportFraction: 1, initialPage: 0),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ZStack([
                VxBox(
                    child: Image(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1655129226316-8457462b98bf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80"),
                )).size(context.screenWidth, context.screenHeight).make(),
                VStack([
                  300.heightBox,
                  Align(
                      alignment: Alignment.bottomRight,
                      child: VStack([
                        VxBox()
                            .square(50)
                            .roundedLg
                            .white
                            .make()
                            .badge(
                                position: VxBadgePosition.rightBottom,
                                color: Vx.pink500,
                                optionalWidget: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Icon(Icons.add,
                                        color: Vx.white, size: 20)),
                                size: 20)
                            .px(15),
                        20.heightBox,
                        Icon(Icons.favorite, color: Vx.white, size: 50).px(15),
                        20.heightBox,
                        HStack([
                          36.widthBox,
                          Text(
                            "2",
                            style: TextStyle(
                                color: Vx.white, fontWeight: FontWeight.bold),
                          ).centered(),
                        ]),
                        20.heightBox,
                        HStack([
                          15.widthBox,
                          Icon(Icons.comment, color: Vx.white, size: 40)
                        ]),
                        20.heightBox,
                        HStack([
                          36.widthBox,
                          Text(
                            "2",
                            style: TextStyle(
                                color: Vx.white, fontWeight: FontWeight.bold),
                          ).centered(),
                        ]),
                        20.heightBox,
                        20.heightBox,
                        HStack([
                          15.widthBox,
                          Icon(Icons.share, color: Vx.white, size: 40)
                        ]),
                        20.heightBox,
                        HStack([
                          36.widthBox,
                          Text(
                            "2",
                            style: TextStyle(
                                color: Vx.white, fontWeight: FontWeight.bold),
                          ).centered(),
                        ]),
                        20.heightBox,
                      ])).centered(),
                ])
              ]);
            }));
  }
}
