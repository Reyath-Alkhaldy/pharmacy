// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_maps/controller/user/user/orders_controller.dart';
// import 'package:new_maps/core/class/handlingdataview.dart';
// import '../../../core/utils/constant/export_constant.dart';
// import 'widgets/custom_tabbar_for_order.dart';

// class OrdersScreen extends StatefulWidget {
//   const OrdersScreen({super.key});

//   @override
//   State<OrdersScreen> createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//   late OrdersControllerImp controller;
//   @override
//   void initState() {
//     super.initState();
//     controller = Get.put(OrdersControllerImp());
//     tabController = TabController(length: 3, vsync: this);
//     tabController.addListener(() {
//       handleTabController();
//     });
//   }

//   void handleTabController() {
//     // print(tabController.index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // print('object');
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         backgroundColor: TColors.primary,
//         title: Text(
//           "سجل طلباتي",
//           style: Theme.of(context).textTheme.titleLarge!.copyWith(
//               fontWeight: FontWeight.bold, fontSize: 15, color: TColors.white),
//         ),
//         actions: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: InkWell(
//               onTap: () {
//                 Get.back();
//               },
//               child: const ImageIcon(
//                 AssetImage(AppImageIcon.arrow),
//                 color: TColors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: TColors.light,
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         child: DefaultTabController(
//           length: 3,
//           child: Column(
//             children: [
//               CustomTabBarForOrder(
//                   orderHistoryController: controller,
//                   tabController: tabController),
//               Expanded(
//                 child: TabBarView(
//                     // physics: const NeverScrollableScrollPhysics(),
//                     controller: tabController,
//                     children: [
//                       SingleChildScrollView(
//                           controller: controller.scrollController,
//                           child: Obx(
//                             () => HandlingDataView(
//                               statusRequest: controller.statusRequest.value,
//                               widget: Column(
//                                 children: controller.orders
//                                     .map((e) =>
//                                         ExpansionTileWidget(date: e.createdAt))
//                                     .toList(),
//                               ),
//                             ),
//                           )),
//                       SingleChildScrollView(
//                         child: Wrap(
//                           runSpacing: 8,
//                           children: List.generate(
//                               15,
//                               (index) => const ExpansionTileWidget(
//                                     date: '',
//                                   )),
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         child: Wrap(
//                           runSpacing: 8,
//                           children: List.generate(
//                               15,
//                               (index) => const ExpansionTileWidget(
//                                     date: '',
//                                   )),
//                         ),
//                       ),
//                     ]),
//               ),
//               // const ExpansionTileWidget(),
//               // const ExpansionTileWidget(),
//               // const ExpansionTileWidget(),
//               // const ExpansionTileWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //
// class ExpansionTileWidget extends StatelessWidget {
//   const ExpansionTileWidget({
//     super.key,
//     required this.date,
//   });
//   final String date;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ExpansionTile(
//         collapsedBackgroundColor: TColors.white,
//         title: Text(date),
//         subtitle: const Text(
//           "أنقر هنا لعرض الفاتورة",
//           style: TextStyle(color: TColors.darkerGrey),
//         ),
//         trailing: const Icon(Icons.keyboard_arrow_left_outlined),
//         onExpansionChanged: (bool expan) {},
//       ),
//     );
//   }
// }
