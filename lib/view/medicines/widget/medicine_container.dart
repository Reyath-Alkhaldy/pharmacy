import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/medicines_controller.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/data/models/medicine.dart';
import 'package:new_maps/view/Auth/widget/custom_button_auth.dart';
import 'package:new_maps/view/medicines/widget/add_to_cart_widget.dart';

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
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
        ],
        color: TColors.white,
      ),
      child: MaterialButton(
        onPressed: () {
          controller.goToMedicineDetails(medicine);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Hero(
                  tag: medicine.id,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('1000ريال'),
                CustomIconButton(
                  onPressed: () {
                    // controller.goToPharmacyScreen();
                    controller.goToMedicineDetails(medicine);
                  },
                  color: TColors.secondary,
                  size: TSizes.iconMd,
                  icon: Icons.add,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
