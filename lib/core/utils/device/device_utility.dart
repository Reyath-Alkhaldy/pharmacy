import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TDeviceUtility {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  //
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
      ),
    );
  }

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsest = View.of(context).viewInsets;
    return viewInsest.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final viewInsest = View.of(context).viewInsets;
    return viewInsest.bottom != 0;
  }

  static void setScreenFull(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  // check if it's on dark mode .
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
