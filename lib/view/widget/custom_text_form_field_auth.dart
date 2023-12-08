import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  const CustomTextFormFieldAuth({
    super.key,
    required this.label,
    this.obscureText = false,
    required this.imageIcon,
  });
  final String label;
  final bool? obscureText;
  final String imageIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: obscureText!,
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
          suffixIcon: obscureText!
              ? const Icon(
                  Icons.visibility,
                )
              : null,
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
