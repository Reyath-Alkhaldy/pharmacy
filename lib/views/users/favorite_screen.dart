import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/app_image_asset.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/views/users/Auth/widget/custom_button.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          ]
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  // physics:  const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(8),
                      decoration: decoration(TColors.white),
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 150,
                              width: 150,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Image.asset(
                                AppImageAsset.m1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('شراب $index'),
                                    const ImageIcon(
                                      AssetImage(AppImageIcon.trash),
                                      color: TColors.secondary,
                                      size: TSizes.iconLg,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('1000 ريال'),
                                    CustomButton(
                                        content: 'أضافة للسلة',
                                        width: 120,
                                        style: const TextStyle(
                                            fontSize: 14, color: TColors.white),
                                        onPressed: () {})
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
