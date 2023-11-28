
import 'package:flutter/material.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  const CustomTextFormFieldAuth({
    super.key,
    required this.label,
    this.obscureText = false,
  });
  final String label;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: obscureText!,
        decoration: InputDecoration(
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
