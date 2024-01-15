import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../core/utils/constant/export_constant.dart';

class RecipeAndRequestRow extends StatelessWidget {
  const RecipeAndRequestRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(children: [
            Text('أضف الوصفة',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: TColors.white)),
            const Gap(10),
            const Icon(
              Icons.edit,
              color: TColors.white,
            )
          ]),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoute.resipeScreen);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(children: [
              Text('أكتب الوصفة',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: TColors.white)),
              const Gap(10),
              const Icon(
                Icons.edit,
                color: TColors.white,
              )
            ]),
          ),
        ),
      ],
    );
  }
}
