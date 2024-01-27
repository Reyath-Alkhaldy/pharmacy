import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/auth/login_controller.dart';

class SimpleDropdown extends StatelessWidget {
  SimpleDropdown({super.key});
  final List _list = ['عميل', 'دكتور', 'صيدلية', 'مدير'];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginControllerImp>();
    return CustomDropdown<String>(
      hintText: 'نوع المستخدم',
      items: _list.map((e) => e.toString()).toList(),
      initialItem: _list[0],
      onChanged: (value) {
        controller.setUserType = value;
      },
    );
  }
}
