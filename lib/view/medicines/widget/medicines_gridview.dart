import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/medicines_controller.dart';
import 'package:new_maps/data/models/sub_category.dart';
import 'package:new_maps/view/medicines/widget/medicine_container.dart';

class MedicineGridView extends StatelessWidget {
  MedicineGridView({super.key, this.subCategory});
  final SubCategory? subCategory;
  final MedicinesControllerImp controllerImp =
      Get.put(MedicinesControllerImp());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controllerImp.isLoading.value == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controllerImp.medicines.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return MedicineContainer(medicine: controllerImp.medicines[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 170,
            crossAxisCount: 3,
            // childAspectRatio: 3.5,
            mainAxisSpacing: 15,
            crossAxisSpacing: 10,
          ),
        );
      }
    });
  }
}
