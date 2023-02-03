import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ds_admin/app/settingsPage/model/delivery_charge_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constans/constans.dart';
import '../../../general/constans/url.dart';
import '../model/google_ads_model.dart';

class SettingsPageController extends GetxController {
  static SettingsPageController instance = Get.find();
  RxBool needUpdate = false.obs;
  RxBool isEnabled = false.obs;
  Rx<TextEditingController> banner1Controller =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> banner2Controller =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> interstitial1Controller =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> interstitial2Controller =
      TextEditingController(text: '').obs;

  Rx<ChargeHistoryModel?> charge = ChargeHistoryModel().obs;
  Rx<GoogleAdsModel?> googleAdsModel = GoogleAdsModel().obs;

  Rx<double> deliveryChargeSliderValue = 0.0.obs;
  Rx<double> discountSliderValue = 0.0.obs;
  Rx<double> vatSliderValue = 0.0.obs;

  void setDeliveryCharge(double charge) {
    deliveryChargeSliderValue.value =
        charge; //updating the value of Rx Variable.
  }

  void setDiscount(double discount) {
    discountSliderValue.value = discount; //updating the value of Rx Variable.
  }

  void setVat(double vat) {
    vatSliderValue.value = vat; //updating the value of Rx Variable.
  }

  @override
  void onInit() {
    getChargeFromDB();
    getAdsUnitID();

    super.onInit();
  }

  getChargeFromDB() async {
    try {
      firestore
          .collection(Urls.SettingsCollection)
          .doc('charge')
          .snapshots()
          .listen((event) {
        charge.value = ChargeHistoryModel.fromJson(event.data()!);

        deliveryChargeSliderValue.value = charge.value!.deliveryFee!;
        discountSliderValue.value = charge.value!.discount!;
        vatSliderValue.value = charge.value!.vat!;
      });
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  void checkUpdate() {
    needUpdate.value =
        deliveryChargeSliderValue.value != charge.value!.deliveryFee! ||
            discountSliderValue.value != charge.value!.discount! ||
            vatSliderValue.value != charge.value!.vat!;
  }

  getAdsUnitID() async {
    try {
      firestore
          .collection(Urls.SettingsCollection)
          .doc('adsUnitId')
          .snapshots()
          .listen(
        (event) {
          googleAdsModel.value = GoogleAdsModel.fromJson(event.data()!);
          banner1Controller.value.text = googleAdsModel.value!.banner1!;
          banner2Controller.value.text = googleAdsModel.value!.banner2!;
          interstitial1Controller.value.text =
              googleAdsModel.value!.interstitial1!;
          interstitial2Controller.value.text =
              googleAdsModel.value!.interstitial2!;
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  void updateBanner1(String id, var value) async {
    await firestore.collection(Urls.SettingsCollection).doc(id).update(
      {
        'banner1': value,
      },
    ).then(
      (value) => Get.snackbar(
        '',
        'banner1 update',
        snackPosition: SnackPosition.BOTTOM,
      ),
    );
  }

  void updateBanner2(String id, var value) async {
    await firestore.collection(Urls.SettingsCollection).doc(id).update(
      {
        'banner2': value,
      },
    ).then(
      (value) => Get.snackbar(
        '',
        'banner2 update',
        snackPosition: SnackPosition.BOTTOM,
      ),
    );
  }

  void updateinterstitial1(String id, var value) async {
    await firestore.collection(Urls.SettingsCollection).doc(id).update(
      {
        'interstitial1': value,
      },
    ).then(
      (value) => Get.snackbar(
        '',
        'interstitial1 update',
        snackPosition: SnackPosition.BOTTOM,
      ),
    );
  }

  void updateinterstitial2(String id, var value) async {
    await firestore.collection(Urls.SettingsCollection).doc(id).update(
      {
        'interstitial2': value,
      },
    ).then(
      (value) => Get.snackbar(
        '',
        'interstitial2 update',
        snackPosition: SnackPosition.BOTTOM,
      ),
    );
  }
}
