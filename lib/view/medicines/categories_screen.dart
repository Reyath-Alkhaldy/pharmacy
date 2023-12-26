// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/main_category_controller.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/view/medicines/widget/medicines_gridview.dart';
import '../../core/utils/theme/decorion.dart';
import 'widget/custom_text_form_field_search.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Color primaryColor = TColors.primary;
  final mainCategories = Get.put(MainCategoryControllerImp());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: const CustomTextFormFieldSearch(),
          ),
        ),
        body: Obx(() {
          if (mainCategories.isLoading.value == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return DefaultTabController(
              length: mainCategories.mainCategories.length,
              child: Column(
                children: [
                  TabBar(
                    labelStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                    labelColor: TColors.black,
                    indicator: const BoxDecoration(),
                    overlayColor:
                        const MaterialStatePropertyAll(TColors.primary),
                    unselectedLabelStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: TColors.grey, fontSize: 12),
                    splashBorderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    onTap: (index) {},
                    tabs: mainCategories.mainCategories
                        .map(
                          (mainCategory) => Tab(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              alignment: Alignment.center,
                              decoration: decoration(TColors.white),
                              height: 40,
                              child: Text(mainCategory.nameEn),
                            ),
                          ),
                        )
                        .toList(),
                  ),
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
            );
          }
        }));
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
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   ),
        body: Column(
          children: [
            TabBar(
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
              tabs: widget.mainCategory.subCategories!
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
            ),
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
