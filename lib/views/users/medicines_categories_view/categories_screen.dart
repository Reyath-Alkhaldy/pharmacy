import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/categories/main_category_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/views/users/medicines_pharmacy_view/medicine_details_screen.dart';
import '../../../controller/user/categories/medicines_category_controller.dart';
import '../../../core/utils/constant/export_constant.dart';
import '../../../core/utils/theme/decorion.dart';
import 'widgets/medicines_gridview.dart';
import 'widgets/searchbar_medicines_categories.dart';

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
    final mainCategories = Get.put(MainCategoryControllerImp());
    super.build(context);
    return Scaffold(
        body: Stack(
      children: [
        const MyStackCategoryBackground(),
        Obx(
          () => HandlingDataView(
            statusRequest: mainCategories.statusRequest,
            widget: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const GFSearchBarMedicinesCategories(),
                Expanded(
                  child: DefaultTabController(
                    length: mainCategories.mainCategories.length,
                    child: Column(
                      children: [
                        //! Main TabBar
                        const MainTabBar(),
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
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class MainTabBar extends StatelessWidget {
  const MainTabBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final MainCategoryControllerImp mainCategoriesController =
        Get.find<MainCategoryControllerImp>();
    final medicinesCategoryControllerImp =
        Get.put(MedicinesCategoryControllerImp());
    return Obx(() => TabBar(
          indicator: const BoxDecoration(),
          overlayColor: const MaterialStatePropertyAll(TColors.primary),
          splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          onTap: (index) {
            final mainCategory = mainCategoriesController.mainCategories[index];
            if (mainCategory.subCategories!.isNotEmpty) {
              medicinesCategoryControllerImp.getMedicines(
                  subCategoryID: mainCategoriesController
                      .mainCategories[index].subCategories![0].id);
              mainCategoriesController.getMainCtgrySelected(
                  mainCategory.id, mainCategory.subCategories![0].id);
            }
          },
          tabs: mainCategoriesController.mainCategories.map((mainCategory) {
            final idSelectedMainTab =
                mainCategoriesController.mainCtgryIsSelected.value;

            return Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                decoration: idSelectedMainTab == mainCategory.id
                    ? decorationTabSelected(TColors.primary)
                    : decoration(TColors.white),
                height: 35,
                child: Text(
                  mainCategory.nameEn,
                  style: TextStyle(
                    fontSize: 11,
                    color: idSelectedMainTab == mainCategory.id
                        ? TColors.white
                        : TColors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ));
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
  const SubTabBar({
    super.key,
    required this.tabController,
    required this.mainCategory,
  });

  final TabController tabController;
  final MainCategory mainCategory;
  @override
  Widget build(BuildContext context) {
    final medicineController = Get.put(MedicinesCategoryControllerImp());
    final mainCategories = Get.find<MainCategoryControllerImp>();

    return TabBar(
      indicator: const BoxDecoration(),
      overlayColor: const MaterialStatePropertyAll(TColors.primary),
      splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      controller: tabController,
      onTap: (index) {
        final subCategory = mainCategory.subCategories![index];
        medicineController.getMedicines(subCategoryID: subCategory.id);
        mainCategories.getSubCtgrySelected(subCategory.id);
      },
      tabs: mainCategory.subCategories!.map((subCategory) {
        final idSelectedSubTab = mainCategories.subCtgryIsSelected.value;
        return Tab(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            decoration: idSelectedSubTab == subCategory.id
                ? decorationTabSelected(TColors.primary)
                : decoration(TColors.white),
            height: 35,
            child: Text(subCategory.nameEn,
                style: TextStyle(
                    fontSize: 11,
                    color: idSelectedSubTab == subCategory.id
                        ? TColors.textWhite
                        : TColors.black)),
          ),
        );
      }).toList(),
    );
  }
}
