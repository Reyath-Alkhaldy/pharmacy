// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/cart/cart_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/views/users/Auth/widget/custom_button.dart';
import '../medicines_pharmacy_view/widgets/add_to_cart_widget.dart';

class CartScreen extends GetView<CartControllerImp> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartControllerImp());
    controller.getCart();
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15.0),
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.carts.length,
                        padding: const EdgeInsets.all(10),
                        itemBuilder: (BuildContext context, int index) {
                          return CartContainerWidget(
                              controller: controller, index: index);
                        }),
                  ),
                ),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 120,
                    color: TColors.lightGrey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('الإجمالي'),
                            Text('${controller.total} ريال'),
                          ],
                        ),
                        CustomButton(
                            content: 'طلب',
                            onPressed: () {
                              Get.toNamed(AppRoute.checkoutScreen);
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

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
                    Text(controller.carts[index].medicine.nameAr),
                    const ImageIcon(
                      AssetImage(AppImageIcon.trash),
                      color: TColors.secondary,
                      size: TSizes.iconLg,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${controller.carts[index].medicine.price} ريال'),
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
