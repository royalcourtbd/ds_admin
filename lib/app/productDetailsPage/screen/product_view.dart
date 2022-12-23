import 'package:ds_admin/app/productDetailsPage/controller/product_details_page_controller.dart';
import 'package:ds_admin/general/utils/config.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';

import '../../productPage/model/product_model.dart';

class ProductView extends GetView<ProductDetailsPageController> {
  const ProductView({super.key, required this.productValue});
  final ProductModel productValue;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
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
                itemCount: productValue.image!.length,
                slideBuilder: (index) {
                  return FancyShimmerImage(
                    imageUrl: productValue.image![index],
                    boxFit: BoxFit.contain,
                    errorWidget: Image.asset('assets/images/loading.jpg'),
                  );
                },
              ),
            ),
            ListTile(
              title: Text('Name : ${productValue.productName!}'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ),
            ListTile(
              title: Text('Price : ${productValue.price!}'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ),
            ListTile(
              title: Text('Discount Price : ${productValue.discountPrice!}'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ),
            ListTile(
              title: Text('Quantity :${productValue.quantity!}'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ),
            ListTile(
              title: Text('Description :${productValue.description!}'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ),
            ListTile(
              title: Text('Highlights : ${productValue.highlights!}'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ),
            SwitchListTile(
              title: const Text('Available'),
              //value: true,
              value: productValue.available!,
              onChanged: (value) =>
                  controller.isAvalable(productValue.docId!, value),
            ),
            SwitchListTile(
              title: const Text('featured'),
              //value: true,
              value: productValue.featured!,
              onChanged: (value) =>
                  controller.isFeatured(productValue.docId!, value),
            ),
          ],
        ),
      ),
    );
  }
}
