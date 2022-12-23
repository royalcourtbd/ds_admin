import 'dart:developer';

import 'package:ds_admin/app/productPage/controller/product_page_controller.dart';
import 'package:ds_admin/app/productPage/model/brand_model.dart';
import 'package:ds_admin/general/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../model/category_model.dart';
import '../widget/text_field.dart';

class AddProductPage extends GetView<ProductPageController> {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.addProductKey,
          child: Column(
            children: [
              Obx(
                () => Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: productPageController.imageUrl.value != ''
                        ? Image.network(
                            productPageController.imageUrl.value,
                            height: 200,
                            width: 200,
                            fit: BoxFit.contain,
                          )
                        : productPageController.isUploading.value
                            ? const CircularProgressIndicator(
                                //color: Colors.white,
                                )
                            : const Icon(
                                Icons.photo,
                                size: 110,
                              ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  productPageController.getImage();
                },
                child: const Text(
                  'image',
                ),
              ),
              NewTextField(
                hintText: 'Product Name',
                prefixIcon: const Icon(Icons.shopping_bag_outlined),
                textEditingController: controller.productNameController,
                validator: (value) {
                  return controller.productNameValidation(value!);
                },
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 57,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        //color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    //width: Config.screenWidth! - 82,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      hint: Text(
                        categoryPageController.selectCategory.value.toString(),
                      ),
                      items: categoryPageController.categoriesList
                          .map((CategoryModel e) {
                        return DropdownMenuItem(
                          value: e.categoryName,
                          child: Text(
                            e.categoryName.toString(),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        categoryPageController.selectCategory.value =
                            value.toString();
                        categoryPageController.categoryIndex.value =
                            categoryPageController.categoriesList.indexWhere(
                          (element) => element.categoryName == value,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 57,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        //color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    //width: Config.screenWidth! - 82,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      hint: Text(
                        brandPageController.selectBrand.value.toString(),
                      ),
                      items: brandPageController.brandsList.map((BrandModel e) {
                        return DropdownMenuItem(
                          value: e.brandName,
                          child: Text(
                            e.brandName.toString(),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        brandPageController.selectBrand.value =
                            value.toString();
                        brandPageController.brandIndex.value =
                            brandPageController.brandsList.indexWhere(
                                (element) => element.brandName == value);
                      },
                    ),
                  ),
                ),
              ),
              NewTextField(
                hintText: 'Price',
                textEditingController: controller.priceController,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.attach_money),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  return controller.priceValidation(value!);
                },
              ),
              NewTextField(
                hintText: 'Discount Price',
                textEditingController: controller.discountPriceController,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.price_change),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  return controller.discountPriceValidation(value!);
                },
              ),
              // NewTextField(
              //   hintText: 'Image Url',
              //   textEditingController: controller.imageController,
              //   validator: (value) {
              //     return controller.imageUrlValidation(value!);
              //   },
              // ),
              NewTextField(
                hintText: 'Quantity',
                prefixIcon: const Icon(Icons.production_quantity_limits),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textEditingController: controller.quantityController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return controller.quantityValidation(value!);
                },
              ),
              NewTextField(
                hintText: 'Description',
                textEditingController: controller.descriptionController,
                prefixIcon: const Icon(Icons.description),
                validator: (value) {
                  return controller.descriptionValidation(value!);
                },
              ),
              NewTextField(
                hintText: 'Highlights',
                textEditingController: controller.highlightsController,
                prefixIcon: const Icon(Icons.highlight),
                validator: (value) {
                  return controller.highlightsValidation(value!);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  if (controller.imageUrl.value == '') {
                    Get.snackbar(
                      'Empty Image',
                      'Please Select an Image',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    log('Please select an image');
                  } else {
                    controller.addToProductButton();
                  }
                },
                child: const Text('Add Product'),
              ),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
