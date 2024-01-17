import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/views/users/widget/image_profile_container.dart';

import '../../../../controller/user/pharmacies/medicines_pharmacy_controller.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MedicinesControllerImp controllerImp = Get.put(MedicinesControllerImp());

    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      height: 110,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ImageProfileContainer(
                  image: controllerImp.medicines[index].imageUrl,
                ),
              ),
              Text(controllerImp.medicines[index].nameEn),
            ],
          );
        },
      ),
    );
  }
}
