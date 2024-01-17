import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/cart/cart_controller.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/models/cart.dart';
import 'package:new_maps/data/models/medicine.dart';

import '../../core/class/status_request.dart';

abstract class MedicineDetailsController extends GetxController {
  increment();
  decrement();
  goBack();
  goToCart();
  goToSignIn();
  addToCart();
}

class MedicineDetailsControllerImp extends MedicineDetailsController
    with GetSingleTickerProviderStateMixin {
  late Medicine medicine;
  StatusRequest statusRequest = StatusRequest.none;
  TabController? tabController;
  late CartControllerImp cartControllerImp;
  int count = 1;
  double total = 0.0;

  @override
  void onInit() {
    super.onInit();
    statusRequest = StatusRequest.loading;
    _getInit();
    statusRequest = StatusRequest.success;
    update();
  }

  _getInit() {
    cartControllerImp = Get.find<CartControllerImp>();
    tabController = TabController(length: 2, vsync: this);
    medicine = Get.arguments['medicine'];
    total = medicine.price;
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  goBack() {
    Get.back();
  }

  @override
  goToCart() {
    throw UnimplementedError();
  }

  @override
  goToSignIn() {
    Get.toNamed(AppRoute.login);
  }

  @override
  addToCart() async {
    statusRequest = StatusRequest.loading;
    await cartControllerImp.add(MedicineCart.fromMap(medicine.toMap()), count);
    statusRequest = StatusRequest.success;
  }

  @override
  decrement() {
    count--;
    total = count * medicine.price;
    update();
  }

  @override
  increment() {
    count++;
    total = count * medicine.price;
    update();
  }
}

// import 'package:flutter/material.dart';

// /// Flutter code sample for [LinearProgressIndicator].

// void main() => runApp(const ProgressIndicatorApp());

// class ProgressIndicatorApp extends StatelessWidget {
//   const ProgressIndicatorApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ProgressIndicatorExample(),
//     );
//   }
// }

// class ProgressIndicatorExample extends StatefulWidget {
//   const ProgressIndicatorExample({super.key});

//   @override
//   State<ProgressIndicatorExample> createState() =>
//       _ProgressIndicatorExampleState();
// }

// class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
//     with TickerProviderStateMixin {
//   late AnimationController controller;

//   @override
//   void initState() {
//     controller = AnimationController(
//       /// [AnimationController]s can be created with `vsync: this` because of
//       /// [TickerProviderStateMixin].
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     )..addListener(() {
//         setState(() {});
//       });
//     controller.repeat(reverse: true);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             const Text(
//               'Linear progress indicator with a fixed color',
//               style: TextStyle(fontSize: 20),
//             ),
//             LinearProgressIndicator(
//               value: controller.value,
//               semanticsLabel: 'Linear progress indicator',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
