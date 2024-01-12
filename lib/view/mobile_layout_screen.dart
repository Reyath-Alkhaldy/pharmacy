
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/mobile_layout_controller.dart';
import 'package:new_maps/view/cart_screen.dart';
import 'package:new_maps/view/medicines_categories_view/categories_screen.dart';
import 'package:new_maps/view/pharmacy/pharmacy_screen.dart';
import '../core/utils/constant/export_constant.dart';
import '../core/utils/device/device_utility.dart';
import 'widget/custom_curved_navigation_bar.dart';
import 'widget/startup_container.dart';

class MobileLayoutScreen extends GetView<MobileLayoutContollerImp> {
  const MobileLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mobileLayoutCountroller = Get.find<MobileLayoutContollerImp>();
    return StartUpContainer(
      onInit: () {},
      onDisposed: () {},
      child: Scaffold(
        appBar: appBarMobileLayout(mobileLayoutCountroller),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: const [
            CartScreen(),
            PharmacyScreen(),
            CategoriesScreen(),
          ],
        ),
        bottomNavigationBar: CustomCurvedNavigationBar(),
      ),
    );
  }

  AppBar appBarMobileLayout(MobileLayoutContollerImp mobileLayoutCountroller) {
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
              margin: const EdgeInsets.only(right: 20.0),
              child: const ImageIcon(
                AssetImage(AppImageIcon.favorite),
                color: TColors.secondary,
                size: TSizes.iconXs,
              ),
            ),
          ),
          const Gap(10),
        ],
        title: Obx(
          () => Text(
            mobileLayoutCountroller.title.value,
            style: const TextStyle(
                color: TColors.textWhite, fontSize: TSizes.lgMd),
          ),
        ),
        leading:    Drawer(
          width:TDeviceUtility. getScreenWidth() * 0.8,
          backgroundColor: TColors.primary,
          
          // backgroundImage: const AssetImage(AppImageIcon.drawer),
          child: ListView(children:   [
           DrawerHeader(
              
              child:Image.asset(AppImageIcon.drawer ) ,
            ), 

          ],),
        ),
      );
  }
}
