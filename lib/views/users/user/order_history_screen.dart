import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/user/order_history_controller.dart';
import '../../../core/utils/constant/export_constant.dart';
import 'widgets/custom_tabbar_for_order.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late OrderHistoryControllerImp orderHistoryController;
  @override
  void initState() {
    super.initState();
    orderHistoryController = Get.put(OrderHistoryControllerImp());
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      handleTabController();
    });
  }

  void handleTabController() {
    // print(tabController.index);
  }

  @override
  Widget build(BuildContext context) {
    // print('object');
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
        child: DefaultTabController(
          length: 3,
          child: Column(
            // runSpacing: 16,
            children: [
              CustomTabBarForOrder(orderHistoryController: orderHistoryController, tabController: tabController),
              Expanded(
                child: TabBarView(
                    // physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      SingleChildScrollView(
                        child: Wrap(
                          runSpacing: 8,
                          children: List.generate(
                              15, (index) => const ExpansionTileWidget()),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Wrap(
                          runSpacing: 8,
                          children: List.generate(
                              15, (index) => const ExpansionTileWidget()),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Wrap(
                          runSpacing: 8,
                          children: List.generate(
                              15, (index) => const ExpansionTileWidget()),
                        ),
                      ),
                    ]),
              ),
              // const ExpansionTileWidget(),
              // const ExpansionTileWidget(),
              // const ExpansionTileWidget(),
              // const ExpansionTileWidget(),
            ],
          ),
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
        subtitle: const Text(
          "أنقر هنا لعرض الفاتورة",
          style: TextStyle(color: TColors.darkerGrey),
        ),
        trailing: const Icon(Icons.keyboard_arrow_left_outlined),
        onExpansionChanged: (bool expan) {},
      ),
    );
  }
}
