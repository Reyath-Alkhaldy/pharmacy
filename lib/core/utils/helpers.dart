import 'dart:developer' as devtools show log;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/core/utils/globals.dart';

// ! go to login screen
goToLoginCreen() => Get.toNamed(AppRoute.login);

showDialogDoctor(title, message, {bool loginMessage = false}) async =>
    await showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text(
                'إلغاء',
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: TColors.secondary),
              ),
            ),
            if (loginMessage)
              InkWell(
                onTap: () {
                  // Get.back();
                  Get.offNamed(AppRouteDoctor.loginDoctor);
                },
                child: Text(
                  'الذهاب لتسجيل الدخول',
                  style: Theme.of(Get.context!)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: TColors.primary),
                ),
              ),
          ],
        );
      },
    );

showDialogg(title, message, {bool loginMessage = false}) async =>
    await showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text(
                'إلغاء',
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: TColors.secondary),
              ),
            ),
            if (loginMessage)
              InkWell(
                onTap: () {
                  // Get.back();
                  Get.offNamed(AppRoute.login);
                },
                child: Text(
                  'الذهاب لتسجيل الدخول',
                  style: Theme.of(Get.context!)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: TColors.primary),
                ),
              ),
          ],
        );
      },
    );

showDialogLogout(title, message, {void Function()? onTap}) async =>
    await showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text(
                'إلغاء',
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: TColors.black),
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                'تأكيد',
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: TColors.secondary),
              ),
            ),
          ],
        );
      },
    );

void showSnackBar(
  String text, {
  Duration duration = const Duration(seconds: 2),
}) {
  Globals.scaffoldMessengerKey.currentState
    ?..clearSnackBars()
    ..showSnackBar(
      SnackBar(content: Text(text), duration: duration),
    );
}

bool isNullOrBlank(String? data) => data?.trim().isEmpty ?? true;

void log(
  String screenId, {
  dynamic msg,
  dynamic error,
  StackTrace? stackTrace,
}) =>
    devtools.log(
      msg.toString(),
      error: error,
      name: screenId,
      stackTrace: stackTrace,
    );
