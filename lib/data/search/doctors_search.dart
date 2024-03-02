import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/user/consulation/doctor/doctors_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';

class DoctorsSearch extends SearchDelegate {
  final DoctorsControllerImp controller;
  DoctorsSearch(
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
    await controller.search('doctors', {
      'search': query,
    });
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
          itemCount: controller.doctorsSearch.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                controller.goToDoctorScreen(controller.doctorsSearch[index]);
              },
              child: GFListTile(
                avatar: GFAvatar(
                  backgroundColor: TColors.primary,
                  size: GFSize.SMALL,
                  child: CircleAvatar(
                    child: CachedNetworkImageWidget(
                        imageUrl: controller.doctorsSearch[index].imageUrl),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
                margin: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwContainerVert, horizontal: 20),
                color: TColors.white,
                title: Text(
                  controller.doctorsSearch[index].name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                subTitle: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          controller.doctorsSearch[index].name,
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
    var doctors = controller.doctors
        .where((medicine) =>
            medicine.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwContainerVert, horizontal: 5),
      itemCount: doctors.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            controller.goToDoctorScreen(doctors[index]);
          },
          child: GFListTile(
            avatar: GFAvatar(
              backgroundColor: TColors.primary,
              size: GFSize.SMALL,
              child: CircleAvatar(
                child:
                    CachedNetworkImageWidget(imageUrl: doctors[index].imageUrl),
              ),
            ),
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
            margin: const EdgeInsets.symmetric(
                vertical: TSizes.spaceBtwContainerVert, horizontal: 20),
            color: TColors.white,
            title: Text(
              doctors[index].name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subTitle: Column(
              children: [
                Row(
                  children: [
                    Text(
                      doctors[index].name,
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
