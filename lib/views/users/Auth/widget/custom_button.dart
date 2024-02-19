// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.content,
    required this.onPressed,
    this.width = double.infinity, this.style,
  });
  final String content;
  final VoidCallback? onPressed;
  final TextStyle? style;
  // final bool isAuthButton;
  double? width;
  @override
  Widget build(BuildContext context) {
    // width = isAuthButton ? MediaQuery.of(context).size.width : width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: TColors.primary,
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF3CC7B4).withOpacity(0.3),
                  offset: const Offset(2, 4),
                  blurRadius: 2,
                  spreadRadius: 2)
            ]),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            content,
            style: style ?? const TextStyle(color: TColors.white),
          ),
        ),
      ),
    );
  }
}
