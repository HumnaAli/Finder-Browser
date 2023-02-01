import 'package:finder/about.dart';
import 'package:finder/fav.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'history.dart';
import 'home.dart';
import 'bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleNavBarPage extends StatelessWidget {
  GoogleNavBarPage({Key? key}) : super(key:key);

  BottomNavigationController bottomNavigationController = Get.put(BottomNavigationController());

  final screens = [
    Home(),
    FavPage(),
    HistoryPage(),
    AboutPage()
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx( ()=>IndexedStack(
        index: bottomNavigationController.selectedindex.value,
        children: screens,
      ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: SafeArea(
          child: GNav(
        backgroundColor: Colors.red,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.pink,
        padding: const EdgeInsets.all(15),
        gap: 15,
        tabs: const [
          GButton(
            icon: Icons.home, 
            text: "Home"
            ),
          GButton(
            icon: Icons.favorite,
            text: "Favoutites"  
          ),
          GButton(
            icon: Icons.history,
            text: "History",
          ),
          GButton(
            icon: Icons.line_weight_sharp, 
            text: "About"
            ),
        ],
          onTabChange: (value) {
            bottomNavigationController.changeIndex(value);
          },
      ),
          ),
          ),
    );
  }
}