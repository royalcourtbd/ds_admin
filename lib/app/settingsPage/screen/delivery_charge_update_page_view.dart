import 'package:ds_admin/app/settingsPage/controller/setting_page_controller.dart';
import 'package:ds_admin/general/constans/constans.dart';
import 'package:ds_admin/general/constans/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../model/delivery_charge_model.dart';

class DeliveryChargeUpdatePageView extends GetView<SettingsPageController> {
  const DeliveryChargeUpdatePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Set Delivery Charge',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => Column(
                  children: [
                    ListTile(
                      title: const Text('Delivery Charge'),
                      trailing: Text(
                          '৳${controller.deliveryChargeSliderValue.round()}'),
                    ),
                    Slider(
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      min: 0,
                      max: 500,
                      divisions: 50,
                      label: controller.deliveryChargeSliderValue
                          .toDouble()
                          .toStringAsFixed(0),
                      value: controller.deliveryChargeSliderValue.toDouble(),
                      onChanged: (value) {
                        controller.setDeliveryCharge(value);
                        controller.checkUpdate();
                      },
                    ),
                    ListTile(
                      title: const Text('Discount'),
                      trailing:
                          Text('${controller.discountSliderValue.round()} %'),
                    ),
                    Slider(
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: controller.discountSliderValue.toStringAsFixed(0),
                      value: controller.discountSliderValue.toDouble(),
                      onChanged: (value) {
                        controller.setDiscount(value);
                        controller.checkUpdate();
                      },
                    ),
                    ListTile(
                      title: const Text('VAT'),
                      trailing: Text('${controller.vatSliderValue.round()} %'),
                    ),
                    Obx(
                      () => Slider(
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey,
                        min: 0,
                        max: 150,
                        divisions: 150,
                        label: controller.vatSliderValue.toStringAsFixed(0),
                        value: controller.vatSliderValue.toDouble(),
                        onChanged: (value) {
                          controller.setVat(value);
                          controller.checkUpdate();
                        },
                      ),
                    ),
                    Obx(
                      () => ElevatedButton(
                        onPressed: controller.needUpdate.value
                            ? () {
                                EasyLoading.show(status: 'Please wait');
                                final model = ChargeHistoryModel(
                                  deliveryFee: double.parse(
                                    controller.deliveryChargeSliderValue.value
                                        .round()
                                        .toString(),
                                  ),
                                  discount: double.parse(
                                    controller.discountSliderValue.value
                                        .round()
                                        .toString(),
                                  ),
                                  vat: double.parse(controller
                                      .vatSliderValue.value
                                      .round()
                                      .toString()),
                                );

                                firestore
                                    .collection(Urls.SettingsCollection)
                                    .doc('charge')
                                    .update(model.toJson())
                                    .then(
                                  (_) {
                                    EasyLoading.dismiss();
                                    // showMsg(context, 'Updated');
                                    controller.needUpdate.value = false;

                                    Get.snackbar(
                                      '',
                                      'Updated',
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  },
                                );
                              }
                            : null,
                        child: const Text('Update'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
