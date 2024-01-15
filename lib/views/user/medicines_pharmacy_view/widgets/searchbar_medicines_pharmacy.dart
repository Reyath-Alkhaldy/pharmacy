import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/pharmacies/medicines_pharmacy_controller.dart';

import '../../../../core/utils/constant/export_constant.dart';

class GFSearchBarMedicinesPharmacy extends StatelessWidget {
  const GFSearchBarMedicinesPharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    final medicinesControllerImp = Get.put(MedicinesControllerImp());

    return GFSearchBarMedicinesWidget(
      medicinesControllerImp: medicinesControllerImp,
    );
  }
}

class GFSearchBarMedicinesWidget extends StatefulWidget {
  const GFSearchBarMedicinesWidget(
      {super.key, required this.medicinesControllerImp});
  final MedicinesControllerImp medicinesControllerImp;

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
        searchList: widget.medicinesControllerImp.medicines.value
            .map((element) => element.nameEn)
            .toList(),
        overlaySearchListItemBuilder: (item) {
          //  var medicine = widget.medicinesControllerImp.medicines.value.map((e) => e.nameAr.allMatches(item).to).toList();
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
          var li = list
              .where((element) =>
                  element.toLowerCase().contains(query.toLowerCase()))
              .toList();
          setState(() {});
          return li;
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
