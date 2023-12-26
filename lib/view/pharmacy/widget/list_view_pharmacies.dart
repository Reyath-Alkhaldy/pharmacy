import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/pharmacy_controller.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/core/utils/constant/app_image_asset.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/data/models/pharmacy.dart';

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
  PharmacyControllerImp controller = Get.find();
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
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
                  itemCount: controller.pharmacies.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (kDebugMode) {
                      // print(controller.pharmacies.value[index].name);
                    }
                    return PharmacyTileWidget(
                      pharmacy: controller.pharmacies.value[index],
                    );
                  });
            }
          }),
        ],
      ),
    );
  }
}

class PharmacyTileWidget extends StatelessWidget {
  const PharmacyTileWidget({
    super.key,
    required this.pharmacy,
  });
  // final int index;
  final Pharmacy pharmacy;
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
              pharmacy.name,
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
                  pharmacy.name,
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
                  pharmacy.name,
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
