// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import '../../../core/utils/constant/export_constant.dart';
import '../widget/background_user_view_screen.dart';
import 'order_history_screen.dart';
import 'widgets/current_blance_widget.dart';
import 'widgets/expansion_title_user.dart';
import 'widgets/user_profile.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: TColors.primary,
        title: Text(
          "ملفي الشخصي",
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
      backgroundColor: TColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundUserViewScreen(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Wrap(
                runSpacing: 16,
                children: [
                  const UserProfile(),
                  const CurrentBlanceWidget(),
                  ExpansionTitleUser(
                    title: "سجل الطلبات",
                    icon: Icons.keyboard_arrow_left_outlined,
                    leading:
                        const ImageIcon(AssetImage(AppImageIcon.shoppingBag)),
                    onExpansionChanged: (bool value) {
                      Get.to(const OrderHistoryScreen());
                    },
                  ),
                   ExpansionTitleUser(
                    title: "إستشارتي",
                    icon: Icons.keyboard_arrow_left_outlined,
                    leading:
                        const ImageIcon(AssetImage(AppImageIcon.consultant)),
                    onExpansionChanged: (bool value) {
                      Get.toNamed(AppRoute.userConsulationScreen);
                    },
                  ),
                  

                  ExpansionTitleUser(
                    title: "الإعدادات",
                    icon: Icons.keyboard_arrow_left_outlined,
                    leading:
                        const ImageIcon(AssetImage(AppImageIcon.setting)),
                    onExpansionChanged: (bool value) {
                      Get.to(const OrderHistoryScreen());
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

 