import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/controller/repository/medicine_tab_data.dart';
import 'package:new_maps/view/medicines/widget/medicines_gridview.dart';

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
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: primaryColor,
          title: Container(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: const CustomTextFormFieldSearch(),
          ),
          toolbarHeight: 90,

          bottom: TabBar(
            labelStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 17, fontWeight: FontWeight.bold),
            labelColor: TColors.black,
            indicator: const BoxDecoration(),
            overlayColor: const MaterialStatePropertyAll(TColors.primary),
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: TColors.grey, fontSize: 14),
            splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            onTap: (index) {},
            tabs: mainTabs,
          ),
        ),
        body: TabBarView(
            children: List.generate(
          6,
          (index) => HomeTopTabs(
            colorVal: primaryColor.value,
          ),
        )),
      ),
    );
  }
}

//! -----------
// ignore: must_be_immutable
class HomeTopTabs extends StatefulWidget {
  HomeTopTabs({super.key, required this.colorVal});
  int colorVal;

  @override
  State<HomeTopTabs> createState() => _HomeTopTabsState();
}

class _HomeTopTabsState extends State<HomeTopTabs>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
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
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
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
            tabs: subTabs,
          ),
        ),
        body: TabBarView(
            children: List.generate(
          6,
          (index) => const SingleChildScrollView(
            child: MedicineGridView(),
          ),
        )),
      ),
    );
  }
}
