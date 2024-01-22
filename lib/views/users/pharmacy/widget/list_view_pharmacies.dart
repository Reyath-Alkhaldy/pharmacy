import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/user/pharmacies/pharmacy_paginate_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/models/pharmacy.dart';
import 'package:new_maps/views/users/pharmacy/widget/searchbar.dart';
import '../../../../core/utils/constant/export_constant.dart';

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
    final PharmacyPaginateControllerImp pharmacyControllerImp =
        Get.find<PharmacyPaginateControllerImp>();
    super.build(context);
    return SingleChildScrollView(
      controller: pharmacyControllerImp.scrollController,
      child: Column(
        children: [
          GFSearchBarr(pharmacyControllerImp: pharmacyControllerImp),
          Obx(
            () => HandlingDataView(
              statusRequest: pharmacyControllerImp.statusRequest.value,
              widget: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
                itemCount: pharmacyControllerImp.pharmacies.length,
                itemBuilder: (BuildContext context, int index) {
                  return PharmacyTileWidget(
                    pharmacy: pharmacyControllerImp.pharmacies.value[index],
                    pharmacyControllerImp: pharmacyControllerImp,
                  );
                },
              ),
            ),
          ),
          Obx(() => pharmacyControllerImp.anotherStatusRequest.value ==
                  StatusRequest.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container()),
        ],
      ),
    );
  }
}

class PharmacyTileWidget extends StatelessWidget {
  const PharmacyTileWidget({
    super.key,
    required this.pharmacy,
    required this.pharmacyControllerImp,
  });
  final PharmacyPaginateControllerImp pharmacyControllerImp;
  // final int index;
  final Doctor pharmacy;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pharmacyControllerImp
            .goToMedicinesCategoriesPharmacyScreenScreen(pharmacy);
      },
      child: GFListTile(
        avatar: GFAvatar(
          backgroundColor: TColors.primary,
          size: GFSize.SMALL,
          child: CircleAvatar(child: Image.network(pharmacy.image)),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
        margin: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 20),
        color: TColors.white,
        title: Text(
          pharmacy.name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
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
