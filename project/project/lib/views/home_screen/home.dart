import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/consts/consts.dart';
import 'package:project/controller/home_controller.dart';
import 'package:project/views/cart_screen/cart_screen.dart';
import 'package:project/views/category_screen/caterory_screen.dart';
import 'package:project/views/home_screen/home_screen.dart';

import '../profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    // home controller
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26,), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26,), label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26,), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26,), label: account),
    ];

    var navBody = [
      const HomeScreen(
        
      ),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];


    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value),)),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(
            fontFamily: semibold
          ),
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          items: navbarItem,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}