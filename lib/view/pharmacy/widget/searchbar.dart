import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/pharmacies/pharmacy_controller.dart';

import '../../../core/utils/constant/export_constant.dart';

class GFSearchBarr extends StatefulWidget {
  const GFSearchBarr({super.key, required this.pharmacyControllerImp});
  final PharmacyControllerImp pharmacyControllerImp;

  @override
  State<GFSearchBarr> createState() => _GFSearchBarrState();
}

class _GFSearchBarrState extends State<GFSearchBarr> {
  @override
  Widget build(BuildContext context) {
    return GFSearchBar(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 2),
      padding: const EdgeInsets.all(0),
      searchBoxInputDecoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'بحث ...',
        suffixIconColor: TColors.grey,
        suffixIcon: Container(
          padding: const EdgeInsets.all(8),
          height: 10,
          width: 10,
          child: const ImageIcon(
            AssetImage(AppImageIcon.customSearch),
            size: TSizes.xs,
          ),
        ),
      ),
      // ignore: invalid_use_of_protected_member
      searchList: widget.pharmacyControllerImp.pharmacies.value
          .map((element) => element.name)
          .toList(),
      overlaySearchListItemBuilder: (item) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: Text(
            item,
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
      searchQueryBuilder: (String query, List<dynamic> list) {
        setState(() {
          
        });
        return list
            .where((element) =>
                element.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      onItemSelected: (item) {
        if (kDebugMode) {
          print('$item');
        }
      },
    );
  }
}
