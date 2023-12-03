import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

BoxDecoration decoration(Color color) => BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: const [
          BoxShadow(
            color: TColors.softGrey,
            spreadRadius: 2,
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: TColors.grey,
            spreadRadius: 2,
            offset: Offset(-2, -2),
            blurRadius: 4,
          ),
        ]);
