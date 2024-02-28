import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/main.dart';
import 'package:new_maps/views/users/mobile_layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/constant/export_constant.dart';

class DrawerMobileHome extends StatelessWidget {
  const DrawerMobileHome({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: SingleChildScrollView(
        child: Column(children: [
          buildHeader(context),
          buildMenuItems(context),
        ]),
      ),
    );
  }
}

buildMenuItems(BuildContext context) {
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();

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
            // Get.back();
            if (getStorage.getUserResponse('user') != null) {
              Get.toNamed(AppRoute.userScreen);
            } else {
              showDialogg('رسالة', 'يجب عليك تسجيل الدخول أولا .',
                  loginMessage: true);
            }
          },
        ),
        // ListTile(
        //   leading: const Icon(Icons.home_outlined),
        //   title: const Text('الصفحة الرئيسية'),
        //   onTap: () {},
        // ),
        ListTile(
          leading: const Icon(Icons.favorite_outline, color: TColors.secondary),
          title: const Text('المفضلة'),
          onTap: () {
            if (getStorage.getUserResponse('user') != null) {
              Get.toNamed(AppRoute.favorate);
            } else {
              showDialogg('رسالة', 'يجب عليك تسجيل الدخول أولا .',
                  loginMessage: true);
            }
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
        if (getStorage.getDoctorResponse('doctor') != null)
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: TColors.primary,
            ),
            title: const Text('تسجيل الخروج'),
            onTap: () async {
              // await Get.deleteAll(force: true); //deleting all controllers

              // Phoenix.rebirth(Get.context!); // Restarting app
              // await Get.deleteAll(force: true); //deleting all controllers
              Get.reset(); //
              Get.offAll(() => const MobileLayoutScreen());

              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (BuildContext context) {
              //   return const MobileLayoutScreen();
              // }), (route) => false);
            },
          ),
        const Divider(),

        ListTile(
          leading: const ImageIcon(
            AssetImage(AppImageIcon.doctor),
            color: TColors.secondary,
            size: 18,
          ),
          title: const Text('المتابعة كطبيب'),
          subtitle: const Text(
            'قدم إستشاراتك',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.end,
          ),
          onTap: () {
            if (getStorage.getDoctorResponse('doctor') != null) {
              Get.toNamed(AppRouteDoctor.doctorConsulationsScreen);
            } else {
              showDialogDoctor('رسالة', 'يجب عليك تسجيل الدخول أولا .',
                  loginMessage: true);
            }
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
