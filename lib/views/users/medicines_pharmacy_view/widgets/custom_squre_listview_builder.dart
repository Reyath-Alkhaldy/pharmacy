import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import '../../../../controller/user/pharmacies/medicines_pharmacy_controller.dart';


class CustomSqureListViewBuilder extends StatelessWidget {
  const CustomSqureListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MedicinesControllerImp controllerImp = Get.put(MedicinesControllerImp());

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0),
      height: 60,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: TSizes.buttonWidth - 30,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: TColors.softGrey,
                    spreadRadius: 2,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: TColors.grey,
                    spreadRadius: 2,
                    offset: Offset(-2, -2),
                    blurRadius: 4,
                  ),
                ],
                color: TColors.white,
              ),
              child: const Text(
             'nameAr',
                // controllerImp.medicines[index].nameAr,
              ),
            ),
          );
        },
      ),
    );
  }
}
