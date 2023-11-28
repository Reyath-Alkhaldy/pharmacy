import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/medicines_controller.dart';
import 'package:new_maps/core/constant/routes.dart';
import 'package:new_maps/data/models/medicine.dart';
import 'package:new_maps/view/Auth/widget/custom_button_auth.dart';

class MedicineContainer extends StatelessWidget {
  final Medicine medicine;
  const MedicineContainer({
    super.key,
    required this.medicine,
  });

  @override
  Widget build(BuildContext context) {
    MedicinesControllerImp controller = Get.put(MedicinesControllerImp());
    return Container(
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: MaterialButton(
        onPressed: () {
         controller.goToMedicineDetails(medicine);
        },
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag:medicine.id ,
                  child: Image.asset(
                    medicine.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
              medicine.nameEn,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            CustomButtonAuth(
              content: 'Add to Cart'.tr,
              onPressed: () {
                // controller.goToPharmacyScreen();
         controller.goToMedicineDetails(medicine);

              },
            ),
          ],
        ),
      ),
    );
  }
}
