// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/medicine_details_controller.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/views/user/medicines_pharmacy_view/widgets/add_to_cart_widget.dart';
import '../../../core/utils/constant/export_constant.dart';

class MedicineDetailsScreen extends StatelessWidget {
  const MedicineDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MedicineDetailsControllerImp medicineDetailsControllerImp =
        Get.put(MedicineDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TColors.primary,
        centerTitle: true,
        title: Text(
          medicineDetailsControllerImp.medicine.nameEn,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const ImageIcon(
                AssetImage(AppImageIcon.arrow),
                color: TColors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          const MyStackCategoryBackground(),
          Column(
            children: [
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MedicineImageContainer(
                          controller: medicineDetailsControllerImp),
                      const Divider(),
                      Text(
                        'وصف الدواء :',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            height: 1.7,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: Get.locale == const Locale('ar')
                            ? TextAlign.left
                            : TextAlign.left,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          medicineDetailsControllerImp.medicine.description,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    height: 1.7,
                                  ),
                          textAlign: Get.locale == const Locale('ar')
                              ? TextAlign.center
                              : TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AddToCartWidget(controllerImp: medicineDetailsControllerImp),
            ],
          ),
        ],
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
      padding: const EdgeInsets.all(5.0),


      decoration: decoration(TColors.white),
      child: Hero(
        tag: controller.medicine.id,
        child: Column(
          
          children: [
            Image.network(
              controller.medicine.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              controller.medicine.nameEn,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "ريال",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: TColors.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      " ${controller.medicine.price.toString()}",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: TColors.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                const AddOrRemoveToCartWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//
class MyStackCategoryBackground extends StatelessWidget {
  const MyStackCategoryBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 130,
          decoration: const BoxDecoration(
            color: TColors.primary,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
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
