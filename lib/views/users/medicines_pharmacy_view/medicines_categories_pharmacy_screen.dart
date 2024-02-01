import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/views/users/medicines_pharmacy_view/widgets/medicines_gridview.dart';
import '../../../controller/user/pharmacies/categories_pharmacy_controller.dart';
import '../../../controller/user/pharmacies/medicines_pharmacy_controller.dart';
import '../../../core/utils/constant/export_constant.dart';
import '../../../core/utils/theme/decorion.dart';
import 'widgets/searchbar_medicines_pharmacy.dart';

class MedicinesCategoriesPharmacyScreen extends StatefulWidget {
  const MedicinesCategoriesPharmacyScreen({
    super.key,
  });
  @override
  State<MedicinesCategoriesPharmacyScreen> createState() =>
      _MedicinesCategoriesPharmacyScreenState();
}

class _MedicinesCategoriesPharmacyScreenState
    extends State<MedicinesCategoriesPharmacyScreen>
    with AutomaticKeepAliveClientMixin {
  final Color primaryColor = TColors.primary;
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    final categoriesPharmacyControllerImp =
        Get.put(CategoriesPharmacyControllerImp());

    super.build(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        automaticallyImplyLeading: false,
        backgroundColor: TColors.primary,
        title: InkWell(
          onTap: categoriesPharmacyControllerImp.getToCartScreen,
          child: const ImageIcon(
            AssetImage(AppImageIcon.cartNavigation),
          ),
        ),
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
          const MyStackMedicinesBackground(),
          Obx(
            () => HandlingDataView(
              statusRequest: categoriesPharmacyControllerImp.statusRequest,
              widget: Column(
                children: [
                  const GFSearchBarMedicinesPharmacy(),
                  Expanded(
                    child: DefaultTabController(
                      length:
                          categoriesPharmacyControllerImp.mainCategories.length,
                      child: Column(
                        children: [
                          GetBuilder<CategoriesPharmacyControllerImp>(
                            init: CategoriesPharmacyControllerImp(),
                            initState: (_) {},
                            builder: (_) {
                              return GFListTile(
                                color: TColors.white,
                                avatar: GFAvatar(
                                  size: GFSize.SMALL,
                                  child: Image.network(_.pharmacy!.image),
                                ),
                                title:Text(_.pharmacy!.name) ,
                                subTitle:Text(_.pharmacy!.address, style: const TextStyle(color: TColors.grey),) ,
                                // subTitleText: _.pharmacy!.address,
                                description: Text(_.pharmacy!.phoneNumber,style: const TextStyle(color: TColors.darkerGrey),),
                                padding: const EdgeInsets.all(8),
                              );
                            },
                          ),
                          //! Main TabBar
                          const MainTabBar(),
                          Expanded(
                            child: TabBarView(
                              children:
                                  categoriesPharmacyControllerImp.mainCategories
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
      ),
      floatingActionButton: InkWell(
        onTap: () => categoriesPharmacyControllerImp.goToAaddRecipe(),
        child: Container(
          height: 42,
          width: 140,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'اضف الوصفة',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: TColors.white),
              ),
              const ImageIcon(
                AssetImage(AppImageIcon.addRecipe),
                color: TColors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked
    );
  }
}

class MainTabBar extends StatelessWidget {
  const MainTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CategoriesPharmacyControllerImp categoryMedicineControllerImp =
        Get.find<CategoriesPharmacyControllerImp>();
    final medicinesControllerImp = Get.put(MedicinesPharmacyControllerImp());

    return Obx(() => TabBar(
          labelStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
          indicator: const BoxDecoration(),
          overlayColor: const MaterialStatePropertyAll(TColors.primary),
          splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          onTap: (index) {
            final mainCategory =
                categoryMedicineControllerImp.mainCategories[index];
            if (mainCategory.subCategories!.isNotEmpty) {
              medicinesControllerImp.getMedicines(
                  subCategoryID: mainCategory.subCategories![0].id,
                  pharmacyId: categoryMedicineControllerImp.pharmacy!.id);
            }
            categoryMedicineControllerImp.getMainCtgrySelected(
                mainCategory.id, mainCategory.subCategories![0].id);
          },
          tabs:
              categoryMedicineControllerImp.mainCategories.map((mainCategory) {
            final idSelectedMainTab =
                categoryMedicineControllerImp.mainCtgryIsSelected.value;
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
    final medicineController = Get.put(MedicinesPharmacyControllerImp());
    final CategoriesPharmacyControllerImp categoryMedicineControllerImp =
        Get.find<CategoriesPharmacyControllerImp>();
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
        final subCategory = mainCategory.subCategories![index];
        medicineController.getMedicines(
            subCategoryID: subCategory.id,
            pharmacyId: categoryMedicineControllerImp.pharmacy!.id);
        categoryMedicineControllerImp.getSubCtgrySelected(subCategory.id);
      },
      tabs: mainCategory.subCategories!.map((subCategory) {
        final idSelectedSubTab =
            categoryMedicineControllerImp.subCtgryIsSelected.value;
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

class MyStackMedicinesBackground extends StatelessWidget {
  const MyStackMedicinesBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: TColors.primary,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 140,
              decoration: const BoxDecoration(),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: TColors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
