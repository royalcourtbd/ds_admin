import 'package:ds_admin/app/productPage/controller/category_page_controller.dart';
import 'package:ds_admin/app/productPage/widget/text_field.dart';
import 'package:ds_admin/general/constans/constans.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
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
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.addCategoryKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: categoryPageController.imageUrl.value != ''
                                  ? Image.network(
                                      categoryPageController.imageUrl.value,
                                      height: 150,
                                      width: 110,
                                      fit: BoxFit.contain,
                                    )
                                  : categoryPageController.isUploading.value
                                      ? const CircularProgressIndicator(
                                          //color: Colors.white,
                                          )
                                      : const Icon(
                                          Icons.photo,
                                          size: 110,
                                        ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            categoryPageController.imageUrl.value = '';
                            categoryPageController.categoryImage();
                          },
                          child: const Text(
                            'Upload Image',
                          ),
                        ),
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
                            hintText: 'Color name',
                            textEditingController: controller.bgColorController,
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
                return Card(
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 70,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: FancyShimmerImage(
                          boxFit: BoxFit.fill,
                          errorWidget: Image.asset('assets/images/loading.jpg'),
                          imageUrl: controller.categoriesList[index].image!,
                        ),
                      ),
                    ),
                    // leading: Container(
                    //   color: const Color(0xff454f15).withOpacity(0.1),
                    //   height: 70,
                    //   width: 60,
                    //   child: Image.network(
                    //     controller.categoriesList[index].image!,
                    //   ),
                    // ),
                    title: Text(controller.categoriesList[index].categoryName!),
                    trailing: IconButton(
                      onPressed: () {
                        print(
                            controller.categoriesList[index].docId.toString());
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
