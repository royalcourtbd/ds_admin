import 'package:ds_admin/app/homePage/cotroller/home_page_controller.dart';
import 'package:ds_admin/app/homePage/widget/show_counter.dart';
import 'package:ds_admin/general/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constans/constans.dart';
import '../model/home_view_model.dart';

// ignore: must_be_immutable
class HomePageView extends GetView<HomePageController> {
  HomePageView({Key? key}) : super(key: key);

  var homeTitleList = [
    HomeViewModel(
      title: 'Category',
      icon: 'assets/icons/dashboard.png',
    ),
    HomeViewModel(
      title: 'Products',
      icon: 'assets/icons/products.png',
    ),
    HomeViewModel(
      title: 'Customers',
      icon: 'assets/icons/customers.png',
    ),
    HomeViewModel(
      title: 'Orders',
      icon: 'assets/icons/orders.png',
    ),
    HomeViewModel(
      title: 'Banner',
      icon: 'assets/icons/placard.png',
    ),
    HomeViewModel(
      title: 'Brand',
      icon: 'assets/icons/brand.png',
    ),
    HomeViewModel(
      title: 'Settings',
      icon: 'assets/icons/settings.png',
    ),
    HomeViewModel(
      title: 'Reports',
      icon: 'assets/icons/report.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(Icons.login),
          ),
          Image.asset(
            'assets/icons/customers.png',
            scale: 3,
          )
        ],
      ),
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(
                auth.currentUser == null
                    ? 'Welcome To Admin Panel'
                    : auth.currentUser!.uid,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 1.5 / 1,
              ),
              itemCount: homeTitleList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (homeTitleList[index].title == 'Products') {
                      Get.toNamed(RoutesClass.getProductPageRoute());
                    } else if (homeTitleList[index].title == 'Category') {
                      Get.toNamed(RoutesClass.getCategoryPageRoute());
                    } else if (homeTitleList[index].title == 'Banner') {
                      Get.toNamed(RoutesClass.getCarouselPageRoute());
                    } else if (homeTitleList[index].title == 'Brand') {
                      Get.toNamed(RoutesClass.getBrandPageRoute());
                    } else if (homeTitleList[index].title == 'Settings') {
                      Get.toNamed(RoutesClass.getSettingPageRoute());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(homeTitleList[index].title!),
                          duration: const Duration(milliseconds: 100),
                        ),
                      );
                    }
                  },
                  child: Card(
                    color: Colors.green.shade400,
                    margin: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                homeTitleList[index].icon!,
                                height: 35,
                                color: Colors.white,
                              ),
                              homeTitleList[index].title == 'Products'
                                  ? Obx(
                                      () => ShowCounter(
                                        showBadge: productPageController
                                                    .productListLength >
                                                0
                                            ? true
                                            : false,
                                        title: productPageController
                                            .productListLength
                                            .toString(),
                                      ),
                                    )
                                  : homeTitleList[index].title == 'Category'
                                      ? Obx(
                                          () => ShowCounter(
                                            showBadge: categoryPageController
                                                        .categoriesListLength >
                                                    0
                                                ? true
                                                : false,
                                            title: categoryPageController
                                                .categoriesListLength
                                                .toString(),
                                          ),
                                        )
                                      : homeTitleList[index].title == 'Banner'
                                          ? Obx(
                                              () => ShowCounter(
                                                title: carouselPageController
                                                    .carouselListLength
                                                    .toString(),
                                                showBadge: carouselPageController
                                                            .carouselListLength >
                                                        0
                                                    ? true
                                                    : false,
                                              ),
                                            )
                                          : homeTitleList[index].title ==
                                                  'Brand'
                                              ? Obx(
                                                  () => ShowCounter(
                                                    title: brandPageController
                                                        .brandsListLength
                                                        .toString(),
                                                    showBadge: brandPageController
                                                                .brandsListLength >
                                                            0
                                                        ? true
                                                        : false,
                                                  ),
                                                )
                                              : Container(),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            homeTitleList[index].title!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
