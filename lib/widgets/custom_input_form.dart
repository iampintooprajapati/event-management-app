import 'dart:ui';

import 'package:event_management_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputForm extends StatelessWidget {
  final TextEditingController? controller;
  final IconData icon;
  final String label;
  final String hint;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final VoidCallback? onTap;
  final bool? readOnly;
  final String? Function(String?)? validator;
  const CustomInputForm(
      {super.key,
      required this.icon,
      required this.label,
      required this.hint,
      this.obscureText,
      this.keyboardType,
      this.maxLines,
      this.onTap,
      this.readOnly,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? false,
      onTap: onTap,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: kLightBlue,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
