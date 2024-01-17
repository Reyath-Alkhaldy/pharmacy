import 'package:badges/badges.dart'as bd;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/user/user/order_history_controller.dart';
import '../../../../core/utils/constant/export_constant.dart';
import '../../../../core/utils/theme/decorion.dart';

class CustomTabBarForPharmacyOrder extends StatelessWidget {
  const CustomTabBarForPharmacyOrder({
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
            // physics: const NeverScrollableScrollPhysics(),
            onTap: orderHistoryController.getTabSelected,
            padding: const EdgeInsets.symmetric(vertical: 5),
            // isScrollable: true,
            controller: tabController,
            // tabAlignment: TabAlignment.start,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: TColors.white),
            indicator: const BoxDecoration(),
            tabs: [
              Tab(
                child: bd.Badge(
                  position: bd.BadgePosition.topStart(top: -15,start: -0),
                  badgeContent:   Text('6',style:  Theme.of(context).textTheme.bodyMedium!.copyWith(color: TColors.white),),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    decoration: orderHistoryController.tabIndex == 0
                        ? decorationTabSelected(TColors.primary)
                        : decoration(TColors.white),
                    child: const Text('قيد الإنتظار'),
                  ),
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
                  child: const Text('تم التسليم'),
                ),
              ),
             
            ],
          );
        },
      ),
    );
  }
}
