import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/constant/export_constant.dart';

class DrawerMobileHome extends StatelessWidget {
  const DrawerMobileHome({
    super.key,
  });
// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }
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
          leading: const Icon(FontAwesomeIcons.user, color: Colors.blue),
          title: const Text('الملف الشخصي'),
          onTap: () {
            Get.back();
            Get.toNamed(AppRoute.userScreen);
          },
        ),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('الصفحة الرئيسية'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.favorite_outline, color: TColors.secondary),
          title: const Text('المفضلة'),
          onTap: () {
            Get.toNamed(AppRoute.favorate);
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(
            Icons.call,
            color: TColors.primary,
          ),
          title: const Text('للتواصل أو الإستفسار'),
          subtitle: const Text(
            '+967 714 000 300',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.end,
          ),
          onTap: () async {
            var url = Uri(scheme: "tel", path: '714000300');
            // print(await canLaunchUrl(url));
            if (await canLaunchUrl(url)) launchUrl(url);
          },
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
