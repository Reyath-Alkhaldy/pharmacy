import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/data/models/medicine.dart';

import '../../../controller/categories/medicines_category_controller.dart';

class MedicineContainer extends StatelessWidget {
  final Medicine medicine;
  const MedicineContainer({
    super.key,
    required this.medicine,
  });

  @override
  Widget build(BuildContext context) {
    MedicinesCategoryControllerImp controller =
        Get.put(MedicinesCategoryControllerImp());
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: boxShadows,
        color: TColors.white,
      ),
      child: MaterialButton(
        onPressed: () {
          controller.goToMedicineDetails(medicine);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                ImageIcon(
                  AssetImage(AppImageIcon.wishlist),
                  color: TColors.darkerGrey,
                )
              ],
            ),
            Expanded(
              child: Center(
                child: Hero(
                  tag: medicine.id,
                  child: Image.network(
                    medicine.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
             medicine.nameEn,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${medicine.price} ريال",
                  style: Theme.of(context).textTheme.bodySmall,

                ),
                const ImageIcon(
                  AssetImage(AppImageIcon.add),
                  color: TColors.secondary,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
