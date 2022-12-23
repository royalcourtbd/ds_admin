import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../controller/login_page_controller.dart';
import '../widgets/background.dart';
import '../widgets/text_field_for_in_up.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: BackGround(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //color: Colors.amber,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const AutoSizeText(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 39, 168, 56),
                  fontSize: 25,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: Config.screenHeight! * 0.02,
            ),
            Form(
              key: controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFieldForInUp(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
                    validator: (value) {
                      return controller.emailValidation(value!);
                    },
                  ),
                  SizedBox(
                    height: Config.screenHeight! * 0.02,
                  ),

                  Obx(
                    () => TextFieldForInUp(
                      controller: controller.passwordController,
                      keyboardType: TextInputType.text,
                      labelText: 'Password',
                      obscureText: controller.passwordVisibility.value,
                      suffixIcon: InkWell(
                        child: Icon(
                          controller.passwordVisibility.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                        ),
                        onTap: () {
                          controller.passwordVisibility.value =
                              !controller.passwordVisibility.value;
                        },
                      ),
                      validator: ((value) {
                        return controller.passwordValidation(value);
                      }),
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        // Get.to(() => const PasswordResetPage());
                      },
                      child: const AutoSizeText(
                        'Forgot Your Password?',
                        style: TextStyle(
                          fontSize: 12,
                          //color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: Config.screenHeight! * 0.03,
                  // ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.logInButton();
                        //const CircularProgressIndicator();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: Config.screenWidth! * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(0, 20, 194, 43),
                              Color.fromARGB(0, 123, 13, 145)
                            ],
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        //Get.toNamed(RoutesClass.getSignUpPagePageRoute());
                      },
                      child: const AutoSizeText(
                        'Don\'t have an Account? Sign Up',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          //color: Colors.red,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
