import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import 'package:new_maps/generated/l10n.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).confirmation),
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.spaceBtwContainerHoriz, vertical: TSizes.spaceBtwContainerVert),
        child: Column(
          children: [
          Container(
            alignment: Alignment.center,
        width: double.infinity,
            child: DataTable(
              
              columns: const [
                DataColumn(
                  label: Text('المنتج'),
                ),
                DataColumn(
                  label: Text('السعر'),
                ),
                DataColumn(
                  label: Text('الكمية'),
                ),
                DataColumn(
                  label: Text('الأجمالي'),
                ),
              ],
              rows: const [],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
