
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_maps/controller/user/cart/cart_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/views/users/medicines_pharmacy_view/widgets/add_to_cart_widget.dart';

class CartContainerWidget extends StatelessWidget {
  const CartContainerWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  final CartControllerImp controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8),
      decoration: decoration(TColors.white),
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 150,
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CachedNetworkImage(
                imageUrl: controller.carts[index].medicine.imageUrl,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(controller.carts[index].medicine.nameAr,style: Theme.of(context).textTheme.bodySmall, ),
                    InkWell(
                      onTap: ()async {
                       await controller.delete(controller.carts[index].medicineId);
                      },
                      child: const ImageIcon(
                        AssetImage(AppImageIcon.trash),
                        color: TColors.secondary,
                        size: TSizes.iconLg,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${controller.carts[index].medicine.price} ريال',style: Theme.of(context).textTheme.bodySmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CustomIconButton(
                          icon: Icons.add,
                          size: TSizes.iconLg,
                          color: TColors.primary,
                        ),
                        Text(
                          controller.carts[index].quantity.toString(),
                          style: const TextStyle(fontSize: TSizes.fontSizeLg),
                        ),
                        const CustomIconButton(
                          icon: Icons.remove,
                          size: TSizes.iconLg,
                          color: TColors.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
