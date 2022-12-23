import 'package:ds_admin/app/productPage/controller/carousel_page_controller.dart';
import 'package:ds_admin/app/productPage/widget/text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../general/utils/config.dart';

class CarouselImageView extends GetView<CarouselPageController> {
  CarouselImageView({Key? key}) : super(key: key);

  List test = ['hello', 'hello2'];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: NewTextField(
                          hintText: 'Image Url',
                          textEditingController: controller.imageUrlController,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            controller.submitImage();
                          },
                          child: const Text('Add Image')),
                      const Divider(),
                    ],
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
                  'Add Carousel Image',
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
              itemCount: controller.testPath.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Center(
                    child: Text(controller.testPath[index].path.toString()),
                  ),
                );
              },
            ),
          ),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.carouselList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Container(
                      color: const Color(0xff454f15).withOpacity(0.1),
                      height: 70,
                      width: 60,
                      child: Image.network(
                        controller.carouselList[index].imagePath!,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    title: Text(
                      'docId : ${controller.carouselList[index].docId!}',
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        controller.deleteCarouselImage(
                            controller.carouselList[index].docId.toString());
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
