// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/medicine_details_controller.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/view/medicines/widget/add_to_cart_widget.dart';

class MedicineDetailsScreen extends StatelessWidget {
  const MedicineDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MedicineDetailsControllerImp controller =
        Get.put(MedicineDetailsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const MyStack(),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIconButton(
                              icon: FontAwesomeIcons.arrowLeft,
                              onPressed: () {
                                controller.goBack();
                              },
                              size: 25,
                            ),
                            const CustomIconButton(
                              icon: FontAwesomeIcons.cartShopping,
                              onPressed: null,
                              size: 30,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MedicineImageContainer(controller: controller),
                        const Divider(),
                        Text(
                          'وصف الدواء :',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  height: 1.7,
                                  fontWeight: FontWeight.bold
                                ), textAlign: Get.locale ==  Locale('ar')? TextAlign.left: TextAlign.left, 
                        ),
                        // const SizedBox(
                        //   height: 5,
                        // ),
                       
                        const SizedBox(
                          height: 5,
                        ),
                        
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            
                                    'I am Reyath , I am From YEMEN , I am Reyath , I am From YEMEN , I am Reyath , I am From YEMEN , I am Reyath , I am From YEMEN ,',
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  height: 1.7,
                                ), textAlign: Get.locale ==  Locale('ar')? TextAlign.center: TextAlign.left, ),
                        ),
                      ],
                  ),
                  ),
                ),
                AddToCartWidget(controllerImp: controller),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineImageContainer extends StatelessWidget {
  const MedicineImageContainer({
    super.key,
    required this.controller,
  });

  final MedicineDetailsControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(18.0),
      decoration:  decoration(TColors.white),  
      child: Hero(
        tag: controller.medicine.id,
        child: Column(
          children: [
            Image.asset(
              controller.medicine.image,
              height: 240,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.medicine.nameAr,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      "ريال",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: TColors.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      " ${controller.medicine.price.toString()}",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: TColors.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyStack extends StatelessWidget {
  const MyStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            color: TColors.primary,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: TColors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
