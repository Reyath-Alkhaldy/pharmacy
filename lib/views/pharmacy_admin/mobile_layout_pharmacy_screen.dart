import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/pharmacy/mobile_layout_pharmacy_controller.dart';
import 'package:new_maps/views/users/medicines_categories_view/categories_screen.dart';
import 'package:new_maps/views/users/pharmacy/pharmacy_screen.dart';
import '../../core/utils/constant/export_constant.dart';
import '../users/widget/drawer_mobile_home.dart';
import '../users/widget/startup_container.dart';
import 'home/control_panal_screen.dart';
import 'widgets/custom_curved_navigation_bar_for_pharmacy.dart';
 

class MobileLayoutPharmacyScreen extends GetView<MobileLayoutPharmacyContollerImp> {
  const MobileLayoutPharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileLayoutPharmacyCountroller = Get.find<MobileLayoutPharmacyContollerImp>();
    return StartUpContainer(
      onInit: () {},
      onDisposed: () {},
      child: Scaffold(
        appBar: appBarMobileLayout(mobileLayoutPharmacyCountroller),
        drawer: const DrawerMobileHome(),
        // drawerScrimColor: TColors.white,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: const [
            // CartScreen(),
            PharmacyScreen(),
            PharmacyScreen(),
            CategoriesScreen(),
            ControlPanalScreen(),
          ],
        ),
        bottomNavigationBar: CustomCurvedNavigationBarForPharmacy(),
      ),
    );
  }

  AppBar appBarMobileLayout(MobileLayoutPharmacyContollerImp mobileLayoutPharmacyCountroller) {
    return AppBar(
      centerTitle: true,
      backgroundColor: TColors.primary,
      toolbarHeight: 40,
      leadingWidth: 50,
      actions: [
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
          mobileLayoutPharmacyCountroller.title.value,
          style:
              const TextStyle(color: TColors.textWhite, fontSize: TSizes.lgMd),
        ),
      ),
    );
  }
}
