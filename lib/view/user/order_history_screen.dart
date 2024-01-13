import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';

import '../../core/utils/constant/export_constant.dart';
import 'widgets/icon_widget.dart';

 
class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: TColors.primary,
        title: Text(
          "سجب الطلبات",
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
        child: const Wrap(
          runSpacing: 16,
          children: [
            ExpansionTileWidget(),
            ExpansionTileWidget(),
            ExpansionTileWidget(),
            ExpansionTileWidget(),
          ],
        ),
      ),
    );
  }
}

//
class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        collapsedBackgroundColor: TColors.white,
        title: const Text('بتاريخ 2024/1/1'),
        subtitle: const Text("أنقر هنا لعرض الفاتورة"  , style: TextStyle(color: TColors.darkerGrey),),

        trailing: const Icon(Icons.keyboard_arrow_left_outlined),
        onExpansionChanged: (bool expan) {},
      ),
    );
  }
}
