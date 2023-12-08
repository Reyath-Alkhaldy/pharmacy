import 'package:flutter/material.dart';
import 'package:new_maps/controller/medicine_details_controller.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';

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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomIconButton(
                  icon: Icons.add,
                  size: TSizes.iconLg,
                  color: TColors.primary,
                ),
                Text(
                  '1',
                  style: TextStyle(fontSize: TSizes.fontSizeLg),
                ),
                CustomIconButton(
                  icon: Icons.remove,
                  size: TSizes.iconLg,
                  color: TColors.secondary,
                ),
              ],
            ),
          ),
          Row(
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
                    controllerImp.goToSignIn();
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
