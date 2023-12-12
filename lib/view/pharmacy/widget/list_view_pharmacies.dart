import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/repository/pharmacies_data.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/core/utils/constant/app_image_asset.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';

import '../../medicines/widget/custom_text_form_field_search.dart';

class ListViewPharmacies extends StatefulWidget {
  const ListViewPharmacies({super.key});

  @override
  State<ListViewPharmacies> createState() => _ListViewPharmaciesState();
}

class _ListViewPharmaciesState extends State<ListViewPharmacies>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFormFieldSearch(),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                  vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
              itemCount: phparmaciesData.length,
              itemBuilder: (BuildContext context, int index) {
                return PharmacyTileWidget(
                  index: index,
                );
              }),
        ],
      ),
    );
  }
}

class PharmacyTileWidget extends StatelessWidget {
  const PharmacyTileWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.medicinesScreen);
      },
      child: GFListTile(
        avatar: InkWell(
          onTap: () {
            Get.toNamed(AppRoute.medicinesScreen);
          },
          child: const GFAvatar(
            backgroundColor: TColors.primary,
            size: GFSize.SMALL,
            child: CircleAvatar(
                backgroundImage: AssetImage(
              AppImageAsset.pharmacy,
            )),
          ),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
        margin: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 20),
        color: TColors.white,
        title: InkWell(
            onTap: () {
              Get.toNamed(AppRoute.medicinesScreen);
            },
            child: Text(
              phparmaciesData[index].name,
              style: Theme.of(context).textTheme.titleSmall,
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
        icon: const Icon(
          Icons.favorite,
          color: TColors.secondary,
        ),
      ),
    );
  }
}
