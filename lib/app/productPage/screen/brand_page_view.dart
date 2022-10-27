import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../controller/brand_page_controller.dart';
import '../widget/text_field.dart';

class BrandPageView extends GetView<BrandPageController> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('brand'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.addBrandKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: NewTextField(
                            validator: (value) {
                              return controller.brandNameValidation(value!);
                            },
                            hintText: 'Brand Name',
                            textEditingController:
                                controller.brandNameController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: NewTextField(
                            hintText: 'Image Url',
                            textEditingController:
                                controller.imageUrlController,
                            validator: (value) {
                              return controller.imageUrlValidation(value!);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              controller.addToBrandButton();
                            },
                            child: const Text('Add Cateory')),
                        const Divider(),
                      ],
                    ),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                height: Config.screenHeight! * 0.07,
                width: double.infinity,
                color: Colors.amber,
                child: const Text(
                  'Add Product',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.brandsList.length,
              itemBuilder: (context, index) {
                print(controller.brandsList);
                return Card(
                  child: ListTile(
                    leading: SizedBox(
                      height: 70,
                      width: 60,
                      child: Image.network(
                        controller.brandsList[index].image!,
                      ),
                    ),
                    title: Text(controller.brandsList[index].brandName!),
                    trailing: IconButton(
                      onPressed: () {
                        controller.deleteBrand(
                            controller.brandsList[index].docId.toString());
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
