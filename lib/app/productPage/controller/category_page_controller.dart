import 'dart:developer';
import 'dart:io';

import 'package:ds_admin/app/productPage/model/category_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../general/constans/constans.dart';
import '../../../general/constans/url.dart';

class CategoryPageController extends GetxController {
  static CategoryPageController instance = Get.find();

  RxString selectCategory = 'Select Category'.obs;
  RxInt categoryIndex = 0.obs;
  RxList<CategoryModel> categoriesList = <CategoryModel>[].obs;
  int get categoriesListLength => categoriesList.length;

  TextEditingController categoryNameController = TextEditingController();

  TextEditingController bgColorController = TextEditingController();
  GlobalKey<FormState> addCategoryKey = GlobalKey<FormState>(debugLabel: '');

  final isUploading = RxBool(false);

  final imageUrl = RxString('');

  final ImageSource _imageSource = ImageSource.gallery;

  Future<String> uploadCategoryImage(XFile xFile) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();

    final photoRef =
        FirebaseStorage.instance.ref().child('Category Image/$imageName');
    final uploadTask = photoRef.putFile(File(xFile.path));
    final snapshot = await uploadTask.whenComplete(() => null);

    return snapshot.ref.getDownloadURL();
  }

  void categoryImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
      isUploading.value = true;

      try {
        final url = await uploadCategoryImage(selectedImage);

        imageUrl.value = url;
        log(url);
        isUploading.value = false;
      } catch (e) {
        //
      } finally {}
    }
  }

  categoryNameValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Product Name';
    }
    return null;
  }

  void addToCategoryButton() {
    final isValid = addCategoryKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    addCategoryKey.currentState!.save();
    submitCategory();
    clearController();
  }

  clearController() {
    Future.delayed(const Duration(seconds: 1));
    categoryNameController.clear();
    'categoryImageController.clear();';
    bgColorController.clear();
  }

  @override
  void onReady() {
    super.onReady();
    categoriesList.bindStream(getCategories());
  }

  Stream<List<CategoryModel>> getCategories() => firestore
      .collection(Urls.CATEGORIES_COLLECTION)
      .orderBy('categoryName', descending: false)
      .snapshots()
      .map(
        (query) => query.docs
            .map(
              (e) => CategoryModel(
                docId: e.id,
                categoryId: e['categoryId'],
                bgColor: e['bgColor'],
                categoryName: e['categoryName'],
                createdAt: e['createdAt'],
                image: e['image'],
              ),
            )
            .toList(),
      );

  submitCategory() {
    try {
      addCategory(
        UniqueKey().toString().replaceAll('[#', '').replaceAll(']', ''),
        bgColorController.text.trim(),
        categoryNameController.text.trim(),
        DateTime.now().toString(),
        imageUrl.value,
      );

      Get.snackbar(
        'Category added',
        'Category added to tha Category List',
        snackPosition: SnackPosition.BOTTOM,
      );
      imageUrl.value = '';
    } catch (e) {
      Get.snackbar(
        'Error',
        "cannot added to the Category List",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  addCategory(String categoryId, String bgColor, String categoryName,
      String createdAt, String image) async {
    final id = firestore.collection(Urls.CATEGORIES_COLLECTION).doc().id;
    final docRef = firestore.collection(Urls.CATEGORIES_COLLECTION).doc(id);
    var categoryItem = CategoryModel(
      docId: id,
      categoryId: categoryId,
      bgColor: bgColor,
      categoryName: categoryName,
      createdAt: createdAt,
      image: image,
    );
    // await firestore
    //     .collection(Urls.CATEGORIES_COLLECTION)
    //     .add(categoryItem.toJson());
    await docRef.set(categoryItem.toJson());
  }

  deleteCategory(String id) async {
    await firestore.collection(Urls.CATEGORIES_COLLECTION).doc(id).delete();
  }
}
