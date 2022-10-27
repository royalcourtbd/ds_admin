import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ds_admin/app/homePage/screen/home_page_view.dart';
import 'package:ds_admin/app/mainPage/controller/main_page_controller.dart';
import 'package:ds_admin/app/productPage/screen/add_product_page.dart';
import 'package:ds_admin/app/productPage/screen/product_page_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainPageView extends GetView<MainPageController> {
  MainPageView({Key? key}) : super(key: key);

  final autoSizeGroup = AutoSizeGroup();
  //default index of a first screen

  final iconList = <IconData>[
    Icons.message,
    Icons.person,
  ];

  final List<Widget> pages = [
    AddProductPage(),
    ProductPageView(),
    HomePageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(
        () => pages[controller.currentIndex.value],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.home),
        onPressed: () {
          controller.currentIndex.value = 2;
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: controller.currentIndex.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,

          activeColor: Colors.amber,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          //(index) => setState(() => _bottomNavIndex = index),
          //other params
        ),
      ),
    );
  }
}
