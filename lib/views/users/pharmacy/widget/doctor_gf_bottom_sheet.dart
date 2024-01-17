
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/core/utils/constant/app_image_asset.dart';

class DoctorGFBottomSheet extends StatelessWidget {
  const DoctorGFBottomSheet({
    super.key,
    required this.controller,
  });
  final GFBottomSheetController controller;
  @override
  Widget build(BuildContext context) {
    return GFBottomSheet(
        maxContentHeight: 150,
        stickyHeaderHeight: 100,
        stickyHeader: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]),
          child: const GFListTile(
            avatar: GFAvatar(
              backgroundImage: AssetImage(AppImageAsset.myImageProfile),
            ),
            titleText: 'GetWidget',
            subTitleText: 'Open source UI library',
          ),
        ),
        contentBody: Container(
          height: 200,
        ),
        controller: controller);
  }
}
