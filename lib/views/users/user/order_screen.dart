import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/user/order_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(OrderControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الطلب'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: TColors.primary,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columnSpacing: 20,
              columns: const [
                DataColumn(label: Text('الاسم')),
                DataColumn(label: Text('السعر')),
                DataColumn(label: Text('الكمية')),
                DataColumn(label: Text('الإجمالي')),
              ],
              rows: controller.order.medicines
                  !.map((medicine) => DataRow(cells: [
                        DataCell(Text(medicine.nameEn)),
                        DataCell(Text(medicine.price.toStringAsFixed(2))),
                        DataCell(Text(medicine.orderMedicine!.quantity.toString())),
                        DataCell(Text((medicine.price * medicine.orderMedicine!.quantity)
                            .toStringAsFixed(2))),
                      ]))
                  .toList(),
            ),
            const Divider(),
            const Divider(color: TColors.primary),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('المجموع'),
                Text(controller.order.total.toStringAsFixed(2)),
              ],
            ),
            const Divider(color: TColors.primary),
          ],
        ),
      ),
    );
  }
}
