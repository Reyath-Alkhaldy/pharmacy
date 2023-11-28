// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:new_maps/core/functions/get_device_type.dart';
import 'package:new_maps/core/models/device_info_model.dart';

class DeviceInfoWidget extends StatelessWidget {
  const DeviceInfoWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final Widget Function(BuildContext context, DeviceInfoModel deviceInfoModel) builder;
  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (context, constraints) {
        MediaQueryData mediaQueryData = MediaQuery.of(context);
    DeviceInfoModel deviceInfoModel = DeviceInfoModel(
      orientation: mediaQueryData.orientation,
      deviceType: getDeviceType(mediaQueryData),
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
      localWidth: constraints.maxWidth,
      localHeight: constraints.maxHeight,
    );
        return builder(context, deviceInfoModel);
      },
    );
  }
}
