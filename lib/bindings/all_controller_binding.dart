import 'package:ds_admin/app/homePage/cotroller/home_page_controller.dart';
import 'package:ds_admin/app/mainPage/controller/main_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/brand_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/category_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/product_page_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<MainPageController>(
      () => MainPageController(),
    );
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
    Get.lazyPut<ProductPageController>(
      () => ProductPageController(),
      fenix: true,
    );
    Get.lazyPut<CategoryPageController>(
      () => CategoryPageController(),
      fenix: true,
    );
    Get.lazyPut<BrandPageController>(
      () => BrandPageController(),
      fenix: true,
    );
  }
}
