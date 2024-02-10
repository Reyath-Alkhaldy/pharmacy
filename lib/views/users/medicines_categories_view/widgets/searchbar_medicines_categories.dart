import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../../../../controller/user/categories/medicines_category_controller.dart';
import '../../../../core/utils/constant/export_constant.dart';

class GFSearchBarMedicinesCategories extends StatelessWidget {
  const GFSearchBarMedicinesCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final medicinesCategoryControllerImp = Get.put(MedicinesCategoryControllerImp());

    return   GFSearchBarMedicinesWidget(
          medicinesCategoryControllerImp: medicinesCategoryControllerImp,
        );
  }
}

class GFSearchBarMedicinesWidget extends StatefulWidget {
  const GFSearchBarMedicinesWidget(
      {super.key, required this.medicinesCategoryControllerImp});
  final MedicinesCategoryControllerImp medicinesCategoryControllerImp;

  @override
  State<GFSearchBarMedicinesWidget> createState() =>
      _GFSearchBarMedicinesWidgetState();
}

class _GFSearchBarMedicinesWidgetState
    extends State<GFSearchBarMedicinesWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      color: TColors.white,
      child: GFSearchBar(
        // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(0),
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
        searchList: widget.medicinesCategoryControllerImp.medicines.value
            .map((element) => element.nameEn)
            .toList(),
        overlaySearchListItemBuilder: (item) {
          //  var medicine = widget.MedicinesCategoryControllerImp.medicines.value.map((e) => e.nameAr.allMatches(item).to).toList();
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
          setState(() {});
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
      ),
    );
  }
}
