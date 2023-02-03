import 'package:ds_admin/app/productPage/model/brand_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../general/constans/constans.dart';
import '../../../general/constans/url.dart';

class BrandPageController extends GetxController {
  static BrandPageController instance = Get.find();

  RxString selectBrand = 'Select Brand'.obs;
  RxInt brandIndex = 0.obs;
  RxList<BrandModel> brandsList = <BrandModel>[].obs;
  int get brandsListLength => brandsList.length;

  TextEditingController brandNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  GlobalKey<FormState> addBrandKey = GlobalKey<FormState>(debugLabel: '');

  brandNameValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Product Name';
    }
    return null;
  }

  imageUrlValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Image Url';
    }
    return null;
  }

  void addToBrandButton() {
    final isValid = addBrandKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    addBrandKey.currentState!.save();
    submitBrand();
    clearController();
  }

  clearController() {
    Future.delayed(const Duration(seconds: 1));
    brandNameController.clear();
    imageUrlController.clear();
  }

  @override
  void onReady() {
    super.onReady();
    brandsList.bindStream(getBrands());
  }

  Stream<List<BrandModel>> getBrands() => firestore
      .collection(Urls.BRANDS_COLLECTION)
      .orderBy('brandName', descending: false)
      .snapshots()
      .map(
        (query) => query.docs.map((e) {
          return BrandModel(
            docId: e.id,
            brandId: e['brandId'],
            brandName: e['brandName'],
            createdAt: e['createdAt'],
            image: e['image'],
          );
        }).toList(),
      );

  submitBrand() {
    try {
      addBrand(
        UniqueKey().toString().replaceAll('[#', '').replaceAll(']', ''),
        brandNameController.text.trim(),
        DateTime.now().toString(),
        imageUrlController.text.trim(),
      );
      Get.snackbar(
        'Brand added',
        'Brand added to tha Brand List',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        "cannot added to the Brand List",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  addBrand(
    String brandId,
    String brandName,
    String createdAt,
    String image,
  ) async {
    final id = firestore.collection(Urls.BRANDS_COLLECTION).doc().id;
    final docRef = firestore.collection(Urls.BRANDS_COLLECTION).doc(id);
    var brandItem = BrandModel(
      docId: id,
      brandId: brandId,
      brandName: brandName,
      createdAt: createdAt,
      image: image,
    );
    //await firestore.collection(Urls.BRANDS_COLLECTION).add(brandItem.toJson());
    await docRef.set(brandItem.toJson());
  }

  deleteBrand(String id) async {
    await firestore.collection(Urls.BRANDS_COLLECTION).doc(id).delete();
  }
}
