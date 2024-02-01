import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn(
      {super.key,
      required this.textone,
      required this.texttwo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        const Gap(10),
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
