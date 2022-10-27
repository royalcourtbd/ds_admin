import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ds_admin/app/homePage/cotroller/home_page_controller.dart';
import 'package:ds_admin/app/mainPage/controller/main_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/brand_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/category_page_controller.dart';
import 'package:ds_admin/app/productPage/controller/product_page_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

MainPageController mainPageController = MainPageController.instance;
HomePageController homePageController = HomePageController.instance;
ProductPageController productPageController = ProductPageController.instance;
CategoryPageController categoryPageController = CategoryPageController.instance;
BrandPageController brandPageController = BrandPageController.instance;

ImagePicker imagePicker = ImagePicker();
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
