import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/favorite/favorite_controller.dart';
import 'package:new_maps/controller/user/pharmacies/medicines_pharmacy_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/data/models/sub_category.dart';
import 'package:new_maps/views/users/medicines_pharmacy_view/widgets/medicine_container.dart';

class MedicineGridView extends StatelessWidget {
  const MedicineGridView({super.key, this.subCategory});
  final SubCategory? subCategory;

  @override
  Widget build(BuildContext context) {
    final MedicinesPharmacyControllerImp controllerImp =
        Get.put(MedicinesPharmacyControllerImp());
    final favoriteController = Get.put(FavoriteControllerImp());

    return Obx(() => HandlingDataView(
          statusRequest: controllerImp.statusRequest,
          widget: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controllerImp.medicines.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                
                return MedicineContainer(
                    medicine: controllerImp.medicines.value[index]);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 170,
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 5,
              ) // childAspectRatio: 3.5,

              ),
        ));
    // });
  }
}
