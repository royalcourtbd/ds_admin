import 'package:ds_admin/app/settingsPage/controller/setting_page_controller.dart';
import 'package:ds_admin/general/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPageView extends GetView<SettingsPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Page')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_forward_ios),
                leading: Image.asset(
                  'assets/icons/delivery.jpg',
                  height: 30,
                ),
                onTap: () {
                  Get.toNamed(RoutesClass.getDeliveryUpdatePageRoute());
                },
                title: const Text('Set Delivery Charge'),
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(Icons.arrow_forward_ios),
                leading: Image.asset(
                  'assets/icons/admob.png',
                  height: 30,
                ),
                onTap: () {
                  Get.toNamed(RoutesClass.getAdsSettingPageRoute());
                },
                title: const Text('Ads Setting Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
