import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/consulation/widgets/expansion_tile.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ConsulationScreen extends StatelessWidget {
  ConsulationScreen({super.key});
  List<Map<String, dynamic>> list = List.generate(
      30,
      (index) => {
            'id': "$index",
            'title': "عنوان رقم $index ",
            'subtitle': "عنوان فرعي رقم $index ",
            'content': " بيانات الرد بيانات الرد بيانات الرد بيانات الرد بيانات الرد  بيانات الرد $index",
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        backgroundColor: TColors.primary,
        centerTitle: true,
        title: const GFAppBarTitleBar(
          child: Text('الإستشارات'),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration:   const BoxDecoration(
              color: TColors.lightGrey,borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            child: ToggleSwitch(
              minWidth: 320.0,
              cornerRadius: 20.0,
              activeBgColors: const [
                [TColors.white],
                [TColors.white]
              ],
              activeFgColor: TColors.black,
              inactiveBgColor: TColors.lightGrey,
              inactiveFgColor: TColors.black,
              initialLabelIndex: 1,
              totalSwitches: 2,
              labels: const ['قيد الأنتظار', 'تم الرد عليها'],
              
              radiusStyle: true,
              onToggle: (index) {
                print('switched to: $index');
              },
            
            ),
          ),
          const Gap(10),
          Expanded(
            child: Container(
              color: TColors.lightGrey,
              child: ListView.builder(
                  itemCount: list.length,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTileWidget(
                      data: list[index],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ToggleWidget extends StatelessWidget {
  const ToggleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(bottom: 0),
      decoration: BoxDecoration(
          color: TColors.grey.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(16.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: TColors.white,
                boxShadow: [
                  BoxShadow(
                      color: TColors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 2))
                ],
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              ),
              child: const Text('قائمة الإنتظار'),
            ),
          ),
        ],
      ),
    );
  }
}
