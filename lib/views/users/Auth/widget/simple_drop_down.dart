import 'dart:convert';
import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class SimpleDropdown extends StatelessWidget {
  SimpleDropdown({super.key});
  final List<Map<int, String>> _list = [
    {1: 'عميل'},
    {2: 'دكتور'},
    {3: 'صيدلية'},
    {4: 'مدير'},
  ];
  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>(
      hintText: 'نوع المستخدم',
      items: _list.map((e) => e.toString()).toList(),
      initialItem: _list[1][0],
      onChanged: (value) {
        var map = json.decode(value);
        // var decoded = json.decode(value);
        // var map = { for (var e in decoded) e.keys.first : e.values.first };
        map.forEach((key, value) {
          log('changing value to: $key $value');
        });
      },
    );
  }
}
