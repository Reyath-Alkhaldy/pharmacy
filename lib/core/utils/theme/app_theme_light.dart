import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

import 'my_app_theme.dart';

class AppThemeLight {
  static final theme = MyAppTheme.baseTheme(
    Brightness.light,
    accentColor: TColors.lightGrey,
    // accentColor: const Color(0xFF0669F8),
    onAccentColor: Colors.black,
    // scaffoldBackgroundColor: const Color(0xFFDCDFE2),
    // scaffoldBackgroundColor: TColors.primary,
  ).copyWith(
    colorScheme: const ColorScheme.light(
      shadow: TColors.grey,
      primary: Color.fromARGB(255, 175, 146, 146),
      // onPrimary: TColors.primary,
      secondary: TColors.secondary,
      background: TColors.secondary,
      onBackground: TColors.secondary,
      surface: TColors.primaryBackground,
      onSurface: TColors.primaryBackground,
      primaryContainer: TColors.white,
      // onPrimaryContainer: TColors.primary,
      // secondaryContainer: TColors.primary,
    ),

    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(
        const Color.fromRGBO(13, 71, 161, 1),
      ),
    )),
    // searchBarTheme:   SearchBarThemeData(
    //   backgroundColor: MaterialStatePropertyAll(
    //     Color(0xFFDCDFE2),
    //   ),
    // ),
    iconTheme: const IconThemeData().copyWith(
      color: const Color.fromRGBO(13, 71, 161, 1),
    ),
    // Theme
    dividerTheme: const DividerThemeData(
      color: TColors.black,
    ),
    // tabBarTheme: const TabBarTheme(
    //     labelColor: Colors.black,
    //     indicatorColor: Colors.black,
    //     unselectedLabelColor: Colors.grey),
    // appBarTheme: const AppBarTheme(
    //     actionsIconTheme: IconThemeData(
    //   color: Color(0xffF6FAFB),
    // )),
    // cardColor: const Color(0xFFCACFD6),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: Color(0xFFFAFAFA),
    // ),
  );
}
