import 'package:flutter/material.dart';
import '../../../../core/utils/constant/export_constant.dart';

class ExpansionTitleUserOrder extends StatelessWidget {
  const ExpansionTitleUserOrder({
    super.key,
    required this.title,
    this.color = TColors.primary,
    this.onExpansionChanged,
  });
  final String title;
  final Color color;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        collapsedBackgroundColor: TColors.white,
        title: Text(title),
        trailing: const Icon(Icons.keyboard_arrow_left_outlined),
        subtitle: const Text(
          "أنقر هنا لعرض الفاتورة",
          style: TextStyle(color: TColors.darkerGrey),
        ),
        onExpansionChanged: onExpansionChanged,
      ),
    );
  }
}
