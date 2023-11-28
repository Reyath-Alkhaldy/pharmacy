import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/constant/app_image_asset.dart';
import 'package:new_maps/core/constant/routes.dart';
import 'package:new_maps/data/models/pharmacy.dart';

class PharmacyContainer extends StatelessWidget {
  final Pharmacy pharmacy;
  const PharmacyContainer({
    Key? key,
    required this.pharmacy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: const Color(0xffF0FEFE),
      ),
      child: MaterialButton(
        onPressed: () {
          Get.toNamed(AppRoute.medicinesScreen);
        },
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  AppImageAsset.pharmacy,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              pharmacy.name.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
