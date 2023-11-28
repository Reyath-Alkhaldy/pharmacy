// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:new_maps/core/constant/app_image_asset.dart';
import 'package:new_maps/view/medicines/widget/custom_text_form_field_search.dart';
import 'package:new_maps/view/pharmacy/widget/image_add%7Bshowers.dart';
import 'package:new_maps/view/pharmacy/widget/pharmacies_gridview.dart';

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
      // appBar: AppBar(
      //   title: Container(
      //     padding: const EdgeInsets.symmetric(
      //       // horizontal: 10,
      //       vertical: 20,
      //     ),
      //     width: double.infinity + 20,
      //     child: SearchBar(
      //       trailing: [
      //         Icon(
      //           FontAwesomeIcons.search,
      //         ),
      //       ],
      //       hintText: 'search',

      //     ),
      //   ),

      // ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const CustomTextFormFieldSearch(),
              const ImageAddShowers(
                image: AppImageAsset.showers,
              ),
              SizedBox(
                height: 50,
                child: TabBar(
                  isScrollable: true,
                  controller: tabController,
                  //  indicatorColor: tabColor,
                  indicatorWeight: 4,
                  // labelColor: tabColor,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(text: 'Pharmacies'),
                    Tab(text: 'roshetss'),
                  ],
                ),
              ),
              Expanded(
                // height:   MediaQuery.of(context).size.height,
                child: TabBarView(
                  physics: const  NeverScrollableScrollPhysics(),
          
                  controller: tabController,
                  children: const [
                    PharmaciesGridView(),
                    PharmaciesGridView(),
                    // CustomTabBarView(),
                    // CustomTabBarView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
