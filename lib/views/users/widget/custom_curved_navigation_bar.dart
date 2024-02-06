import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/mobile_layout_controller.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

class CustomCurvedNavigationBar extends GetView<MobileLayoutContollerImp> {
  CustomCurvedNavigationBar({
    super.key,
  });
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CurvedNavigationBar(
        key: _bottomNavigationKey,
        onTap: (i) {
          controller.jumpToAnotherPage(i);
        },
        // letIndexChange: (i) {
        //   return true;
        // },
        animationDuration: const Duration(milliseconds: 500),
        animationCurve: Curves.fastLinearToSlowEaseIn,
        height: 65,

        index: controller.index.value,
        backgroundColor: TColors.primary,
        // color: TColors.primary,
        // buttonBackgroundColor: TColors.primary,
        items: const [
          CurvedNavigationBarItem(
            child:  Icon(
              Icons.more
            ),
            label: 'المزيد',
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              AssetImage(AppImageIcon.homeSelected),
              // color: TColors.primary,
            ),
            label: 'الصفحة الرئيسية ',
          ),
          CurvedNavigationBarItem(
            child: ImageIcon(
              AssetImage(AppImageIcon.consultant),
            ),
            label: 'الإسشارات',
          ),
        ],
      ),
    );
  }
}
