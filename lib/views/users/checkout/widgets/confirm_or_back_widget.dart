import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/cart/cart_controller.dart';
import '../../../../core/utils/constant/export_constant.dart';

class ConfirmOrBackWidget extends StatelessWidget {
  const ConfirmOrBackWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final CartControllerImp cartController = Get.find();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                await cartController.checkout();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: TColors.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "إتمام عملية الشراء",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold, color: TColors.textWhite),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "عودة",
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
    );
  }
}
