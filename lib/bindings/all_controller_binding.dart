import 'package:ds_admin/app/authPage/controller/auth_controller.dart';
import 'package:ds_admin/app/authPage/controller/login_page_controller.dart';
import 'package:ds_admin/app/authPage/controller/signup_page_controller.dart';
import 'package:ds_admin/app/homePage/cotroller/home_page_controller.dart';
import 'package:ds_admin/app/mainPage/controller/main_page_controller.dart';
import 'package:ds_admin/app/productDetailsPage/controller/product_details_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/brand_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/carousel_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/category_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/product_page_controller.dart';
import 'package:ds_admin/app/settingsPage/controller/setting_page_controller.dart';
import 'package:get/get.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
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
    Get.lazyPut<CarouselPageController>(
      () => CarouselPageController(),
      fenix: true,
    );
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(),
      fenix: true,
    );
    Get.lazyPut<SignUpPageController>(
      () => SignUpPageController(),
      fenix: true,
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
      fenix: true,
    );
    Get.lazyPut<SettingsPageController>(
      () => SettingsPageController(),
      fenix: true,
    );
    Get.lazyPut<ProductDetailsPageController>(
        () => ProductDetailsPageController(),
        fenix: true);
  }
}
