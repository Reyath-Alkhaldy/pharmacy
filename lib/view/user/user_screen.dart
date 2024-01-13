// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/utils/constant/export_constant.dart';
import '../widget/background_user_view_screen.dart';
import 'order_history_screen.dart';
import 'widgets/current_blance_widget.dart';
import 'widgets/expansion_title_user.dart';
import 'widgets/icon_widget.dart';

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
                    onExpansionChanged: (bool value) {
                      Get.to(const OrderHistoryScreen());
                    },
                  ),
                  buildMyConsulationScreen(),

                  ExpansionTitleUser(
                    title: "سجل الطلبات",
                    icon: Icons.keyboard_arrow_left_outlined,
                    onExpansionChanged: (bool value) {
                      Get.to(const OrderHistoryScreen());
                    },
                  ),
                  // Wrap(
                  //   direction: Axis.vertical,
                  //   children: [

                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text('رياض الخالدي'),
      subTitle: Wrap(
        spacing: 10,
        direction: Axis.horizontal,
        children: [
          Text(
            'تعديل',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Icon(
            Iconsax.user_edit,
            size: TSizes.iconSm,
          ),
        ],
      ),
      avatar: const GFAvatar(
        // child: Image.asset( AppImageAsset.myImageProfile),
        backgroundImage: AssetImage(AppImageAsset.myImageProfile),
      ),
    );
  }
}

Widget buildMyConsulationScreen() => SimpleSettingsTile(
      title: "إستشارتي",
      subtitle: '',
      leading: const IconWidget(
        icon: Iconsax.chart,
        color: TColors.primary,
      ),
      onTap: () {
        // switchList = darkMode;
      },
      child: Scaffold(
        backgroundColor: TColors.light,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: const Wrap(
            runSpacing: 16,
            children: [],
          ),
        ),
      ),
    );
