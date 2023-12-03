import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/medicines_controller.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/view/medicines/widget/medicine_container.dart';

class MedicineGridView extends StatelessWidget {
  const MedicineGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MedicinesControllerImp controllerImp = Get.put(MedicinesControllerImp());
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.spaceBtwContainerHoriz,
          vertical: TSizes.spaceBtwContainerVert),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controllerImp.medicines.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return MedicineContainer(medicine: controllerImp.medicines[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 230,
        crossAxisCount: 2,
        mainAxisSpacing: 25,
        crossAxisSpacing: 30,
      ),
    );
  }
}
