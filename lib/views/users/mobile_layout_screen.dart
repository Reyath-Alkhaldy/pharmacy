import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/controller/user/mobile_layout_controller.dart';
import 'package:new_maps/views/users/Auth/login_screen.dart';
import 'package:new_maps/views/users/pharmacy/pharmacy_screen.dart';
import '../../core/utils/constant/export_constant.dart';
import 'consulation/user_consulation_screen.dart';
import 'widget/custom_curved_navigation_bar.dart';
import 'widget/drawer_mobile_home.dart';
import 'widget/startup_container.dart';

class MobileLayoutScreen extends GetView<MobileLayoutContollerImp> {
  const MobileLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileLayoutCountroller = Get.find<MobileLayoutContollerImp>();
    GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();

    return StartUpContainer(
      onInit: () {},
      onDisposed: () {},
      child: Scaffold(
        appBar: appBarMobileLayout(mobileLayoutCountroller, getStorage),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            const DrawerMobileHome(),
            const PharmacyScreen(),
            getStorage.getUserResponse('user') != null
                ? const UserConsulationScreen()
                : const LoginScreen(),
            // SpecialtiesScreen(),

            // CategoriesScreen(),
          ],
        ),
        bottomNavigationBar: CustomCurvedNavigationBar(),
      ),
    );
  }

  AppBar appBarMobileLayout(MobileLayoutContollerImp mobileLayoutCountroller,
      GetStorageControllerImp getStorage) {
    return AppBar(
      centerTitle: true,
      backgroundColor: TColors.primary,
      toolbarHeight: 40,
      leadingWidth: 50,
      actions: [
        if (getStorage.getUserResponse('user') != null)
          InkWell(
            onTap: () {
              Get.toNamed(AppRoute.favorate);
            },
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: TColors.secondary.withOpacity(0.3),
                  blurRadius: 2,
                  spreadRadius: 2,
                )
              ], shape: BoxShape.circle),
              // margin: const EdgeInsets.only(right: 20.0),
              child: const ImageIcon(
                AssetImage(AppImageIcon.favorite),
                color: TColors.secondary,
                size: TSizes.iconMd,
              ),
            ),
          ),
        const Gap(10),
      ],
      title: Obx(
        () => Text(
          mobileLayoutCountroller.title.value,
          style:
              const TextStyle(color: TColors.textWhite, fontSize: TSizes.lgMd),
        ),
      ),
    );
  }
}
