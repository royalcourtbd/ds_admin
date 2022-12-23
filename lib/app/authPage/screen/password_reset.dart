import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final controller = TextEditingController();
  @override
  void dispose() {
    //

    super.dispose();
    controller.dispose();
  }

  Future passwordReset() async {
    Get.dialog(
      const AlertDialog(
        title: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: controller.text.trim());
      Get.back();
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('email sent'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller,
          ),
          ElevatedButton(
            onPressed: passwordReset,
            child: const Text('recet'),
          )
        ],
      ),
    );
  }
}
