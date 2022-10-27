import 'package:ds_admin/app/homePage/cotroller/home_page_controller.dart';
import 'package:ds_admin/app/homePage/widget/show_counter.dart';
import 'package:ds_admin/general/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constans/constans.dart';
import '../model/home_view_model.dart';

class HomePageView extends GetView<HomePageController> {
  var homeTitleList = [
    HomeViewModel(
      title: 'Dashboard',
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          Image.asset(
            'assets/icons/customers.png',
            scale: 3,
          )
        ],
      ),
      drawer: Container(),
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(
                'Welcome to Admin Panel',
                style: TextStyle(
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
                    print(homeTitleList[index].title);
                    if (homeTitleList[index].title == 'Products') {
                      Get.toNamed(RoutesClass.getProductPageRoute());
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
