import 'package:flutter/material.dart';
import 'package:new_maps/controller/user/favorite/favorite_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/views/users/Auth/widget/custom_button.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  final FavoriteControllerImp controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // !   go To Medicine Details
      onTap: () =>
          controller.goToMedicineDetails(controller.favorites[index].medicine),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(8),
        decoration: decoration(TColors.white),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 150,
                width: 150,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CachedNetworkImageWidget(
                    imageUrl: controller.favorites[index].medicine.imageUrl),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.favorites[index].medicine.nameEn),
                      const ImageIcon(
                        AssetImage(AppImageIcon.trash),
                        color: TColors.secondary,
                        size: TSizes.iconLg,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.favorites[index].medicine.price
                          .toStringAsFixed(2)),
                      CustomButton(
                          content: 'أضافة للسلة',
                          width: 120,
                          style: const TextStyle(
                              fontSize: 14, color: TColors.white),
                          onPressed: () {})
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
