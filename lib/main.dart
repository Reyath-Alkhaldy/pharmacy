import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/globals.dart';
import 'package:new_maps/routes.dart';
import 'core/bindings/intialbindings.dart';
import 'core/utils/theme/app_theme.dart';
import 'generated/l10n.dart';
import 'view/mobile_layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform
      );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: Locale(Intl.systemLocale),
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'FirebasePhoneAuthHandler Demo',
      scaffoldMessengerKey: Globals.scaffoldMessengerKey,
      theme: ThemeData(
        fontFamily: "bukra",
        scaffoldBackgroundColor: TColors.light,
      ),
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
      // onGenerateRoute: RouteGenerator.generateRoute,
      getPages: routes,
      initialBinding: InitialBindings(),
      // initialRoute:   ,
      home:   const MobileLayoutScreen(),
      // home:   UserScreen(),
      // home:    ResipeScreen(), UserScreen

    );
  }
}


//! this is for lib in view/login/lib/.... path;
// @override
//   Widget build(BuildContext context) {
//     return FirebasePhoneAuthProvider(
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'FirebasePhoneAuthHandler Demo',
//         scaffoldMessengerKey: Globals.scaffoldMessengerKey,
//         theme: AppTheme.lightTheme,
//         darkTheme: AppTheme.darkTheme,
//         onGenerateRoute: RouteGenerator.generateRoute,
//         initialRoute: SplashScreen.id,
//       ),
//     );
//   }