import 'package:ds_admin/app/homePage/screen/home_page_view.dart';
import 'package:ds_admin/app/mainPage/screen/main_page_view.dart';
import 'package:ds_admin/app/productPage/screen/add_product_page.dart';
import 'package:ds_admin/app/productPage/screen/carousel_image_view.dart';
import 'package:ds_admin/app/productPage/screen/category_page_view.dart';
import 'package:ds_admin/app/productPage/screen/product_page_view.dart';
import 'package:get/get.dart';

import '../../app/productPage/screen/brand_page_view.dart';

class RoutesClass {
  static String mainPage = '/';
  // static String accountPage = '/accountPage';
  static String brandPage = '/brandPage';
  static String categoryPage = '/categoryPage';
  // static String exchangePage = '/exchangePage';
  static String homePage = '/homepage';
  // static String profilePage = '/profilePage';
  static String addProduct = '/addProduct';
  // static String sellPage = '/sellPage';
  // static String sellHistory = '/sellHistory';
  // static String loginPage = '/loginPage';
  // static String signUpPage = '/signUpPage';
  static String productPage = '/productPage';
  static String carouselPage = '/carouselPage';

  static String getMainRoute() => mainPage;
  // static String getAccountPageRoute() => accountPage;
  static String getBrandPageRoute() => brandPage;
  static String getCategoryPageRoute() => categoryPage;
  // static String getExchangePageRoute() => exchangePage;
  static String getHomePageRoute() => homePage;
  // static String getProfilePageRoute() => profilePage;
  static String getAddProductPageRoute() => addProduct;
  // static String getSellPageRoute() => sellPage;
  // static String getSellHistoryPageRoute() => sellHistory;
  // static String getLoginPageRoute() => loginPage;
  // static String getSignUpPagePageRoute() => signUpPage;
  static String getProductPageRoute() => productPage;
  static String getCarouselPageRoute() => carouselPage;

  static List<GetPage> routes = [
    GetPage(
      page: () => MainPageView(),
      name: mainPage,
    ),
    GetPage(
      page: () => HomePageView(),
      name: homePage,
    ),
    GetPage(
      page: () => const ProductPageView(),
      name: productPage,
    ),
    GetPage(
      page: () => const AddProductPage(),
      name: addProduct,
    ),
    GetPage(
      page: () => const CategoryPageView(),
      name: categoryPage,
    ),
    GetPage(
      page: () => const BrandPageView(),
      name: brandPage,
    ),
    GetPage(
      page: () => CarouselImageView(),
      name: carouselPage,
    ),
  ];
}
