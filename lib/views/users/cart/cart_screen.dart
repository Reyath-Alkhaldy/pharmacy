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
    // controller.getCart();
    return Form(
      child: PopScope(
          canPop: controller.canPop,
          onPopInvoked: (bool) async {
            if (bool) {
              return;
            }
            await controller.changesSave();
            if (bool) {
              Get.back();
            }
          },
          child: Scaffold(
            appBar: appBarCart(controller),
            body: Container(
                padding: const EdgeInsets.all(15.0),
                child: Obx(
                  () => Column(
                    children: [
                      Expanded(
                        child: HandlingDataView(
                          statusRequest: controller.statusRequest.value,
                          widget: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.carts.length,
                              padding: const EdgeInsets.all(10),
                              itemBuilder: (BuildContext context, int index) {
                                print('start carts list $index');
                                return CartContainerWidget(
                                    controller: controller, index: index);
                              }),
                        ),
                      ),
                      HandlingDataView(
                        statusRequest: controller.statusRequest.value,
                        widget: Container(
                          padding: const EdgeInsets.all(10.0),
                          height: 120,
                          color: TColors.lightGrey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text('الإجمالي'),
                                  Obx(() {
                                    print(
                                        'total All carts ${controller.total}');

                                    return Text(
                                        '${controller.total.toStringAsFixed(2)} ريال');
                                  }),
                                ],
                              ),
                              CustomButton(
                                  content: 'طلب',
                                  onPressed: () {
                                    controller.goToCheckoutScreen();
                                  }),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )),
    );
  }

  AppBar appBarCart(CartControllerImp controller) {
    return AppBar(
      centerTitle: true,
      backgroundColor: TColors.primary,
      automaticallyImplyLeading: false,
      toolbarHeight: 40,
      leadingWidth: 50,
      title: Text(
        "سلة ${controller.pharmacy!.name}",
        style: const TextStyle(color: TColors.textWhite, fontSize: TSizes.lgMd),
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
    );
  }
}
