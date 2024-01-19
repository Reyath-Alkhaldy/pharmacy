import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/views/users/Auth/login.dart';
import 'package:new_maps/views/users/Auth/sign_up.dart';
import 'package:new_maps/views/users/cart/cart_screen.dart';
import 'package:new_maps/views/users/favorite_screen.dart';
import 'package:new_maps/views/users/pharmacy/doctor_screen.dart';
import 'package:new_maps/views/users/medicines_pharmacy_view/medicine_details_screen.dart';
import 'package:new_maps/views/users/medicines_pharmacy_view/medicines_categories_pharmacy_screen.dart';
import 'package:new_maps/views/users/pharmacy/pharmacy_screen.dart';
import 'views/pharmacy_admin/mobile_layout_pharmacy_screen.dart';
import 'views/pharmacy_admin/order_history/order_history_pharmacy_screen.dart';
import 'views/users/checkout/checkout_screen.dart';
import 'views/users/consulation/consulation_screen.dart';
import 'views/users/medicines_categories_view/categories_screen.dart';
import 'views/users/resipe/resipe_screen.dart';
import 'views/users/user/order_history_screen.dart';
import 'views/users/user/user_consulation_screen.dart';
import 'views/users/user/user_screen.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //     name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
  //! user Routes
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
  GetPage(name: AppRoute.consulationScreen, page: () => ConsulationScreen()),
  GetPage(
      name: AppRoute.medicalSpecialtiesScreen,
      page: () => const MedicineDetailsScreen()),
  GetPage(name: AppRoute.resipeScreen, page: () => const ResipeScreen()),
  GetPage(name: AppRoute.userScreen, page: () => const UserScreen()),
  GetPage(name: AppRoute.checkoutScreen, page: () => const CheckoutScreen()),
  GetPage(name: AppRoute.orderHistoryScreen, page: () => const OrderHistoryScreen()),
  GetPage(name: AppRoute.userConsulationScreen, page: () =>   UserConsulationScreen()),

  //ResipeScreen UserScreen CheckoutScreen orderHistoryScreen UserConsulationScreen
  //! Pharmacy Routes

  GetPage(name: AppRoutePharmacy.mobileLayoutPharmacyScreen, page: () => const MobileLayoutPharmacyScreen()),
  GetPage(name: AppRoutePharmacy.orderHistoryPharmacyScreen, page: () => const OrderHistoryPharmacyScreen()),


  // MobileLayoutPharmacyScreen OrderHistoryPharmacyScreen



];
