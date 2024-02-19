import 'package:flutter/material.dart';
import 'package:new_maps/controller/user/pharmacies/pharmacy_paginate_controller.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';

class PharmacyContainer extends StatelessWidget {
  const PharmacyContainer({
    super.key,
    required this.controller,
    required this.index,
  });
  final PharmacyPaginateControllerImp controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(TColors.light),
alignment: Alignment.center,
      child: MaterialButton(
        // height: 40,
        onPressed: () =>
            controller.goToChoseeScreen(controller.pharmacies[index]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: CachedNetworkImageWidget(
                    imageUrl: controller.pharmacies[index].image)),
            Text(
              controller.pharmacies[index].name.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
