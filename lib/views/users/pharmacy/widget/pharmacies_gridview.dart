import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/pharmacies/pharmacy_paginate_controller.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/views/users/pharmacy/widget/pharmacy_container.dart';

class PharmaciesGridView extends StatelessWidget {
  const PharmaciesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PharmacyPaginateControllerImp pharmacyControllerImp =
        Get.find<PharmacyPaginateControllerImp>();
    return SingleChildScrollView(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.spaceBtwItems + 16,
            vertical: TSizes.spaceBtwContainerVert),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pharmacyControllerImp.pharmacies.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          // ignore: invalid_use_of_protected_member
          return PharmacyContainer(pharmacy: pharmacyControllerImp.pharmacies.value[index]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 200,
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
        ),
      ),
    );
  }
}
