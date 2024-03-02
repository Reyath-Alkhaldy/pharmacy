import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/favorite/favorite_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/views/users/favorite/widgets/favorite_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "المفلضة",
            style: TextStyle(color: TColors.white),
          ),
          leadingWidth: 50,
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(60, 199, 180, 1),
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
                    )))
          ]),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => HandlingDataView(
                  statusRequest: controller.statusRequest.value,
                  widget: ListView.builder(
                    shrinkWrap: true,
                    controller: controller.scrollController,
                    // physics:  const NeverScrollableScrollPhysics(),
                    itemCount: controller.favorites.length,
                    padding: const EdgeInsets.all(5),
                    itemBuilder: (BuildContext context, int index) {
                      return FavoriteWidget(
                          controller: controller, index: index);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
