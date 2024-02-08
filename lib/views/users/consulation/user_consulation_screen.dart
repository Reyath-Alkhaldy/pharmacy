import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/user/consulation/user_consultation_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/consulation/widgets/expansion_tile.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UserConsulationScreen extends StatelessWidget {
  const UserConsulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserConsultationControllerImp());
    return Scaffold(
      appBar: userConsulationAppBar(context),
      body: Column(
        children: [
          // Container(
          //   padding: const EdgeInsets.all(3),
          //   decoration: const BoxDecoration(
          //       color: TColors.lightGrey,
          //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //   child: ToggleSwitch(
          //     minWidth: 320.0,
          //     cornerRadius: 20.0,
          //     activeBgColors: const [
          //       [TColors.white],
          //       [TColors.white]
          //     ],
          //     activeFgColor: TColors.black,
          //     inactiveBgColor: TColors.lightGrey,
          //     inactiveFgColor: TColors.black,
          //     initialLabelIndex: 1,
          //     totalSwitches: 2,
          //     labels: const ['قيد الأنتظار', 'تم الرد عليها'],
          //     radiusStyle: true,
          //     onToggle: (index) {
          //       print('switched to: $index');
          //     },
          //   ),
          // ),
          // const Gap(10),
          Expanded(
   
            child: Container(
                color: TColors.lightGrey,
                child: Obx(() => HandlingDataView(
                      statusRequest: controller.statusRequest.value,
                      widget: ListView.builder(
                          controller: controller.scrollController,
                          itemCount: controller.doctorsConsultations.length,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          itemBuilder: (BuildContext context, int index) {
                            return ExpansionTileWidget(
                              index: index,
                              controller: controller,
                            );
                          }),
                    ))),
          ),
        ],
      ),
    );
  }

  AppBar userConsulationAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: TColors.primary,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: GFAppBarTitleBar(
          child: Text(
        'الإستشارات',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold, fontSize: 15, color: TColors.white),
      )),
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
    );
  }
}
