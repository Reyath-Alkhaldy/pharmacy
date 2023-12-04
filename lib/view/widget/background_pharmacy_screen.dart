import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

class BackgroundPharmacyScreen extends StatelessWidget {
  const BackgroundPharmacyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            color: TColors.primary,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}


class BackgroundMedicineScreen extends StatelessWidget {
  const BackgroundMedicineScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            color: TColors.primary,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
