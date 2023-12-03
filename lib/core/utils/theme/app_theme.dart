import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';

class AppTheme {
  const AppTheme._();

  static const _defaultElevation = 2.5;

  static ThemeData _baseTheme(
    Brightness brightness, {
    Color? textColor,
    Color? accentColor,
    Color? onAccentColor,
    Color? scaffoldBackgroundColor,
  }) {
    late final ColorScheme defaultColorScheme;
    late final SystemUiOverlayStyle systemUiOverlayStyle;

    switch (brightness) {
      case Brightness.light:
        defaultColorScheme = const ColorScheme.light();
        systemUiOverlayStyle = SystemUiOverlayStyle.dark;
        textColor ??= Colors.black;
        break;
      case Brightness.dark:
        defaultColorScheme = const ColorScheme.dark();
        systemUiOverlayStyle = SystemUiOverlayStyle.light;
        textColor ??= Colors.white;
        break;
    }

    return ThemeData(
      brightness: brightness,
      iconTheme: IconThemeData(color: textColor),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: _defaultElevation,
        systemOverlayStyle: systemUiOverlayStyle,
        color: scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: textColor),
        actionsIconTheme: IconThemeData(color: textColor),
        titleTextStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: TSizes.fontSizeLg,
        ),
      ),
      colorScheme: defaultColorScheme
      // .copyWith(
      // brightness: brightness,
      // primary: accentColor,
      // secondary: accentColor,
      // onSecondary: onAccentColor ?? textColor,
      // )
      ,
      dialogTheme: DialogTheme(
        elevation: _defaultElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: _defaultElevation,
        highlightElevation: _defaultElevation * 2,
        // backgroundColor: accentColor,
      ),
      snackBarTheme: SnackBarThemeData(
        elevation: _defaultElevation,
        backgroundColor: accentColor,
        contentTextStyle: TextStyle(
          fontSize: TSizes.fontSizeMd,
          color: onAccentColor ?? textColor,
        ),
        behavior: SnackBarBehavior.floating,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
      ),
      // cupertinoOverrideTheme: CupertinoThemeData(
      //   brightness: brightness,
      //   scaffoldBackgroundColor: scaffoldBackgroundColor,
      // ),
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

//! light theme
  static final lightTheme = _baseTheme(
    Brightness.light,
    accentColor: TColors.accent,
    // accentColor: const Color(0xFF0669F8),
    onAccentColor: Colors.black,
    scaffoldBackgroundColor: const Color(0xFFDCDFE2),
    // scaffoldBackgroundColor: TColors.primary,
  ).copyWith(
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(
        Color.fromRGBO(13, 71, 161, 1),
      ),
    )),
    searchBarTheme: const SearchBarThemeData(
      backgroundColor: MaterialStatePropertyAll(
        Color(0xFFDCDFE2),
      ),
    ),
    iconTheme: const IconThemeData().copyWith(
      color: const Color.fromRGBO(13, 71, 161, 1),
    ),
    // Theme
    dividerTheme: const DividerThemeData(
      color: Colors.black,
    ),
    tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        unselectedLabelColor: Colors.grey),
    appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(
      color: Color(0xffF6FAFB),
    )),
    cardColor: const Color(0xFFCACFD6),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFAFAFA),
    ),
  );

  static final darkTheme = _baseTheme(
    Brightness.dark,
    accentColor: Colors.tealAccent,
    onAccentColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFF040F2D),
  ).copyWith(
    colorScheme: const ColorScheme.dark(
      primaryContainer: TColors.dark,
    ),
    primaryTextTheme:
        const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
    dividerTheme: const DividerThemeData(
      color: Colors.white,
    ),
    cardColor: const Color(0xFF091642),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF050C25),
    ),
  );
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
