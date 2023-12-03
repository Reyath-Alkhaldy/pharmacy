import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/color.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn(
      {Key? key,
      required this.textone,
      required this.texttwo,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(texttwo,
              style: const TextStyle(
                  color: TColors.accent, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
