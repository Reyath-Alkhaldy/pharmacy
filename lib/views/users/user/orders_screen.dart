import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/user/orders_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import '../../../core/utils/constant/export_constant.dart';
import 'widgets/expansion_title_user_order.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrdersControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: TColors.primary,
        title: Text(
          "سجل طلباتي",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold, fontSize: 15, color: TColors.white),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const ImageIcon(
                AssetImage(AppImageIcon.arrow),
                color: TColors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: TColors.light,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Obx(
                    () => HandlingDataView(
                      statusRequest: controller.statusRequest.value,
                      widget: Column(
                        children: controller.orders.map((order) {
                          final date = DateTime.parse(order.createdAt);
                          final createdAt = DateTime(date.year, date.month,
                              date.day, date.hour, date.minute);
                          return ExpansionTitleUserOrder(
                            title: createdAt.toString(),
                            onExpansionChanged: (b) {
                              controller.gotoOrder(order.id);
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

//
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
//       ),
//     );
//   }
// }
