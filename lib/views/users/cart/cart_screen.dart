// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/cart/cart_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/Auth/widget/custom_button.dart';
import 'widgets/cart_container_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartControllerImp());
    controller.getCart();
    return Scaffold(
      appBar: appBarCart(controller),
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

  AppBar appBarCart(CartControllerImp controller) {
    return AppBar(
      centerTitle: true,
      backgroundColor: TColors.primary,
      toolbarHeight: 40,
      leadingWidth: 50,
      title: Text(
        "سلة ${controller.pharmacy!.name}",
        style:
            const TextStyle(color: TColors.textWhite, fontSize: TSizes.lgMd),
      ),
    );
  }
}
