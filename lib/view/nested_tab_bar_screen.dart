import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/view/medicines/widget/medicines_gridview.dart';

class NestedTabBarScreen extends StatefulWidget {
  const NestedTabBarScreen({super.key});

  @override
  State<NestedTabBarScreen> createState() => _NestedTabBarScreenState();
}

class _NestedTabBarScreenState extends State<NestedTabBarScreen> {
  Color primaryColor = TColors.primary;
  @override
  Widget build(BuildContext context) {
    void switchColor(int index) {
      setState(() {
        switch (index) {
          case 0:
            primaryColor = const Color(0xFFFF5722);
            break;
          case 1:
            primaryColor = const Color(0xFF3F51B5);
            break;
          case 2:
            primaryColor = const Color(0xFFE91E63);
            break;
          case 3:
            primaryColor = const Color(0xFF9C27B0);
            break;
          case 4:
            primaryColor = const Color(0xFF2196F3);
            break;
          case 5:
            primaryColor = Colors.black87.withOpacity(0.6);
            break;
          default:
        }
      });
    }

    List<Tab> mainTabs = [
      Tab(
        child: Container(
          child: const Text(
            'صنف رئيسي 1',
            style: TextStyle(
              color: TColors.white,
              fontSize: TSizes.fontSizeLg,
            ),
          ),
        ),
      ),
      Tab(
        child: Container(
          child: const Text(
            'صنف رئيسي 2',
            style: TextStyle(
              color: TColors.white,
              fontSize: TSizes.fontSizeLg,
            ),
          ),
        ),
      ),
      Tab(
        child: Container(
          child: const Text(
            'صنف رئيسي 3',
            style: TextStyle(
              color: TColors.white,
              fontSize: TSizes.fontSizeLg,
            ),
          ),
        ),
      ),
      Tab(
        child: Container(
          child: const Text(
            'صنف رئيسي 4',
            style: TextStyle(
              color: TColors.white,
              fontSize: TSizes.fontSizeLg,
            ),
          ),
        ),
      ),
      Tab(
        child: Container(
          child: const Text(
            'صنف رئيسي 5',
            style: TextStyle(
              color: TColors.white,
              fontSize: TSizes.fontSizeLg,
            ),
          ),
        ),
      ),
      Tab(
        child: Container(
          child: const Text(
            'صنف رئيسي 6',
            style: TextStyle(
              color: TColors.white,
              fontSize: TSizes.fontSizeLg,
            ),
          ),
        ),
      ),
    ];

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title: const Padding(
            padding: EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: GooglePlayAppBar(),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: TColors.white,
            indicatorWeight: 6.0,
            onTap: (index) {
              switchColor(index);
            },
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

class GooglePlayAppBar extends StatelessWidget {
  const GooglePlayAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchBar(
      hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black87)),
      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black)),
      elevation: MaterialStatePropertyAll(7),
      shadowColor: MaterialStatePropertyAll(Colors.black87),
      trailing: [
        Icon(
          FontAwesomeIcons.search,
        ),
        SizedBox(
          width: 10,
        ),
        // Icon(
        //   FontAwesomeIcons.bars,
        // ),
      ],
      hintText: 'بحث',
      padding: MaterialStatePropertyAll(EdgeInsets.all(5.0)),
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
            indicatorWeight: 4.0,
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
