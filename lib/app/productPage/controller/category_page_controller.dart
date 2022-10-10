import 'package:ds_admin/app/productPage/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../general/constans/constans.dart';
import '../../../general/constans/url.dart';

class CategoryPageController extends GetxController {
  static CategoryPageController instance = Get.find();

  RxString selectCategory = 'Select Category'.obs;
  RxInt categoryIndex = 0.obs;
  RxList<CategoryModel> categoriesList = <CategoryModel>[].obs;
  int get categoriesListLength => categoriesList.length;

  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryImageController = TextEditingController();
  GlobalKey<FormState> addCategoryKey = GlobalKey<FormState>(debugLabel: '');

  categoryNameValidation(value) {
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
    categoryImageController.clear();

    print('delete');
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    categoriesList.bindStream(getCategories());
  }

  Stream<List<CategoryModel>> getCategories() => firestore
      .collection(Urls.CATEGORIES_COLLECTION)
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map(
        (query) => query.docs
            .map((e) => CategoryModel(
                docId: e.id,
                categoryId: e['categoryId'],
                categoryName: e['categoryName'],
                createdAt: e['createdAt'],
                image: e['image']))
            .toList(),
      );

  submitCategory() {
    try {
      addCategory(
        UniqueKey().toString(),
        categoryNameController.text.trim(),
        DateTime.now().toString(),
        categoryImageController.text.trim(),
      );

      Get.snackbar(
        'Category added',
        'Category added to tha Category List',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        "cannot added to the Category List",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  addCategory(String categoryId, String categoryName, String createdAt,
      String image) async {
    var categoryItem = CategoryModel(
      docId: 'default document id',
      categoryId: categoryId,
      categoryName: categoryName,
      createdAt: createdAt,
      image: image,
    );
    await firestore
        .collection(Urls.CATEGORIES_COLLECTION)
        .add(categoryItem.toJson());
  }

  deleteCategory(String id) async {
    await firestore.collection(Urls.CATEGORIES_COLLECTION).doc(id).delete();
  }
}
