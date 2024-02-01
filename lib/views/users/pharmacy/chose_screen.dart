import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/pharmacies/chose_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/widget/background_user_view_screen.dart';

class ChoseScreen extends StatelessWidget {
  const ChoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChoseControllerImp());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: TColors.primary,
        title:   InkWell(
          onTap: controller.getToCartScreen,
          child: const ImageIcon(
            AssetImage(AppImageIcon.cartNavigation),
          ),
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
                // runAlignment: WrapAlignment.center,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  InkWell(
                    onTap: () => controller.goToAaddRecipe(),
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Image(
                                image:
                                    AssetImage(AppImageAsset.takePhotoRoshet),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Gap(5),
                            const Text('صور الروشتة')
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () => controller
                        .goToMedicinesCategoriesPharmacyScreenScreen(),
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Image(
                                image:
                                    AssetImage(AppImageAsset.requestMedicine),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Gap(5),
                            const Text('تصفح الأدوية والطلب')
                          ],
                        )),
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
