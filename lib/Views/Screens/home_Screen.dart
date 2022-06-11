import 'package:flutter/material.dart';

import 'package:tik_tok/Controllers/auth_Controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import '../../constants/pages.dart';
import '../Widgets/CustomIcon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthController controller = Get.put(AuthController());
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.black,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Vx.black,
          selectedItemColor: Vx.red500,
          unselectedItemColor: Vx.white,
          onTap: (index) {
            setState(() {
              pageindex = index;
            });
          },
          currentIndex: pageindex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ]),
      body: Pages[pageindex],
    );
  }
}
