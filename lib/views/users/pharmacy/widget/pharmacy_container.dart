import 'package:flutter/material.dart';
import 'package:new_maps/controller/user/pharmacies/pharmacy_paginate_controller.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
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
      // height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: TColors.softGrey,
            spreadRadius: 4,
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: TColors.grey,
            spreadRadius: 4,
            offset: Offset(-2, -2),
            blurRadius: 4,
          ),
        ],
        color: TColors.white,
      ),
      child: MaterialButton(
        // height: 40,
        onPressed: () =>
            controller.goToChoseeScreen(controller.pharmacies[index]),
        child: Column(
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
