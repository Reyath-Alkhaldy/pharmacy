import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

BoxDecoration decoration(Color color) => BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      boxShadow: boxShadows,
    );

final List<BoxShadow> boxShadows = [
  const BoxShadow(
    color: TColors.lightGrey,
    spreadRadius: 2,
    offset: Offset(2, 3),
    blurRadius: 4,
  ),
  const BoxShadow(
    color: TColors.lightGrey,
    spreadRadius: 2,
    offset: Offset(-1, -1),
    blurRadius: 4,
  ),
];
