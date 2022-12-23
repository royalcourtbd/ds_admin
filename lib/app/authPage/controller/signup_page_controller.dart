import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constans/constans.dart';

class SignUpPageController extends GetxController {
  static SignUpPageController instance = Get.find();

  GlobalKey<FormState> registerFormKey =
      GlobalKey<FormState>(debugLabel: '_signinFormKey');

  var passwordVisibility = true.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    numberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    //
    super.dispose();
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  nameValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your Name';
    } else if (value.length <= 4) {
      return 'Name should be Minimum 5 characters';
    }
    return null;
  }

  emailValidation(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Email';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please Enter A Valid Email Address';
    }
    return null;
  }

  numberValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your Mobile Number';
    } else if (value.length <= 10) {
      return 'Number should be Minimum 11 characters';
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

  void signUpButton() {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerFormKey.currentState!.save();
    authController.createUser(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }
}
