import 'package:ds_admin/app/productPage/controller/product_page_controller.dart';
import 'package:ds_admin/general/utils/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../general/routes/route.dart';

class ProductPageView extends GetView<ProductPageController> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(RoutesClass.getAddProductPageRoute());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: Config.screenHeight! * 0.07,
                  width: double.infinity,
                  color: Colors.amber,
                  child: const Text(
                    'Add Product',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              (() => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.allProductsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            //onTap: () {},
                            leading: SizedBox(
                              height: 70,
                              width: 60,
                              child: Image.network(
                                controller.allProductsList[index].image,
                              ),
                            ),
                            title: Text(
                              controller.allProductsList[index].productName,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                print(controller.allProductsList[index].price);
                                controller.deleteProduct(
                                  controller.allProductsList.value[index].docId,
                                );
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  'Product Id :' +
                                      controller
                                          .allProductsList[index].productId
                                          .replaceAll('[#', '')
                                          .replaceAll(']', ''),
                                ),
                                Text(
                                  '${DateFormat('dd/MMM/yyyy').format(
                                    DateTime.parse(
                                      controller
                                          .allProductsList[index].createdAt,
                                    ),
                                  )} at ${DateFormat('hh:mm a').format(
                                    DateTime.parse(
                                      controller
                                          .allProductsList[index].createdAt,
                                    ),
                                  )}',
                                ),
                                Text(
                                  controller.allProductsList[index].quantity,
                                ),
                                // Text(
                                //   controller.allProductsList[index].totalSell,
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
