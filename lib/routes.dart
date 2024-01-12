import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/view/Auth/login.dart';
import 'package:new_maps/view/Auth/sign_up.dart';
import 'package:new_maps/view/cart_screen.dart';
import 'package:new_maps/view/favorite_screen.dart';
import 'package:new_maps/view/pharmacy/doctor_screen.dart';
import 'package:new_maps/view/medicines_pharmacy_view/medicine_details_screen.dart';
import 'package:new_maps/view/medicines_pharmacy_view/medicines_categories_pharmacy_screen.dart';
import 'package:new_maps/view/pharmacy/pharmacy_screen.dart';
import 'view/consulation/consulation_screen.dart';
import 'view/medicines_categories_view/categories_screen.dart';
import 'view/resipe/resipe_screen.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //     name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
  GetPage(name: AppRoute.pharmacy, page: () => const PharmacyScreen()),
  GetPage(
      name: AppRoute.medicinesCategoriesPharmacyScreen,
      page: () => const MedicinesCategoriesPharmacyScreen()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.nestedTabBars, page: () => const CategoriesScreen()),
  GetPage(
      name: AppRoute.medicineDetails,
      page: () => const MedicineDetailsScreen()),
  GetPage(name: AppRoute.doctor, page: () => const DoctorScreen()),
  GetPage(name: AppRoute.cart, page: () => const CartScreen()),
  GetPage(name: AppRoute.favorate, page: () => const FavoriteScreen()),
  GetPage(
      name: AppRoute.mainCategoriesScreen,
      page: () => const CategoriesScreen()),
       GetPage(
      name: AppRoute.consulationScreen,
      page: () =>   ConsulationScreen()),
      GetPage(
      name: AppRoute.medicalSpecialtiesScreen,
      page: () =>   const MedicineDetailsScreen()),
      GetPage(
      name: AppRoute.resipeScreen,
      page: () =>   const ResipeScreen()),

      //ResipeScreen
      
];
