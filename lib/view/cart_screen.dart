import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/app_image_asset.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/view/Auth/widget/custom_button.dart';

import 'medicines_pharmacy_view/widgets/add_to_cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        leadingWidth: 50,
        centerTitle: true,
        backgroundColor: TColors.primary,
        title: const Text(
          "السلة",
          style: TextStyle(color: TColors.white),
        ),
        leading: InkWell(
          onTap: () {
            Get.toNamed(AppRoute.favorate);
          },
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: TColors.secondary.withOpacity(0.3),
                blurRadius: 2,
                spreadRadius: 2,
              )
            ], shape: BoxShape.circle),
            margin: const EdgeInsets.only(right: 20.0),
            child: const ImageIcon(
              AssetImage(AppImageIcon.favorite),
              color: TColors.secondary,
              size: TSizes.iconXs,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  // physics:  const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  padding: const EdgeInsets.all(10),
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
                          const Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('شراب'),
                                    ImageIcon(
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
                                    Text('1000 ريال'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomIconButton(
                                          icon: Icons.add,
                                          size: TSizes.iconLg,
                                          color: TColors.primary,
                                        ),
                                        Text(
                                          '1',
                                          style: TextStyle(
                                              fontSize: TSizes.fontSizeLg),
                                        ),
                                        CustomIconButton(
                                          icon: Icons.remove,
                                          size: TSizes.iconLg,
                                          color: TColors.secondary,
                                        ),
                                      ],
                                    ),
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
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 120,
              color: TColors.lightGrey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('الإجمالي'),
                      Text('2000 ريال'),
                    ],
                  ),
                  CustomButton(content: 'طلب', onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
