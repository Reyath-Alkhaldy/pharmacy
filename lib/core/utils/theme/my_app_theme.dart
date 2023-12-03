import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';

class MyAppTheme {
  const MyAppTheme._();

  static const _defaultElevation = 2.5;

  static ThemeData baseTheme(
    Brightness brightness, {
    Color? textColor = TColors.textColor,
    Color? accentColor,
    Color? onAccentColor,
    Color? scaffoldBackgroundColor,
  }) {
    // late final SystemUiOverlayStyle systemUiOverlayStyle;

    switch (brightness) {
      case Brightness.light:
        // systemUiOverlayStyle = SystemUiOverlayStyle.dark;
        textColor ??= Colors.black;
        break;
      case Brightness.dark:
        // systemUiOverlayStyle = SystemUiOverlayStyle.light;
        textColor ??= Colors.white;
        break;
    }

    return ThemeData(
      brightness: brightness,
      iconTheme: IconThemeData(color: textColor),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: _defaultElevation,
        // systemOverlayStyle: systemUiOverlayStyle,
        color: scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: textColor, ),
        actionsIconTheme: IconThemeData(color: textColor),
        titleTextStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: TSizes.fontSizeLg,
        ),
      ),
      dialogTheme: DialogTheme(
        elevation: _defaultElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      floatingActionButtonTheme:   FloatingActionButtonThemeData(
        elevation: _defaultElevation,
        highlightElevation: _defaultElevation * 2,
        backgroundColor: accentColor,
      ),
      snackBarTheme: SnackBarThemeData(
        elevation: _defaultElevation,
        backgroundColor: accentColor,
        contentTextStyle: TextStyle(
          fontSize: TSizes.fontSizeMd,
          color: onAccentColor ?? textColor,
        ),
        behavior: SnackBarBehavior.floating,
        
      ),
      
      pageTransitionsTheme: PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          for (final targetValue in TargetPlatform.values)
            targetValue: const _SlideLeftTransitionsBuilder(),
        },
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return accentColor;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return accentColor;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return accentColor;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return accentColor;
          }
          return null;
        }),
      ),
    );
  }

 
}

class _SlideLeftTransitionsBuilder extends PageTransitionsBuilder {
  const _SlideLeftTransitionsBuilder();

  @override
  Widget buildTransitions<T>(_, __, animation, ___, child) {
    return SlideTransition(
      position: CurvedAnimation(
        parent: animation,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      ).drive(Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      )),
      child: child,
    );
  }
}
