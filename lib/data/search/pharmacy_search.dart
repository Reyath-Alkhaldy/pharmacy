import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/user/pharmacies/pharmacy_paginate_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';

class PharmacySearch extends SearchDelegate {
  final PharmacyPaginateControllerImp controller;
  PharmacySearch(
    this.controller,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            // query = "";
            close(context, null);
          },
          icon: const Icon(Icons.close)),
      IconButton(
          onPressed: () async {
            showResults(context);
          },
          icon: const Icon(Icons.search)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  void showResults(BuildContext context) async {
    super.showResults(context);
    await controller.search('pharmacies', {'search': query});
  }

  @override
  Widget buildResults(BuildContext context) {
    return Obx(
      () => HandlingDataView(
        statusRequest: controller.statusRequest.value,
        widget: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
              vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
          itemCount: controller.searchPharmacies.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                controller.goToChoseeScreen(controller.searchPharmacies[index]);
              },
              child: GFListTile(
                avatar: GFAvatar(
                  backgroundColor: TColors.primary,
                  size: GFSize.SMALL,
                  child: CircleAvatar(
                    child: CachedNetworkImageWidget(
                        imageUrl: controller.searchPharmacies[index].image),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
                margin: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwContainerVert, horizontal: 20),
                color: TColors.white,
                title: Text(
                  controller.searchPharmacies[index].name,
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
                          controller.searchPharmacies[index].name,
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
                          controller.searchPharmacies[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: TColors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var pharmacies = controller.pharmacies
        .where((pharmacy) =>
            pharmacy.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
      itemCount: pharmacies.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            controller.goToChoseeScreen(pharmacies[index]);
          },
          child: GFListTile(
            avatar: GFAvatar(
              backgroundColor: TColors.primary,
              size: GFSize.SMALL,
              child: CircleAvatar(
                child:
                    CachedNetworkImageWidget(imageUrl: pharmacies[index].image),
              ),
            ),
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
            margin: const EdgeInsets.symmetric(
                vertical: TSizes.spaceBtwContainerVert, horizontal: 20),
            color: TColors.white,
            title: Text(
              pharmacies[index].name,
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
                      pharmacies[index].name,
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
                      pharmacies[index].name,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: TColors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
