import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/categories/medicines_category_controller.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/data/models/medicine.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';

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
                  AssetImage(AppImageIcon.addToFavorite),
                  color: TColors.darkerGrey,
                )
              ],
            ),
            Expanded(
              child: Center(
                child: Hero(
                  tag: medicine.id,
                  child:  CachedNetworkImageWidget(imageUrl: medicine.imageUrl)
                ),
              ),
            ),
            Text(
             medicine.nameEn,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${medicine.price} ريال",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),

                ),
                const InkWell(
                  child: ImageIcon(
                    AssetImage(AppImageIcon.addToCart),
                    color: TColors.secondary,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
