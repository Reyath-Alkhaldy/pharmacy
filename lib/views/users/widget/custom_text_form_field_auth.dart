// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:new_maps/core/utils/constant/sizes.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  const CustomTextFormFieldAuth(
      {super.key,
      this.suffixIcon,
      required this.label,
      this.obscureText = false,
      this.validator,
      this.keyboardType,
      required this.imageIcon,
      required this.controller});
  final String label;
  final bool obscureText;
  final String imageIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType:keyboardType ,
        validator: validator,
        controller: controller,
        maxLines: 1,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIconColor: Colors.grey,
          prefixIcon: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: ImageIcon(
              AssetImage(imageIcon),
              color: Colors.grey,
              size: TSizes.iconSm,
            ),
          ),
          suffixIcon: suffixIcon,
          label: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Text(label),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
