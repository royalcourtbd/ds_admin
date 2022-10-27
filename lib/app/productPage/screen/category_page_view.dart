import 'package:ds_admin/app/productPage/controller/category_page_controller.dart';
import 'package:ds_admin/app/productPage/widget/text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../general/utils/config.dart';

class CategoryPageView extends GetView<CategoryPageController> {
  const CategoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
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
                    key: controller.addCategoryKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: NewTextField(
                            validator: (value) {
                              return controller.categoryNameValidation(value!);
                            },
                            hintText: 'Category Name',
                            textEditingController:
                                controller.categoryNameController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: NewTextField(
                            hintText: 'Image Url',
                            textEditingController:
                                controller.categoryImageController,
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
                              controller.addToCategoryButton();
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
                  'Add Category',
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
              itemCount: controller.categoriesList.length,
              itemBuilder: (context, index) {
                print(controller.categoriesList);
                return Card(
                  child: ListTile(
                    leading: SizedBox(
                      height: 70,
                      width: 60,
                      child: Image.network(
                        controller.categoriesList[index].image!,
                      ),
                    ),
                    title: Text(controller.categoriesList[index].categoryName!),
                    trailing: IconButton(
                      onPressed: () {
                        controller.deleteCategory(
                            controller.categoriesList[index].docId.toString());
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
