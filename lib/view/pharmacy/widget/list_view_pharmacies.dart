import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/repository/pharmacies_data.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/core/utils/constant/app_image_asset.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';

class ListViewPharmacies extends StatelessWidget {
  const ListViewPharmacies({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        itemCount: phparmaciesData.length,
        itemBuilder: (BuildContext context, int index) {
          return PharmacyTileWidget(index: index,);
        });
  }
}

class PharmacyTileWidget extends StatelessWidget {
  const PharmacyTileWidget({
    super.key, required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GFListTile(
      avatar: InkWell(
        onTap: () {
          Get.toNamed(AppRoute.medicinesScreen);
        },
        child: Image.asset(
          AppImageAsset.pharmacy,
          height: 55,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      color: TColors.white,
      title: InkWell(
          onTap: () {
            Get.toNamed(AppRoute.medicinesScreen);
          },
          child: Text(
            phparmaciesData[index].name,
            style: Theme.of(context).textTheme.titleMedium,
          )),
      subTitle: Column(
        children: [
          Row(
            children: [
              const ImageIcon(
                AssetImage(AppImageIcon.location),
                size: TSizes.iconSm,
              ),
              Text(
                " ${phparmaciesData[index].address}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: TColors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                " ${phparmaciesData[index].address}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: TColors.grey),
              ),
            ],
          ),
        ],
      ),
      // subTitleText: phparmaciesData[index].address,
      icon: const Icon(
        Icons.favorite,
        color: TColors.secondary,
      ),
    );
  }
}
