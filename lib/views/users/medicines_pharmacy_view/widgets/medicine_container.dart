import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/favorite/favorite_controller.dart';
import 'package:new_maps/controller/user/pharmacies/medicines_pharmacy_controller.dart';
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
    final MedicinesPharmacyControllerImp controller =
        Get.put(MedicinesPharmacyControllerImp());
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
            Row(
              children: [
                if (controller.userResponse != null)
                  GetBuilder<FavoriteControllerImp>(
                    builder: (favControl) {
                      return InkWell(
                        onTap: () => favControl.setfavorite(
                            medicine.id, !favControl.isFavorites[medicine.id]),
                        child: ImageIcon(
                          const AssetImage(AppImageIcon.addToFavorite),
                          color: favControl.isFavorites[medicine.id]
                              ? TColors.secondary
                              : TColors.darkerGrey,
                        ),
                      );
                    },
                  ),
              ],
            ),
            Expanded(
              child: Center(
                child: Hero(
                    tag: medicine.id,
                    child:
                        CachedNetworkImageWidget(imageUrl: medicine.imageUrl)),
              ),
            ),
            Text(
              medicine.nameEn,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${medicine.price} ريال",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 10),
                ),
                InkWell(
                  onTap: () async {},
                  child: const ImageIcon(
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
