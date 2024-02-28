import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/pharmacies/pharmacy_paginate_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/views/users/pharmacy/widget/searchbar.dart';
import '../../../../core/utils/constant/export_constant.dart';
import 'pharmacy_title_widget.dart';

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

