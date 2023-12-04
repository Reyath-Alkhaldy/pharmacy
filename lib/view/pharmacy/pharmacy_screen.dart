// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/app_image_asset.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/view/medicines/medicines_screen.dart';
import 'package:new_maps/view/medicines/widget/custom_text_form_field_search.dart';
import 'package:new_maps/view/pharmacy/widget/pharmacies_gridview.dart';

import '../widget/background_pharmacy_screen.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundPharmacyScreen(),
            Container(
              padding: const EdgeInsets.symmetric(
                  // horizontal: TSizes.spaceBtwItems,
                  vertical: TSizes.spaceBtwContainerVert),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: TSizes.spaceBtwItems,
                    ),
                    child: CustomTextFormFieldSearch(),
                  ),
                  TabBar(
                    controller: tabController,
                    indicatorColor: TColors.white,
                    indicatorWeight: 3,
                    indicatorPadding: const EdgeInsets.symmetric(horizontal: 50),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: TColors.white,
                    unselectedLabelColor: TColors.white,
                    tabs: const [
                      Tab(text: 'الصيدليات'),
                      Tab(text: 'الاستشارات'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: const [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              CarouselContainer(),
                              PharmaciesGridView(),
                            ],
                          ),
                        ),
                        MedicinesScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomCurvedNavigationBar(),
    );
  }
}

class CarouselContainer extends StatefulWidget {
  const CarouselContainer({super.key});

  @override
  State<CarouselContainer> createState() => _CarouselContainerState();
}

class _CarouselContainerState extends State<CarouselContainer> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.7,
        aspectRatio: 2.0,
        autoPlay: true,
      ),
      items: List.generate(
        5,
        (index) {
          return Container(
            margin: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              child: Image.asset(
                AppImageAsset.showers,
                fit: BoxFit.cover,
                // width: 50.0,
              ),
            ),
          );
        },
      ),
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
      height: 65,
      index: 1,
      backgroundColor: TColors.primary,
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

// class CustomTabBarView extends StatelessWidget {
//   const CustomTabBarView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       // mainAxisSize: MainAxisSize.max,
//       children: [
//         ImageAddShowers(
//           image: AppImageAsset.showers,
//         ),
//         PharmaciesGridView(),
//       ],
//     );
//   }
// }
