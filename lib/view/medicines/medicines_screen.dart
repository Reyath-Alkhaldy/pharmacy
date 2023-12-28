import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/main_category_controller.dart';
import 'package:new_maps/core/utils/constant/app_image_asset.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/view/medicines/medicine_details_screen.dart';
import '../../core/utils/constant/app_image_icon.dart';
import '../../core/utils/constant/colors.dart';
import 'widget/custom_squre_listview_builder.dart';

class MedicinesScreen extends StatelessWidget {
  const MedicinesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final mainCategories = Get.put(MainCategoryControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        automaticallyImplyLeading: false,
        backgroundColor: TColors.primary,
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
      body: const SafeArea(
        child: Stack(
          children: [
            MyStack(),
            Column(
              children: [
                GFListTile(
                  color: TColors.white,
                  avatar: GFAvatar(
                    size: GFSize.MEDIUM,
                    backgroundImage: AssetImage(AppImageAsset.pharmacy),
                  ),
                  titleText: "صيدلية مكة",
                  subTitleText: "شارع تعز جوار مركز العزاني",
                  description: Text('770234262'),
                  padding: EdgeInsets.all(8),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomSqureListViewBuilder(),
                        Divider(),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 8.0, vertical: 0),
                        //   child: MedicineGridView(subCategory:),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: GFIconButton(
        color: Colors.white,
        shape: GFIconButtonShape.circle,
        iconSize: TSizes.iconLg,
        icon: const Icon(
          FontAwesomeIcons.camera,
          color: TColors.black,
        ),
        size: TSizes.iconLg,
        onPressed: () {},
      ),
    );
  }
}
