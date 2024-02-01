import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import '../../../../controller/user/medicine_details_controller.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    super.key,
    required this.controllerImp,
  });
  final MedicineDetailsControllerImp controllerImp;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: GetBuilder<MedicineDetailsControllerImp>(
          builder: (_) => HandlingDataRequest(
            statusRequest: controllerImp.statusRequest,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controllerImp.goToSignIn();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TColors.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "طلب",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      controllerImp.addToCart();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "أضافة إالى السلة",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class AddOrRemoveToCartWidget extends StatelessWidget {
  const AddOrRemoveToCartWidget({
    super.key,
    required this.controller,
  });
  final MedicineDetailsControllerImp controller;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<MedicineDetailsControllerImp>();
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: TColors.lightGrey.withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Icons.add,
            size: TSizes.iconLg,
            color: TColors.primary,
            onPressed: () => controller.increment(),
          ),
          Text(
            controller.count.toString(),
            style: const TextStyle(fontSize: TSizes.fontSizeLg, height: 1.3),
          ),
          CustomIconButton(
            icon: Icons.remove,
            size: TSizes.iconLg,
            color: TColors.secondary,
            onPressed: () => controller.decrement(),
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.color,
    this.onPressed,
    required this.size,
  });
  final IconData icon;
  final Color? color;
  final VoidCallback? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        weight: 20,
        color: color,
        size: size,
      ),
    );
  }
}
