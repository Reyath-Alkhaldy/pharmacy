import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/user/pharmacies/medicines_pharmacy_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';

class MedicineSearch extends SearchDelegate {
  final MedicinesPharmacyControllerImp controller;
  MedicineSearch(
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
    await controller.search(
        'medicines', {'search': query, 'pharmacy_id': controller.pharmacyId});
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
          itemCount: controller.searchMedicines.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                controller.goToMedicineDetails(controller.medicines[index]);
              },
              child: GFListTile(
                avatar: GFAvatar(
                  backgroundColor: TColors.primary,
                  size: GFSize.SMALL,
                  child: CircleAvatar(
                    child: CachedNetworkImageWidget(
                        imageUrl: controller.searchMedicines[index].imageUrl),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
                margin: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwContainerVert, horizontal: 20),
                color: TColors.white,
                title: Text(
                  controller.searchMedicines[index].nameEn,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subTitle: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          controller.searchMedicines[index].nameAr,
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
    var medicines = controller.medicines
        .where((medicine) =>
            medicine.nameEn.toLowerCase().contains(query.toLowerCase()) ||
            medicine.nameAr.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
      itemCount: medicines.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            controller.goToMedicineDetails(medicines[index]);
          },
          child: GFListTile(
            avatar: GFAvatar(
              backgroundColor: TColors.primary,
              size: GFSize.SMALL,
              child: CircleAvatar(
                child: CachedNetworkImageWidget(
                    imageUrl: medicines[index].imageUrl),
              ),
            ),
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
            margin: const EdgeInsets.symmetric(
                vertical: TSizes.spaceBtwContainerVert, horizontal: 20),
            color: TColors.white,
            title: Text(
              medicines[index].nameEn,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subTitle: Column(
              children: [
                Row(
                  children: [
                    Text(
                      medicines[index].nameAr,
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
