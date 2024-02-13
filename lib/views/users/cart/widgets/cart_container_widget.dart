import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5,),
      decoration: decoration(TColors.white),
      height: 130,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 150,
              width: 150,
              // margin: const EdgeInsets.symmetric(horizontal: 4.0),
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
                    Text(
                      controller.carts[index].medicine.nameAr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    InkWell(
                      onTap: () async {
                        await controller
                            .delete(controller.carts[index].medicineId);
                      },
                      child: const ImageIcon(
                        AssetImage(AppImageIcon.trash),
                        color: TColors.secondary,
                        size: TSizes.iconLg,
                      ),
                    ),
                  ],
                ),
                Text('السعر  ${controller.carts[index].medicine.price} ريال',
                    style: Theme.of(context).textTheme.bodySmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                      onPressed: () {
                        // print('increment one cart ${controller.total}');
                        controller.increment(controller.carts[index]);
                      },
                      icon: Icons.add,
                      size: TSizes.iconLg,
                      color: TColors.primary,
                    ),
                    Obx(() {
                      // print('counts $index cart ${controller.carts[index].quantity}');
                
                      return Text(
                        controller.carts[index].quantity.toString(),
                        style: const TextStyle(fontSize: TSizes.fontSizeLg),
                      );
                    }),
                    CustomIconButton(
                      onPressed: () {
                        // print('decrement $index cart ${controller.total}');
                        controller.decrement(controller.carts[index]);
                      },
                      icon: Icons.remove,
                      size: TSizes.iconLg,
                      color: TColors.secondary,
                    ),
                  ],
                ),
              Obx(() {
                      double allTotalAndQuantities =
                          controller.carts[index].medicine.price *
                              controller.carts[index].quantity;
                      // print("total $index cart $allTotalAndQuantities");
                      return Text(
                          '${allTotalAndQuantities.toStringAsFixed(2)} الإجمالي',
                          style: Theme.of(context).textTheme.bodySmall);
                    }),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
