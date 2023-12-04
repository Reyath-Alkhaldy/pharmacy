import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

BoxDecoration decoration(Color color) => BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: const [
          BoxShadow(
            color: TColors.black,
            spreadRadius: 4,
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: TColors.black,
            spreadRadius: 4,
            offset: Offset(-2, -2),
            blurRadius: 4,
          ),
        ]);
