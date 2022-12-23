import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constans/constans.dart';

class LoginPageController extends GetxController {
  static LoginPageController instance = Get.find();
  GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: '_loginFormKey');
  var passwordVisibility = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  emailValidation(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Email';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please Enter A Valid Email Address';
    }
    return null;
  }

  passwordValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your Password';
    } else if (value.length <= 7) {
      return 'password should be 8 characters';
    }
    return null;
  }

  void logInButton() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    authController.signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    // Get.dialog(
    //   const AlertDialog(
    //     title: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   ),
    // );
  }
}
