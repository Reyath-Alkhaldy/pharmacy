import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/user/user/order_history_controller.dart';
import '../../../../core/utils/constant/export_constant.dart';
import '../../../../core/utils/theme/decorion.dart';

class CustomTabBarForOrder extends StatelessWidget {
  const CustomTabBarForOrder({
    super.key,
    required this.orderHistoryController,
    required this.tabController,
  });

  final OrderHistoryControllerImp orderHistoryController;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: GetBuilder<OrderHistoryControllerImp>(
        init: OrderHistoryControllerImp(),
        initState: (_) {},
        builder: (_) {
          return TabBar(
            physics: const NeverScrollableScrollPhysics(),
            onTap: orderHistoryController.getTabSelected,
            padding: const EdgeInsets.symmetric(vertical: 5),
            isScrollable: true,
            controller: tabController,
            tabAlignment: TabAlignment.start,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: TColors.white),
            indicator: const BoxDecoration(),
            tabs: [
              Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  decoration: orderHistoryController.tabIndex == 0
                      ? decorationTabSelected(TColors.primary)
                      : decoration(TColors.white),
                  child: const Text('الكل'),
                ),
              ),
              Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  decoration: orderHistoryController.tabIndex == 1
                      ? decorationTabSelected(TColors.primary)
                      : decoration(TColors.white),
                  child: const Text('من رصيدي'),
                ),
              ),
              Tab(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  decoration: orderHistoryController.tabIndex == 2
                      ? decorationTabSelected(TColors.primary)
                      : decoration(TColors.white),
                  child: const Text('عند الإستلام'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
