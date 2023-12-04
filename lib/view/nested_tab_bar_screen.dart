import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/theme/decorion.dart';
import 'package:new_maps/view/medicines/widget/medicines_gridview.dart';

import 'medicines/widget/custom_text_form_field_search.dart';

class NestedTabBarScreen extends StatefulWidget {
  const NestedTabBarScreen({super.key});

  @override
  State<NestedTabBarScreen> createState() => _NestedTabBarScreenState();
}

class _NestedTabBarScreenState extends State<NestedTabBarScreen> {
  Color primaryColor = TColors.primary;
  @override
  Widget build(BuildContext context) {
    List<Tab> mainTabs = [
      const Tab(
        child: Text(
          'صنف رئيسي 1',
        ),
      ),
      const Tab(
        child: Text(
          'صنف رئيسي 2',
        ),
      ),
      const Tab(
        child: Text(
          'صنف رئيسي 3',
        ),
      ),
      const Tab(
        child: Text(
          'صنف رئيسي 4',
        ),
      ),
      const Tab(
        child: Text(
          'صنف رئيسي 5',
        ),
      ),
      const Tab(
        child: Text(
          'صنف رئيسي 6',
        ),
      ),
    ];

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
          toolbarHeight: 80,
          bottom: ButtonsTabBar(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            // unselectedBackgroundColor: TColors.white,
            decoration: const BoxDecoration(
              color: TColors.primary,
            ),
            elevation: 14,
            unselectedDecoration: decoration(TColors.white),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            splashColor: TColors.secondary,
            height: 50,
            labelSpacing: 10,

            buttonMargin:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            // isScrollable: true,
            // indicatorColor: TColors.white,
            // indicatorWeight: 3.0,
            onTap: (index) {},
            tabs: mainTabs,
          ),
        ),
        body: TabBarView(children: [
          HomeTopTabs(
            colorVal: primaryColor.value,
          ),
          HomeTopTabs(
            colorVal: primaryColor.value,
          ),
          HomeTopTabs(
            colorVal: primaryColor.value,
          ),
          HomeTopTabs(
            colorVal: primaryColor.value,
          ),
          HomeTopTabs(
            colorVal: primaryColor.value,
          ),
          HomeTopTabs(
            colorVal: primaryColor.value,
          ),
        ]),
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
    setState(() {
      // widget.colorVal = 0xFFFF5722;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> subTabs = [
      Tab(
        child: Container(
          child: Text(
            'صنف فرعي 1',
            style: TextStyle(
                color: tabController.index == 0
                    ? Color(widget.colorVal)
                    : Colors.grey),
          ),
        ),
      ),
      Tab(
        child: Container(
          child: Text(
            'صنف فرعي 2',
            style: TextStyle(
                color: tabController.index == 1
                    ? Color(widget.colorVal)
                    : Colors.grey),
          ),
        ),
      ),
      Tab(
        child: Container(
          child: Text(
            'صنف فرعي 3',
            style: TextStyle(
                color: tabController.index == 2
                    ? Color(widget.colorVal)
                    : Colors.grey),
          ),
        ),
      ),
      Tab(
        child: Container(
          child: Text(
            'صنف فرعي 4',
            style: TextStyle(
                color: tabController.index == 3
                    ? Color(widget.colorVal)
                    : Colors.grey),
          ),
        ),
      ),
      Tab(
        child: Container(
          child: Text(
            'صنف فرعي 5',
            style: TextStyle(
                color: tabController.index == 4
                    ? Color(widget.colorVal)
                    : Colors.grey),
          ),
        ),
      ),
      Tab(
        child: Container(
          child: Text(
            'صنف فرعي 6',
            style: TextStyle(
                color: tabController.index == 5
                    ? Color(widget.colorVal)
                    : Colors.grey),
          ),
        ),
      ),
    ];

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            isScrollable: true,
            controller: tabController,
            indicatorWeight: 2.0,
            indicatorColor: Color(widget.colorVal),
            unselectedLabelColor: Colors.grey,
            tabs: subTabs,
          ),
        ),
        body: const TabBarView(children: [
          SingleChildScrollView(
            child: MedicineGridView(),
          ),
          SingleChildScrollView(
            child: MedicineGridView(),
          ),
          SingleChildScrollView(
            child: MedicineGridView(),
          ),
          SingleChildScrollView(
            child: MedicineGridView(),
          ),
          SingleChildScrollView(
            child: MedicineGridView(),
          ),
          SingleChildScrollView(
            child: MedicineGridView(),
          ),
        ]),
      ),
    );
  }
}
