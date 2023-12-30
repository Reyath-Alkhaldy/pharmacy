import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/main_category_controller.dart';
import 'package:new_maps/controller/medicines_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/view/medicines/medicine_details_screen.dart';
import 'package:new_maps/view/medicines/widget/medicines_gridview.dart';
import '../../core/utils/constant/export_constant.dart';
import '../../core/utils/theme/decorion.dart';
import 'widget/custom_text_form_field_search.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
  });
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with AutomaticKeepAliveClientMixin {
  final Color primaryColor = TColors.primary;
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    final mainCategories =
        Get.put(MainCategoryControllerImp());

    super.build(context);
    return Scaffold(
        appBar:    
             AppBar(
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
        body: Stack(
          children: [
            const MyStack(),
            Column(
              children: [
                const CustomTextFormFieldSearch(),
                Expanded(
                  child: Obx(
                    () => HandlingDataView(
                      statusRequest: mainCategories.statusRequest.value,
                      widget: DefaultTabController(
                        length: mainCategories.mainCategories.length,
                        child: Column(
                          children: [
                              GetBuilder<MainCategoryControllerImp>(
                                init: MainCategoryControllerImp(),
                                initState: (_) {},
                                builder: (_) {
                                  return GFListTile(
                                    color: TColors.white,
                                    avatar: GFAvatar(
                                      size: GFSize.MEDIUM,
                                      child: Image.network(
                                          _.pharmacy!.image),
                                    ),
                                    titleText: _.pharmacy!.name,
                                    subTitleText: _.pharmacy!.address,
                                    description:
                                        Text(_.pharmacy!.phoneNumber),
                                    padding: const EdgeInsets.all(8),
                                  );
                                },
                              ),
                            //! Main TabBar
                            MainTabBar(),
                            Expanded(
                              child: TabBarView(
                                children: mainCategories.mainCategories
                                    .map(
                                      (mainCategory) => HomeTopTabs(
                                          colorVal: primaryColor.value,
                                          mainCategory: mainCategory),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class MainTabBar extends StatelessWidget {
  MainTabBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final MainCategoryControllerImp mainCategoriesController =
        Get.find<MainCategoryControllerImp>( );
    final medicineController =
        Get.put(MedicinesControllerImp() );

    return TabBar(
      labelStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
      labelColor: TColors.black,
      indicator: const BoxDecoration(),
      overlayColor: const MaterialStatePropertyAll(TColors.primary),
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: TColors.grey, fontSize: 12),
      splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      onTap: (index) {
        if (mainCategoriesController
            .mainCategories[index].subCategories!.isNotEmpty) {
          print('on tabbbbbbbbbbbbbbbbbbbbbbbb main TAb $index');
          medicineController.getMedicines(
              subCategoryID: mainCategoriesController
                  .mainCategories[index].subCategories![0].id);
        }
      },
      tabs: mainCategoriesController.mainCategories
          .map(
            (mainCategory) => Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                decoration: decoration(TColors.white),
                height: 40,
                child: Text(mainCategory.nameEn),
              ),
            ),
          )
          .toList(),
    );
  }
}

//! -----------
// ignore: must_be_immutable
class HomeTopTabs extends StatefulWidget {
  const HomeTopTabs({
    super.key,
    required this.colorVal,
    required this.mainCategory,
  });
  final int colorVal;
  final MainCategory mainCategory;

  @override
  State<HomeTopTabs> createState() => _HomeTopTabsState();
}

class _HomeTopTabsState extends State<HomeTopTabs>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: widget.mainCategory.subCategories!.length, vsync: this);
    tabController.addListener(() {
      handleTabController();
    });
  }

  void handleTabController() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.mainCategory.subCategories!.length,
      child: Scaffold(
        body: Column(
          children: [
            SubTabBar(
                tabController: tabController,
                mainCategory: widget.mainCategory),
            Expanded(
              child: TabBarView(
                children: widget.mainCategory.subCategories!
                    .map(
                      (subCategory) => SingleChildScrollView(
                        child: MedicineGridView(
                          subCategory: subCategory,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubTabBar extends StatelessWidget {
  SubTabBar({
    super.key,
    required this.tabController,
    required this.mainCategory,
  });

  final TabController tabController;
  final MainCategory mainCategory;
  @override
  Widget build(BuildContext context) {
    final medicineController = Get.put(MedicinesControllerImp());

    return TabBar(
      labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
      labelColor: TColors.black,
      indicator: const BoxDecoration(),
      overlayColor: const MaterialStatePropertyAll(TColors.primary),
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: TColors.grey, fontSize: 12),
      splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      controller: tabController,
      onTap: (index) {
        if (kDebugMode) {
          print('on tabbbbbbbbbbbbbbbbbbbbbbbb $index');
        }
        medicineController.getMedicines(
            subCategoryID: mainCategory.subCategories![index].id);
      },
      tabs: mainCategory.subCategories!
          .map(
            (subCategory) => Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                decoration: decoration(TColors.white),
                height: 40,
                child: Text(
                  subCategory.nameEn,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
