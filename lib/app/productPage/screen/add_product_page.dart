import 'package:ds_admin/app/productPage/controller/product_page_controller.dart';
import 'package:ds_admin/app/productPage/model/brand_model.dart';
import 'package:ds_admin/general/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../model/category_model.dart';
import '../widget/text_field.dart';

class AddProductPage extends GetView<ProductPageController> {
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
              NewTextField(
                hintText: 'Product Name',
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
                                (element) => element.categoryName == value);
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
                validator: (value) {
                  return controller.priceValidation(value!);
                },
              ),
              NewTextField(
                hintText: 'Discount Price',
                textEditingController: controller.discountPriceController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return controller.discountPriceValidation(value!);
                },
              ),
              NewTextField(
                hintText: 'Image Url',
                textEditingController: controller.imageController,
                validator: (value) {
                  return controller.imageUrlValidation(value!);
                },
              ),
              NewTextField(
                hintText: 'Quantity',
                textEditingController: controller.quantityController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return controller.quantityValidation(value!);
                },
              ),
              NewTextField(
                hintText: 'Description',
                textEditingController: controller.descriptionController,
                validator: (value) {
                  return controller.descriptionValidation(value!);
                },
              ),
              NewTextField(
                hintText: 'Highlights',
                textEditingController: controller.highlightsController,
                validator: (value) {
                  return controller.highlightsValidation(value!);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  controller.addToProductButton();
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
