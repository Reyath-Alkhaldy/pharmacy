import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

class BackgroundUserViewScreen extends StatelessWidget {
  const BackgroundUserViewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          decoration: const BoxDecoration(
            color: TColors.primary,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 0,
              decoration: const BoxDecoration(),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: TColors.light),
              ),
            ),
          ],
        )
      ],
    );
  }
}
