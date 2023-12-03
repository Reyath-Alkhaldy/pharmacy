import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_maps/core/utils/constant/app_image_asset.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/view/medicines/widget/custom_text_form_field_search.dart';
import 'package:new_maps/view/medicines/widget/medicines_gridview.dart';
import 'package:new_maps/view/widget/image_profile_container.dart';

import 'widget/custom_squre_listview_builder.dart';

class MedicinesScreen extends StatelessWidget {
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(30.0),
                //   boxShadow: const [
                //     BoxShadow(
                //       color: TColors.softGrey,
                //       spreadRadius: 4,
                //       offset: Offset(2, 2),
                //       blurRadius: 4,
                //     ),
                //     BoxShadow(
                //       color: TColors.grey,
                //       spreadRadius: 4,
                //       offset: Offset(-2, -2),
                //       blurRadius: 4,
                //     ),
                //   ],
                //   color: TColors.white,
                // ),
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.spaceBtwContainerHoriz,
                ),
                height: 70,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        FontAwesomeIcons.cartShopping,
                      ),
                    ),
                    ImageProfileContainer(image: AppImageAsset.pharmacy),
                  ],
                ),
              ),
              const CustomTextFormFieldSearch(),
                CustomSqureListViewBuilder(),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: MedicineGridView(),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const CustomCurvedNavigationBar(),
    );
  }
}

