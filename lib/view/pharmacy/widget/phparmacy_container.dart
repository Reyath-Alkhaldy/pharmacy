import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/app_image_asset.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/models/pharmacy.dart';

class PharmacyContainer extends StatelessWidget {
  final Pharmacy pharmacy;
  const PharmacyContainer({
    super.key,
    required this.pharmacy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow:const [
          BoxShadow(
            color: TColors.softGrey,
             spreadRadius: 4,
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
              color: TColors.grey,
             spreadRadius: 4,
            offset: Offset(-2, -2),
            blurRadius: 4,
          ),
        ] ,
        color:TColors.white,
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
