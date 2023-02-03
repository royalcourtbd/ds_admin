import 'package:ds_admin/general/constans/constans.dart';
import 'package:get/get.dart';

import '../../../general/constans/url.dart';

class ProductDetailsPageController extends GetxController {
  static ProductDetailsPageController instance = Get.find();

  void updateName(String id, var value) async {
    await firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).update(
      {
        'productName': value,
      },
    ).then(
      (value) => Get.snackbar(
        '',
        'Name Updated',
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  void updatePrice(String id, double value) async {
    await firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).update(
      {
        'price': value,
      },
    ).then(
      (value) => Get.snackbar(
        '',
        'Price Updated',
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  void updateDiscountPrice(String id, double value) async {
    await firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).update(
      {
        'discountPrice': value,
      },
    ).then(
      (value) => Get.snackbar(
        '',
        'Discount Price Update',
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  void updateQuantity(String id, int value) async {
    await firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).update(
      {
        'quantity': value,
      },
    ).then(
      (value) => Get.snackbar(
        '',
        'Quantity update',
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  void updateDescription(String id, var value) async {
    await firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).update(
      {
        'description': value,
      },
    ).then(
      (value) => Get.snackbar(
        '',
        'Descripton update',
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  void updateHighlights(String id, var value) async {
    await firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).update(
      {
        'highlights': value,
      },
    ).then(
      (value) => Get.snackbar(
        '',
        'highlights update',
        snackPosition: SnackPosition.TOP,
      ),
    );
  }

  void isAvalable(String id, var value) async {
    await firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).update(
      {
        'available': value,
      },
    );
  }

  void isFeatured(String id, var value) async {
    await firestore.collection(Urls.PRODUCTS_COLLECTION).doc(id).update(
      {
        'featured': value,
      },
    );
  }
}
