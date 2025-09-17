import 'package:flutter/material.dart';
import 'package:login_sigup_page/utils/colors.dart';

class MyTextFild extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool? obscureText;
  final Widget? suffixicons;
  final Widget? prefixIcon;
  final String? hintText;
  final Color? fillColor;

  const MyTextFild({
    super.key,
    this.obscureText,
    this.validator,
    required this.controller,
    this.suffixicons,
    this.prefixIcon,
    required this.hintText,
    required this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 4,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText ?? false,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 18,
            bottom: 18,
            right: 18,
            left: 18,
          ),
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.bottonColor.withValues(alpha: 0.8),
          ),
          suffixIcon: suffixicons,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: TextStyle(color: Colors.red),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: fillColor,
          filled: true,
        ),
      ),
    );
  }
}
