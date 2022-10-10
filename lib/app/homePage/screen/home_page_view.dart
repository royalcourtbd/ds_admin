import 'package:ds_admin/app/homePage/cotroller/home_page_controller.dart';
import 'package:ds_admin/general/constans/constans.dart';
import 'package:ds_admin/general/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageView extends GetView<HomePageController> {
  List title = [
    'User',
    'Order',
    'Exchange',
    'Products',
    'Categories',
    'Brands'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: title.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red,
                  child: InkWell(
                    onTap: () {
                      print(title[index]);
                      if (title[index] == 'Products') {
                        Get.toNamed(RoutesClass.getProductPageRoute());
                      } else if (title[index] == 'Categories') {
                        Get.toNamed(RoutesClass.getCategoryPageRoute());
                      } else if (title[index] == 'Brands') {
                        Get.toNamed(RoutesClass.getBrandPageRoute());
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        title[index],
                      ),
                    ),
                  ),
                );
              },
            ),
            Obx(
              () => Text(productPageController.productListLength.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
