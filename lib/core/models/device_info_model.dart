// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/enum/enums.dart';

class DeviceInfoModel {
  final Orientation orientation;
  final DeviceType deviceType;
  final double screenWidth;
  final double screenHeight;
  final double localWidth;
  final double localHeight;
  DeviceInfoModel({
    required this.orientation,
    required this.deviceType,
    required this.screenWidth,
    required this.screenHeight,
    required this.localWidth,
    required this.localHeight,
  });

  @override
  String toString() {
    return 'DeviceInfoModel(orientation: $orientation, deviceType: $deviceType, screenWidth: $screenWidth, screenHeight: $screenHeight, localWidth: $localWidth, localHeight: $localHeight)';
  }
}
