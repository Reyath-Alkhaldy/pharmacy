import 'package:get/get.dart';
import 'package:new_maps/core/constant/routes.dart';
import 'package:new_maps/view/Auth/login.dart';
import 'package:new_maps/view/Auth/sign_up.dart';
import 'package:new_maps/view/medicines/medicine_details_screen.dart';
import 'package:new_maps/view/medicines/medicines_screen.dart';
import 'package:new_maps/view/pharmacy/pharmacy_screen.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //     name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
  GetPage(name: AppRoute.pharmacy, page: () => const PharmacyScreen()),
  GetPage(name: AppRoute.medicinesScreen, page: () => const MedicinesScreen()),
//  Auth
  GetPage(name: AppRoute.login, page: () =>   Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.medicineDetails, page: () => const MedicineDetailsScreen()),
];
