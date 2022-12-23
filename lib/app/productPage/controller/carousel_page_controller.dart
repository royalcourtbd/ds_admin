import 'package:ds_admin/app/productPage/model/carousel_image_model.dart';
import 'package:ds_admin/app/productPage/model/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constans/constans.dart';
import '../../../general/constans/url.dart';

class CarouselPageController extends GetxController {
  static CarouselPageController instance = Get.find();

  RxList<CarouselImageModel> carouselList = <CarouselImageModel>[].obs;
  RxList<TestModel> testPath = <TestModel>[].obs;

  int get carouselListLength => carouselList.length;

  TextEditingController imageUrlController = TextEditingController();

  clearController() {
    Future.delayed(const Duration(seconds: 1));

    imageUrlController.clear();
  }

  @override
  void onReady() {
    super.onReady();
    carouselList.bindStream(getCarouselImage());
    testPath.bindStream(getTestPath());
  }

  @override
  void onInit() {
    super.onInit();
    carouselList.bindStream(getCarouselImage());
    testPath.bindStream(getTestPath());
  }

  Stream<List<CarouselImageModel>> getCarouselImage() =>
      firestore.collection(Urls.CAROUSEL_IMAGE_COLLECTION).snapshots().map(
            (query) => query.docs
                .map(
                  (e) => CarouselImageModel.fromJson(
                    e.data(),
                  ),
                )
                .toList(),
          );

  Stream<List<TestModel>> getTestPath() =>
      firestore.collection('test_path').snapshots().map(
            (query) => query.docs
                .map(
                  (e) => TestModel.fromJson(e.data()),
                )
                .toList(),
          );

  submitImage() {
    try {
      addCarousel(
        UniqueKey().toString().replaceAll('[#', '').replaceAll(']', ''),
        imageUrlController.text.trim(),
        DateTime.now().toString(),
      );
      Get.snackbar(
        'Image added',
        'Image added to tha Image List',
        snackPosition: SnackPosition.BOTTOM,
      );
      clearController();
    } catch (e) {
      Get.snackbar(
        'Error',
        "cannot added to the Image List",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  addCarousel(
    String imageId,
    String imagePath,
    String createdAt,
  ) async {
    final id = firestore.collection(Urls.CAROUSEL_IMAGE_COLLECTION).doc().id;
    final docRef = firestore.collection(Urls.CAROUSEL_IMAGE_COLLECTION).doc(id);
    var item = CarouselImageModel(
      docId: id,
      imageId: imageId,
      imagePath: imagePath,
      createdAt: createdAt,
    );
    // await firestore
    //     .collection(Urls.CAROUSEL_IMAGE_COLLECTION)
    //     .add(item.toJson());

    await docRef.set(item.toJson());
  }

  deleteCarouselImage(String id) async {
    await firestore.collection(Urls.CAROUSEL_IMAGE_COLLECTION).doc(id).delete();
  }
}
