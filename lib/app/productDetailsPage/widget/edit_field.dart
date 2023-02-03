import 'package:flutter/material.dart';

class EditField extends StatelessWidget {
  final bool isEnabled;
  final TextEditingController controller;
  int? maxLines = 1;
  InputBorder? border;
  VoidCallback? onTap;
  Widget? child;
  String? label;
  bool? enabled;
  Widget? prefixIcon;
  TextInputType? keyboardType;
  Function(String)? onChanged;
  EditField({
    Key? key,
    required this.isEnabled,
    required this.controller,
    this.maxLines,
    this.border,
    this.onTap,
    this.child,
    this.enabled,
    this.onChanged,
    this.label,
    this.prefixIcon,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          label: Text(label!),
          border: border,
          suffixIcon: InkWell(
            onTap: onTap,
            child: child,
          ),
        ),
        enabled: isEnabled,
        onChanged: onChanged,
      ),
    );
  }
}
