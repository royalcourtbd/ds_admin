import 'package:ds_admin/app/productDetailsPage/screen/product_view.dart';
import 'package:ds_admin/app/productPage/controller/product_page_controller.dart';
import 'package:ds_admin/general/utils/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../general/routes/route.dart';

class ProductPageView extends GetView<ProductPageController> {
  const ProductPageView({Key? key}) : super(key: key);

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
                            onTap: () {
                              Get.to(ProductView(
                                productValue: controller.allProductsList[index],
                              ));
                            },
                            leading: SizedBox(
                              height: 70,
                              width: 60,
                              child: Image.network(
                                controller.allProductsList[index].image[0],
                              ),
                            ),
                            title: Text(
                              controller.allProductsList[index].productName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color:
                                    controller.allProductsList[index].available
                                        ? Colors.black
                                        : Colors.red,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                controller.deleteProduct(
                                  // ignore: invalid_use_of_protected_member
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
                                  controller.allProductsList[index].available
                                      ? 'Status : Active'
                                      : 'Status : Inactive',
                                  style: TextStyle(
                                    color: controller
                                            .allProductsList[index].available
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),

                                // Text(
                                //   '${DateFormat('dd/MMM/yyyy').format(
                                //     DateTime.parse(
                                //       controller
                                //           .allProductsList[index].createdAt,
                                //     ),
                                //   )} at ${DateFormat('hh:mm a').format(
                                //     DateTime.parse(
                                //       controller
                                //           .allProductsList[index].createdAt,
                                //     ),
                                //   )}',
                                // ),
                                Text(
                                  'Stock : ${controller.allProductsList[index].quantity!}',
                                  style: TextStyle(
                                    color: int.parse(controller
                                                .allProductsList[index]
                                                .quantity) >=
                                            5
                                        ? Colors.black
                                        : Colors.red,
                                  ),
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
