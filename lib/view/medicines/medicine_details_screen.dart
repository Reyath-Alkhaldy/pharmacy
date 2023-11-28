// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/medicine_details_controller.dart';
import 'package:new_maps/view/medicines/widget/add_to_cart_widget.dart';

class MedicineDetailsScreen extends StatelessWidget {
  const MedicineDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MedicineDetailsControllerImp controller =
        Get.put(MedicineDetailsControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                        CustomIconButton(
                          icon: FontAwesomeIcons.cartShopping,
                          onPressed: null,
                          size: 30,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(18.0),
                      child:Hero(
                  tag: controller.medicine.id ,
                  child: Image.asset(
                        controller.medicine.image,
                        width: double.maxFinite,
                        alignment: Alignment.center,
                      ),),
                    ),
                    const Divider(),
                    Text(
                      'Bandol Flow',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '120 pices',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Medicine Description : ',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text.rich(
                      TextSpan(
                          text:
                              'I am Reyath , I am From YEMEN , I am Reyath , I am From YEMEN , I am Reyath , I am From YEMEN , I am Reyath , I am From YEMEN ,',
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ],
                ),
              ),
            ),
              AddToCartWidget(controllerImp: controller),
          ],
        ),
      ),
    );
  }
}


