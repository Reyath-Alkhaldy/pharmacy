// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:new_maps/core/utils/constant/app_image_asset.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/generated/l10n.dart';
import 'package:new_maps/view/medicines/widget/custom_text_form_field_search.dart';
import 'package:new_maps/view/pharmacy/consultation_screen.dart';
import 'package:new_maps/view/pharmacy/widget/list_view_pharmacies.dart';

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
                    child: CarouselContainer(),
                  ),
                  TabBar(
                    controller: tabController,
                    indicatorColor: TColors.white,
                    indicatorWeight: 3,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 50),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: TColors.white,
                    unselectedLabelColor: TColors.white,
                    tabs:   [
                      //! pharmacies and consultations tabs
                      Tab(text: S.of(context).pharmacies),
                      Tab(text: S.of(context).consultations),
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
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: CustomTextFormFieldSearch(),
                              ),
                              ListViewPharmacies()
                              // PharmaciesGridView(),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                            child: ConsultationScreen()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomSheet: DoctorGFBottomSheet(controller: controller),
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
