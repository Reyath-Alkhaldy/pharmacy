import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/user/pharmacies/pharmacy_paginate_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/views/users/pharmacy/widget/searchbar.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';
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
    final PharmacyPaginateControllerImp controller =
        Get.find<PharmacyPaginateControllerImp>();
    super.build(context);
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          GFSearchBarr(pharmacyControllerImp: controller),
          Obx(
            () => HandlingDataView(
              statusRequest: controller.statusRequest.value,
              widget: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
                itemCount: controller.pharmacies.length,
                itemBuilder: (BuildContext context, int index) {
                  return PharmacyTileWidget(
                    index: index,
                    pharmacyControllerImp: controller,
                  );
                },
              ),
            ),
          ),
          Obx(() => controller.anotherStatusRequest.value ==
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
    required this.index,
    required this.pharmacyControllerImp,
  });
  final PharmacyPaginateControllerImp pharmacyControllerImp;
  // final int index;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pharmacyControllerImp
            .goToChoseeScreen(pharmacyControllerImp.pharmacies[index]);
      },
      child: GFListTile(
        avatar: GFAvatar(
          backgroundColor: TColors.primary,
          size: GFSize.SMALL,
          child: CircleAvatar(
            child: CachedNetworkImageWidget(
                imageUrl: pharmacyControllerImp.pharmacies[index].image),
          ),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
        margin: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 20),
        color: TColors.white,
        title: Text(
          pharmacyControllerImp.pharmacies[index].name,
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
                  pharmacyControllerImp.pharmacies[index].name,
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
                  pharmacyControllerImp.pharmacies[index].name,
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
