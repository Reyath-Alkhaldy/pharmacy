import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/pharmacies/pharmacy_paginate_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/views/users/pharmacy/widget/pharmacy_container.dart';

import 'searchbar.dart';

class PharmaciesGridView extends StatelessWidget {
  const PharmaciesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PharmacyPaginateControllerImp controller =
        Get.find<PharmacyPaginateControllerImp>();
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          GFSearchBarr(pharmacyControllerImp: controller),
          Obx(() => HandlingDataView(
                statusRequest: controller.statusRequest.value,
                widget: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.spaceBtwItems + 16,
                      vertical: TSizes.spaceBtwContainerVert),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.pharmacies.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return PharmacyContainer(
                        controller: controller, index: index);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 150,
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                ),
              )),
          Obx(() =>
              controller.anotherStatusRequest.value == StatusRequest.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()),
        ],
      ),
    );
  }
}
