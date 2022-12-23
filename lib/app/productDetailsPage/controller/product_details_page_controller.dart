import 'package:ds_admin/general/constans/constans.dart';
import 'package:get/get.dart';

import '../../../general/constans/url.dart';

class ProductDetailsPageController extends GetxController {
  static ProductDetailsPageController instance = Get.find();

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
