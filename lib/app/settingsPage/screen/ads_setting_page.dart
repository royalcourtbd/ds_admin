import 'package:ds_admin/app/settingsPage/controller/setting_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constans/constans.dart';
import '../../productDetailsPage/widget/edit_field.dart';

class AdsSettingPageView extends GetView<SettingsPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ads Unit ID',
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.isEnabled.value = !controller.isEnabled.value;
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => EditField(
                label: 'Banner 1',
                isEnabled: controller.isEnabled.value,
                controller: controller.banner1Controller.value,
                border: controller.isEnabled.value
                    ? const OutlineInputBorder()
                    : InputBorder.none,
                maxLines: 2,
                enabled: controller.isEnabled.value,
                child: controller.isEnabled.value
                    ? const Icon(Icons.save)
                    : const SizedBox(),
                onTap: () {
                  settingsPageController.updateBanner1(
                    'adsUnitId',
                    controller.banner1Controller.value.text,
                  );
                },
                onChanged: (p0) {
                  controller.banner1Controller.value.text =
                      controller.googleAdsModel.value!.banner1!;
                },
              ),
            ),
            Obx(() => EditField(
                  label: 'Banner 2',
                  isEnabled: controller.isEnabled.value,
                  controller: controller.banner2Controller.value,
                  border: controller.isEnabled.value
                      ? const OutlineInputBorder()
                      : InputBorder.none,
                  maxLines: 2,
                  enabled: controller.isEnabled.value,
                  child: controller.isEnabled.value
                      ? const Icon(Icons.save)
                      : const SizedBox(),
                  onTap: () {
                    settingsPageController.updateBanner2(
                      'adsUnitId',
                      controller.banner2Controller.value.text,
                    );
                  },
                )),
            Obx(() => EditField(
                  label: 'interstitial 1',
                  isEnabled: controller.isEnabled.value,
                  controller: controller.interstitial1Controller.value,
                  border: controller.isEnabled.value
                      ? const OutlineInputBorder()
                      : InputBorder.none,
                  maxLines: 2,
                  enabled: controller.isEnabled.value,
                  child: controller.isEnabled.value
                      ? const Icon(Icons.save)
                      : const SizedBox(),
                  onTap: () {
                    settingsPageController.updateinterstitial1(
                      'adsUnitId',
                      controller.interstitial1Controller.value.text,
                    );
                  },
                )),
            Obx(
              () => EditField(
                label: 'interstitial 2',
                isEnabled: controller.isEnabled.value,
                controller: controller.interstitial2Controller.value,
                border: controller.isEnabled.value
                    ? const OutlineInputBorder()
                    : InputBorder.none,
                maxLines: 2,
                enabled: controller.isEnabled.value,
                child: controller.isEnabled.value
                    ? const Icon(Icons.save)
                    : const SizedBox(),
                onTap: () {
                  settingsPageController.updateinterstitial2(
                    'adsUnitId',
                    controller.interstitial2Controller.value.text,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
