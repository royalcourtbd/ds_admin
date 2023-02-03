import 'dart:developer';
import 'dart:io';

import 'package:ds_admin/app/productPage/model/carousel_image_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../general/constans/constans.dart';
import '../../../general/constans/url.dart';

class CarouselPageController extends GetxController {
  static CarouselPageController instance = Get.find();

  RxList<CarouselImageModel> carouselList = <CarouselImageModel>[].obs;

  int get carouselListLength => carouselList.length;

  final isUploading = RxBool(false);

  final imageUrl = RxString('');

  final ImageSource _imageSource = ImageSource.gallery;

  Future<String> uploadBannerImage(XFile xFile) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();

    final photoRef =
        FirebaseStorage.instance.ref().child('Carousel Image/$imageName');
    final uploadTask = photoRef.putFile(File(xFile.path));
    final snapshot = await uploadTask.whenComplete(() => null);

    return snapshot.ref.getDownloadURL();
  }

  void carouselImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
      isUploading.value = true;

      try {
        final url = await uploadBannerImage(selectedImage);

        imageUrl.value = url;
        log(url);
        isUploading.value = false;
      } catch (e) {
        //
      } finally {}
    }
  }

  @override
  void onReady() {
    super.onReady();
    carouselList.bindStream(getCarouselImage());
  }

  @override
  void onInit() {
    super.onInit();
    carouselList.bindStream(getCarouselImage());
  }

  Stream<List<CarouselImageModel>> getCarouselImage() => firestore
      .collection(Urls.CAROUSEL_IMAGE_COLLECTION)
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map(
        (query) => query.docs
            .map(
              (e) => CarouselImageModel.fromJson(
                e.data(),
              ),
            )
            .toList(),
      );

  submitImage() {
    try {
      addCarousel(
        UniqueKey().toString().replaceAll('[#', '').replaceAll(']', ''),
        imageUrl.value,
        DateTime.now().toString(),
      );
      Get.snackbar(
        'Image added',
        'Image added to tha Image List',
        snackPosition: SnackPosition.BOTTOM,
      );
      imageUrl.value = '';
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
