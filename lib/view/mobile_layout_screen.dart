

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/mobile_layout_controller.dart';
import 'package:new_maps/view/cart_screen.dart';
import 'package:new_maps/view/medicines/categories_screen.dart';
import 'package:new_maps/view/pharmacy/pharmacy_screen.dart';

import 'widget/custom_curved_navigation_bar.dart';
import 'widget/startup_container.dart';

class MobileLayoutScreen extends GetView<MobileLayoutContollerImp> {
  const MobileLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StartUpContainer(
      onInit: (){},
      onDisposed: (){

      },
      child:     Scaffold(
        body:   PageView(
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
}