import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../core/utils/constant/export_constant.dart';

class DrawerMobileHome extends StatelessWidget {
  const DrawerMobileHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // surfaceTintColor: TColors.white,shadowColor:TColors.white ,
      elevation: 0.0,
      child: SingleChildScrollView(
        child: Column(children: [
          buildHeader(context),
          buildMenuItems(),
        ]),
      ),
    );
  }
}

buildMenuItems() {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          // splashColor: TColors.primary,
          leading: const Icon(FontAwesomeIcons.user),
          title: const Text('الملف الشخصي'),
          onTap: () {
            Get.toNamed(AppRoute.userScreen);
          },
        ),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('الصفحة الرئيسية'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: const Text('المفضلة'),
          onTap: () {
            Get.toNamed(AppRoute.favorate);

          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('الأعدادت'),
          onTap: () {},
        ),
      ],
    ),
  );
}

buildHeader(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 20 + MediaQuery.of(context).padding.top),
  );
}
