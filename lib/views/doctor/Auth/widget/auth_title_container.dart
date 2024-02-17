import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class AuthTitleDoctorWidget extends StatelessWidget {
  const AuthTitleDoctorWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: const BoxDecoration(
        color: TColors.primary,
        // borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: TColors.white),
      ),
    );
  }
}
