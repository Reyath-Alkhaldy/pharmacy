import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/views/pharmacy_admin/order_history/widgets/custom_tabbar_for_pharmacy_order.dart';
import '../../../controller/user/user/order_history_controller.dart';
import '../../../core/utils/constant/export_constant.dart';
import '../../user/widget/background_user_view_screen.dart';

class OrderHistoryPharmacyScreen extends StatefulWidget {
  const OrderHistoryPharmacyScreen({super.key});

  @override
  State<OrderHistoryPharmacyScreen> createState() =>
      _OrderHistoryPharmacyScreenState();
}

class _OrderHistoryPharmacyScreenState extends State<OrderHistoryPharmacyScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late OrderHistoryControllerImp orderHistoryController;
  @override
  void initState() {
    super.initState();
    orderHistoryController = Get.put(OrderHistoryControllerImp());
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      handleTabController();
    });
  }

  void handleTabController() {
    print(tabController.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundUserViewScreen(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    CustomTabBarForPharmacyOrder(
                        orderHistoryController: orderHistoryController,
                        tabController: tabController),
                    Expanded(
                      child: TabBarView(controller: tabController, children: [
                        SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 8,
                            children: List.generate(
                                15, (index) => const ExpansionOrderWidget()),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 8,
                            children: List.generate(
                                15, (index) => const ExpansionOrderWidget()),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: TColors.primary,
      title: Text(
        "سجل الطلبات",
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
    );
  }
}


//!     
class ExpansionOrderWidget extends StatelessWidget {
  const ExpansionOrderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        collapsedBackgroundColor: TColors.white,
        title: const Text('اسم العميل'),
        subtitle: const Text(
           "2024/1/1",
          style: TextStyle(color: TColors.darkerGrey),
        ),
        trailing: const Icon(Icons.keyboard_arrow_left_outlined),
        onExpansionChanged: (bool expan) {
          
        },
      ),
    );
  }
}
