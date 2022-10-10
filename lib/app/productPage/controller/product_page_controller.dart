import 'package:ds_admin/app/productPage/model/product_model.dart';
import 'package:ds_admin/general/constans/constans.dart';
import 'package:ds_admin/general/constans/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPageController extends GetxController {
  static ProductPageController instance = Get.find();
  RxList allProductsList = [].obs;

  int get productListLength => allProductsList.length;

  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();
  TextEditingController highlightsController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  GlobalKey<FormState> addProductKey =
      GlobalKey<FormState>(debugLabel: 'addProductFormKey');

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    allProductsList.bindStream(getProducts());
  }

  productNameValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Product Name';
    }
    return null;
  }

  priceValidation(String value) {
    if (value.isEmpty) {
      return 'Please Enter Product price';
    }
    return null;
  }

  discountPriceValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter discount price';
    }
    return null;
  }

  imageUrlValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Image Url';
    }
    return null;
  }

  quantityValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Quantity';
    }
    return null;
  }

  descriptionValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Description';
    }
    return null;
  }

  highlightsValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter product highlights';
    }
    return null;
  }

  void addToProductButton() {
    final isValid = addProductKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    addProductKey.currentState!.save();
    addProductButton();
  }

  clearController() {
    Future.delayed(const Duration(seconds: 1));
    productNameController.clear();
    descriptionController.clear();
    priceController.clear();
    quantityController.clear();
    discountPriceController.clear();
    imageController.clear();
    highlightsController.clear();

    print('delete');
  }

//fetch Data from firebase
  Stream<List<ProductModel>> getProducts() => firestore
      .collection(Urls.PRODUCTS_COLLECTION)
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map(
        (query) => query.docs
            .map(
              (eatchItem) => ProductModel(
                docId: eatchItem.id,
                productName: eatchItem["productName"],
                image: eatchItem["image"],
                price: eatchItem['price'],
                discountPrice: eatchItem['discountPrice'],
                productId: eatchItem['productId'],
                category: eatchItem['category'],
                brand: eatchItem['brand'],
                createdAt: eatchItem['createdAt'],
                description: eatchItem['description'],
                quantity: eatchItem['quantity'],
                rate: eatchItem['rate'],
                highlights: eatchItem['highlights'],
                totalSell: eatchItem['totalSell'],
              ),
            )
            .toList(),
      );

  addProductButton() async {
    try {
      Future.delayed(const Duration(seconds: 1));
      Get.dialog(
        const AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
      addProduct(
        categoryPageController.selectCategory.value,
        brandPageController.selectBrand.value,
        productNameController.text.trim(),
        imageController.text.trim(),
        descriptionController.text.trim(),
        highlightsController.text.trim(),
        discountPriceController.text.trim(),
        DateTime.now().toString(),
        priceController.text.trim(),
        quantityController.text.trim(),
        '0',
        0.toString(),
      );
      clearController();
      Get.back();
      Get.snackbar(
        'Item added',
        'product added to tha Product List',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        "cannot added to the Product List",
        snackPosition: SnackPosition.BOTTOM,
      ); //
    }
  }

  ///
  ///
  ///write data to firebase
  addProduct(
    String category,
    String brand,
    String productName,
    String image,
    String description,
    String highlights,
    String discountPrice,
    String createdAt,
    String price,
    String quantity,
    String totalSell,
    String rate,
  ) async {
    var singleItem = ProductModel(
      productId: UniqueKey().toString(),
      docId: "default document id",
      category: category,
      brand: brand,
      productName: productName,
      image: image,
      description: description,
      highlights: highlights,
      discountPrice: discountPrice,
      createdAt: createdAt,
      price: price,
      quantity: quantity,
      totalSell: totalSell,
      rate: rate,
    );

    await firestore.collection(Urls.PRODUCTS_COLLECTION).add(
          singleItem.toJson(),
        );
  }

  deleteProduct(String id) async {
    await firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).delete();
  }
}
