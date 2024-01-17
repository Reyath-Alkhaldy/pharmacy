import 'package:flutter/material.dart';
import '../../../../core/utils/constant/export_constant.dart';

class CurrentBlanceWidget extends StatelessWidget {
  const CurrentBlanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 170,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: TColors.white,
          border: Border.all(color: TColors.grey),
          borderRadius: BorderRadius.circular(20)),
      child: Wrap(
        direction: Axis.vertical,
        // alignment: WrapAlignment.center,

        spacing: 15,
        children: [
          const Text('الرصيد الحالي :'),
          Container(
            height: 120,
            width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: TColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              children: [
                const Text(
                  '165 ألف',
                  style: TextStyle(color: TColors.secondary),
                ),
                Text(
                  'ريال',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: TColors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
