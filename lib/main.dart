import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/theme/app_theme.dart';
import 'package:new_maps/core/utils/globals.dart';
import 'package:new_maps/routes.dart';
import 'package:new_maps/view/login/screens/lib/utils/route_generator.dart';
import 'package:intl/intl.dart';
import 'package:new_maps/view/pharmacy/pharmacy_screen.dart';

import 'generated/l10n.dart';

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
      locale: Locale(Intl.systemLocale),
      // locale: Locale('ar'),
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
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      getPages: routes,
      // initialRoute:   ,
      home:   const PharmacyScreen(),
    );
  }
}

// ThemeData buildThemeData() {
//     return ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//         textButtonTheme: const TextButtonThemeData(
//           style: ButtonStyle(
//             backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
//             textStyle: MaterialStatePropertyAll(
//               TextStyle(
//                   fontSize: 24,
//                   color: Colors.blue,
//                   backgroundColor: Colors.blueAccent),
//             ),
//           ),
//         ),
//         textTheme: const TextTheme());
//   }



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