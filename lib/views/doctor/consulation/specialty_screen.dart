import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/consulation/specialty_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'widgets/specialty_container.dart';

class SpecialtiesScreen extends StatelessWidget {
  const SpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final specialtyController = Get.put(SpecialtyControllerImp());
    return SingleChildScrollView(
      controller: specialtyController.scrollController,
      child: Column(
        children: [
          Obx(() => HandlingDataView(
                statusRequest: specialtyController.statusRequest.value,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: specialtyController.specialties.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 120,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return SpecialtyContainer(
                        specialtyController: specialtyController, index: index);
                  },
                ),
              )),
          Obx(() => specialtyController.anotherStatusRequest.value ==
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
