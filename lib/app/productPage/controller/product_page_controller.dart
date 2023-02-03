import 'dart:developer';
import 'dart:io';

import 'package:ds_admin/app/productPage/model/product_model.dart';
import 'package:ds_admin/general/constans/constans.dart';
import 'package:ds_admin/general/constans/url.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductPageController extends GetxController {
  static ProductPageController instance = Get.find();
  final allProductsList = RxList<ProductModel>([]);
  final selectedProduct = Rx<ProductModel?>(null);

  int get productListLength => allProductsList.length;

  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();
  TextEditingController highlightsController = TextEditingController();

  GlobalKey<FormState> addProductKey =
      GlobalKey<FormState>(debugLabel: 'addProductFormKey');

  @override
  void onReady() {
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
    EasyLoading.show(status: 'Please Wait');
    addProductButton();
  }

  clearController() {
    Future.delayed(const Duration(seconds: 1));
    productNameController.clear();
    descriptionController.clear();
    priceController.clear();
    quantityController.clear();
    discountPriceController.clear();

    highlightsController.clear();
  }

  final isUploading = RxBool(false);
  final isUploading1 = RxBool(false);
  final isUploading2 = RxBool(false);
  final mainImageUrl = RxString('');
  final optionalUrl1 = RxString('');
  final optionalUrl2 = RxString('');
  final ImageSource _imageSource = ImageSource.gallery;

  Future<String> updateImage(XFile xFile) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();

    final photoRef =
        FirebaseStorage.instance.ref().child('Products Image/$imageName');
    final uploadTask = photoRef.putFile(File(xFile.path));
    final snapshot = await uploadTask.whenComplete(() => null);

    return snapshot.ref.getDownloadURL();
  }

  void mainImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
      isUploading.value = true;

      try {
        final url = await updateImage(selectedImage);

        mainImageUrl.value = url;
        log(url);
        isUploading.value = false;
      } catch (e) {
        //
      } finally {}
    }
  }

  void optionalImage1() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
      isUploading1.value = true;

      try {
        final url = await updateImage(selectedImage);

        optionalUrl1.value = url;
        log(url);
        isUploading1.value = false;
      } catch (e) {
        //
      } finally {}
    }
  }

  void optionalImage2() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
      isUploading2.value = true;

      try {
        final url = await updateImage(selectedImage);

        optionalUrl2.value = url;
        log(url);
        isUploading2.value = false;
      } catch (e) {
        //
      } finally {}
    }
  }

//fetch Data from firebase

  Stream<List<ProductModel>> getProducts() => firestore
          .collection(Urls.PRODUCTS_COLLECTION)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map(
        (query) {
          return query.docs
              .map(
                (item) => ProductModel.fromJson(item.data()),
              )
              .toList();
        },
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
      if (optionalUrl1.value == '' && optionalUrl2.value == '') {
        addProduct(
          categoryPageController.selectCategory.value,
          brandPageController.selectBrand.value,
          productNameController.text.trim(),
          [
            mainImageUrl.value,
          ],
          descriptionController.text.trim(),
          highlightsController.text.trim(),
          double.parse(discountPriceController.text.trim()),
          DateTime.now().toString(),
          double.parse(priceController.text.trim()),
          int.parse(quantityController.text.trim()),
          0,
          0,
        );
      } else if (optionalUrl2.value == '') {
        addProduct(
          categoryPageController.selectCategory.value,
          brandPageController.selectBrand.value,
          productNameController.text.trim(),
          [
            mainImageUrl.value,
            optionalUrl1.value,
          ],
          descriptionController.text.trim(),
          highlightsController.text.trim(),
          double.parse(discountPriceController.text.trim()),
          DateTime.now().toString(),
          double.parse(priceController.text.trim()),
          int.parse(quantityController.text.trim()),
          0,
          0,
        );
      } else if (optionalUrl1.value == '') {
        addProduct(
          categoryPageController.selectCategory.value,
          brandPageController.selectBrand.value,
          productNameController.text.trim(),
          [
            mainImageUrl.value,
            optionalUrl2.value,
          ],
          descriptionController.text.trim(),
          highlightsController.text.trim(),
          double.parse(discountPriceController.text.trim()),
          DateTime.now().toString(),
          double.parse(priceController.text.trim()),
          int.parse(quantityController.text.trim()),
          0,
          0,
        );
      } else {
        addProduct(
          categoryPageController.selectCategory.value,
          brandPageController.selectBrand.value,
          productNameController.text.trim(),
          [
            mainImageUrl.value,
            optionalUrl1.value,
            optionalUrl2.value,
          ],
          descriptionController.text.trim(),
          highlightsController.text.trim(),
          double.parse(discountPriceController.text.trim()),
          DateTime.now().toString(),
          double.parse(priceController.text.trim()),
          int.parse(quantityController.text.trim()),
          0,
          0,
        );
      }

      clearController();
      Get.back();
      Get.snackbar(
        'Item added',
        'product added to tha Product List',
        snackPosition: SnackPosition.BOTTOM,
      );

      mainImageUrl.value = '';
      optionalUrl1.value = '';
      optionalUrl2.value = '';

      EasyLoading.dismiss(animation: false);
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
    List<String> image,
    String description,
    String highlights,
    double discountPrice,
    String createdAt,
    double price,
    int quantity,
    int totalSell,
    double rate,
  ) async {
    final id = firestore.collection(Urls.PRODUCTS_COLLECTION).doc().id;
    final docRef = firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id);
    var singleItem = ProductModel(
      featured: false,
      available: true,
      productId:
          UniqueKey().toString().replaceAll('[#', '').replaceAll(']', ''),
      docId: id,
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

    // await firestore.collection(Urls.PRODUCTS_COLLECTION).add(
    //       singleItem.toJson(),
    //     );

    await docRef.set(singleItem.toJson());
  }

  deleteProduct(String id) async {
    await firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).delete();
  }
}
