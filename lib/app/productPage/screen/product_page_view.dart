import 'package:ds_admin/app/productDetailsPage/screen/product_view.dart';
import 'package:ds_admin/app/productPage/controller/product_page_controller.dart';
import 'package:ds_admin/general/constans/constans.dart';
import 'package:ds_admin/general/utils/config.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            onTap: () {
                              productPageController.selectedProduct.value =
                                  controller.allProductsList[index];
                              Get.to(() => ProductView());
                            },
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: FancyShimmerImage(
                                boxFit: BoxFit.fill,
                                errorWidget:
                                    Image.asset('assets/images/loading.jpg'),
                                imageUrl:
                                    controller.allProductsList[index].image![0],
                                width: 60,
                              ),
                            ),
                            title: Text(
                              controller.allProductsList[index].productName!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color:
                                    controller.allProductsList[index].available!
                                        ? Colors.black
                                        : Colors.red,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                controller.deleteProduct(
                                  // ignore: invalid_use_of_protected_member
                                  controller
                                      .allProductsList.value[index].docId!,
                                );
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  controller.allProductsList[index].available!
                                      ? 'Status : Active'
                                      : 'Status : Inactive',
                                  style: TextStyle(
                                    color: controller
                                            .allProductsList[index].available!
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  controller.allProductsList[index].featured!
                                      ? 'Featured : True'
                                      : 'Featured : False',
                                  style: TextStyle(
                                    color: controller
                                            .allProductsList[index].featured!
                                        ? Colors.black
                                        : Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Obx(
                                  () => controller.allProductsList[index]
                                              .quantity! >=
                                          5
                                      ? Text(
                                          'Stock : ${controller.allProductsList[index].quantity!}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        )
                                      : Text(
                                          'Low Stock : ${controller.allProductsList[index].quantity!}',
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                ),
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
