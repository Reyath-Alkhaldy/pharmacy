import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class MedicalSpecialtiesScreen extends StatelessWidget {
  const MedicalSpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.spaceBtwContainerHoriz,
            vertical: TSizes.spaceBtwContainerVert),
        color: TColors.lightGrey,

        child: GridView.builder(
          
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 120,
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.toNamed(AppRoute.consulationScreen);
              },
              child: Card(
                color: TColors.white,
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        AppImageIcon.stomach,
                        height: 50,
                      ),
                      const Text('المعدة')
                    ],
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}
