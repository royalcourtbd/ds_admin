import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ds_admin/app/homePage/cotroller/home_page_controller.dart';
import 'package:ds_admin/app/mainPage/controller/main_page_controller.dart';
import 'package:ds_admin/app/productDetailsPage/controller/product_details_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/brand_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/carousel_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/category_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/product_page_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/authPage/controller/auth_controller.dart';
import '../../app/authPage/controller/login_page_controller.dart';
import '../../app/authPage/controller/signup_page_controller.dart';

MainPageController mainPageController = MainPageController.instance;
HomePageController homePageController = HomePageController.instance;
ProductPageController productPageController = ProductPageController.instance;
CategoryPageController categoryPageController = CategoryPageController.instance;
BrandPageController brandPageController = BrandPageController.instance;
CarouselPageController carouselPageController = CarouselPageController.instance;
ProductDetailsPageController productDetailsPageController =
    ProductDetailsPageController.instance;

ImagePicker imagePicker = ImagePicker();
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
AuthController authController = AuthController.instance;
LoginPageController loginPageController = LoginPageController.instance;
SignUpPageController signUpPageController = SignUpPageController.instance;
