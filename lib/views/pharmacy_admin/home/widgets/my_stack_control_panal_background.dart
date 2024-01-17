import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class MyStackControlPanalBackground extends StatelessWidget {
  const MyStackControlPanalBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 130,
          decoration: const BoxDecoration(
            color: TColors.primary,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 20,
              decoration: const BoxDecoration(),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: TColors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
