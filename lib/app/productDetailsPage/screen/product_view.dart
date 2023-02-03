import 'package:ds_admin/general/utils/config.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

import '../../../general/constans/constans.dart';
import '../widget/edit_field.dart';

class ProductView extends StatefulWidget {
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  bool isEnabled = false;
  TextEditingController productNameController = TextEditingController(
      text: productPageController.selectedProduct.value!.productName);
  TextEditingController productPriceController = TextEditingController(
      text: productPageController.selectedProduct.value!.price!.toString());
  TextEditingController productDiscountController = TextEditingController(
      text: productPageController.selectedProduct.value!.discountPrice
          .toString());
  TextEditingController productQuantityController = TextEditingController(
      text: productPageController.selectedProduct.value!.quantity.toString());
  TextEditingController productDescriptionController = TextEditingController(
      text: productPageController.selectedProduct.value!.description);
  TextEditingController productHighController = TextEditingController(
    text: productPageController.selectedProduct.value!.highlights,
  );
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEnabled = !isEnabled;
              });
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Config.screenHeight! / 2,
              child: CarouselSlider.builder(
                slideIndicator: CircularSlideIndicator(
                  padding: const EdgeInsets.only(bottom: 15),
                ),
                slideTransform: const DefaultTransform(),
                unlimitedMode: true,
                // autoSliderTransitionTime: const Duration(seconds: 3),
                enableAutoSlider: false,
                itemCount:
                    productPageController.selectedProduct.value!.image!.length,
                slideBuilder: (index) {
                  return FancyShimmerImage(
                    imageUrl: productPageController
                        .selectedProduct.value!.image![index],
                    boxFit: BoxFit.contain,
                    errorWidget: Image.asset('assets/images/loading.jpg'),
                  );
                },
              ),
            ),
            EditField(
              label: 'Name',
              isEnabled: isEnabled,
              controller: productNameController,
              border: isEnabled ? const OutlineInputBorder() : InputBorder.none,
              maxLines: 2,
              enabled: isEnabled,
              child: isEnabled ? const Icon(Icons.save) : const SizedBox(),
              onTap: () {
                productDetailsPageController.updateName(
                    productPageController.selectedProduct.value!.docId!,
                    productNameController.text);
              },
            ),
            EditField(
              label: 'Price',
              isEnabled: isEnabled,
              controller: productPriceController,
              keyboardType: TextInputType.number,
              border: isEnabled ? const OutlineInputBorder() : InputBorder.none,
              maxLines: 1,
              enabled: isEnabled,
              child: isEnabled ? const Icon(Icons.save) : const SizedBox(),
              onTap: () {
                productDetailsPageController.updatePrice(
                  productPageController.selectedProduct.value!.docId!,
                  double.parse(
                    productPriceController.text,
                  ),
                );
              },
            ),
            EditField(
              label: 'Discount Price',
              isEnabled: isEnabled,
              keyboardType: TextInputType.number,
              controller: productDiscountController,
              border: isEnabled ? const OutlineInputBorder() : InputBorder.none,
              maxLines: 1,
              enabled: isEnabled,
              child: isEnabled ? const Icon(Icons.save) : const SizedBox(),
              onTap: () {
                productDetailsPageController.updateDiscountPrice(
                  productPageController.selectedProduct.value!.docId!,
                  double.parse(productDiscountController.text),
                );
              },
            ),
            EditField(
              label: 'Quantity',
              isEnabled: isEnabled,
              keyboardType: TextInputType.number,
              controller: productQuantityController,
              border: isEnabled ? const OutlineInputBorder() : InputBorder.none,
              maxLines: 1,
              enabled: isEnabled,
              child: isEnabled ? const Icon(Icons.save) : const SizedBox(),
              onTap: () {
                productDetailsPageController.updateQuantity(
                  productPageController.selectedProduct.value!.docId!,
                  int.parse(productQuantityController.text),
                );
              },
            ),
            EditField(
              label: 'Description',
              isEnabled: isEnabled,
              controller: productDescriptionController,
              border: isEnabled ? const OutlineInputBorder() : InputBorder.none,
              maxLines: 5,
              enabled: isEnabled,
              child: isEnabled ? const Icon(Icons.save) : const SizedBox(),
              onTap: () {
                productDetailsPageController.updateDescription(
                  productPageController.selectedProduct.value!.docId!,
                  productDescriptionController.text,
                );
              },
            ),
            EditField(
              label: 'Highlight',
              isEnabled: isEnabled,
              controller: productHighController,
              border: isEnabled ? const OutlineInputBorder() : InputBorder.none,
              maxLines: 5,
              enabled: isEnabled,
              child: isEnabled ? const Icon(Icons.save) : const SizedBox(),
              onTap: () {
                productDetailsPageController.updateHighlights(
                  productPageController.selectedProduct.value!.docId!,
                  productHighController.text,
                );
              },
            ),
            SwitchListTile(
              title: const Text('Available'),
              //value: true,
              value: productPageController.selectedProduct.value!.available!,
              onChanged: (value) {
                setState(
                  () {
                    productPageController.selectedProduct.value!.available =
                        value;
                    productDetailsPageController.isAvalable(
                      productPageController.selectedProduct.value!.docId!,
                      value,
                    );
                  },
                );
              },
            ),
            SwitchListTile(
              title: const Text('featured'),
              value: productPageController.selectedProduct.value!.featured!,
              onChanged: (value) {
                setState(
                  () {
                    productPageController.selectedProduct.value!.featured =
                        value;
                    productDetailsPageController.isFeatured(
                      productPageController.selectedProduct.value!.docId!,
                      value,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
