import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_maps/core/constant/app_image_asset.dart';
import 'package:new_maps/view/medicines/widget/custom_listview_builder.dart';
import 'package:new_maps/view/medicines/widget/custom_text_form_field_search.dart';
import 'package:new_maps/view/medicines/widget/medicines_gridview.dart';
import 'package:new_maps/view/widget/image_profile_container.dart';

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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        FontAwesomeIcons.cartShopping, 
                      ),
                    ),
                    ImageProfileContainer(image:  AppImageAsset.pharmacy),
                  ],
                ),
              ),
              // MaxGap(10),
              CustomTextFormFieldSearch(),
              // MaxGap(10),
              const CustomListViewBuilder(),
              Divider(),
              const MedicineGridView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomCurvedNavigationBar(),
    );
  }
}

class CustomCurvedNavigationBar extends StatelessWidget {
  const CustomCurvedNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: 1,
      backgroundColor: const Color.fromRGBO(68, 138, 255, 1),
      items: const [
        CurvedNavigationBarItem(
          child: Icon(Icons.more_outlined),
          label: 'More',
        ),
        CurvedNavigationBarItem(
          child: Icon(Icons.home_outlined),
          label: 'Products',
        ),
        CurvedNavigationBarItem(
          child: Icon(Icons.perm_identity),
          label: 'Personal',
        ),
      ],
      onTap: (index) {
        // Handle button tap
        print(index);
      },
    );
  }
}
