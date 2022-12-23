import 'package:ds_admin/app/productPage/controller/product_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class NewTextField extends GetView<ProductPageController> {
  Function(String)? onChanged;
  Function()? onTap;
  Function(String?)? onSaved;
  String? Function(String?)? validator;
  TextInputType? keyboardType;

  String hintText;

  FocusNode? focusNode;
  Widget? prefixIcon;
  List<TextInputFormatter>? inputFormatters;

  TextEditingController textEditingController;

  NewTextField({
    Key? key,
    required this.hintText,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.inputFormatters,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    required this.textEditingController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        validator: validator,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          hintText: hintText,
          filled: true,
        ),
      ),
    );
  }
}
