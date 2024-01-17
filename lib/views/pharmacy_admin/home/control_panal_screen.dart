import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/pharmacy/home/control_panal_screen.dart';
import 'package:new_maps/core/class/handlingdataview.dart';

import 'widgets/my_stack_control_panal_background.dart';

class ControlPanalScreen extends StatelessWidget {
  const ControlPanalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controlPanal = Get.put(ControlPanalControllerImp());
    return Scaffold(
        body: Stack(
      children: [
        const MyStackControlPanalBackground(),
        Obx(
          () => HandlingDataView(
            statusRequest: controlPanal.statusRequest.value,
            widget: const Column(
              children: [
                SizedBox(
                  height: 100,
                ),
              
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
