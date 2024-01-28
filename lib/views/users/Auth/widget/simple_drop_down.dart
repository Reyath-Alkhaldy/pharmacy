import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class SimpleDropdown extends StatelessWidget {
  SimpleDropdown({super.key,required this.controller});
  final List _list = ['عميل', 'دكتور', 'صيدلية', 'مدير'];
  final dynamic controller;
  @override
  Widget build(BuildContext context) {
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
