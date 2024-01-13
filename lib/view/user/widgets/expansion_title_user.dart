import 'package:flutter/material.dart';

import '../../../core/utils/constant/export_constant.dart';
import 'icon_widget.dart';

class ExpansionTitleUser extends StatelessWidget {
  const ExpansionTitleUser({
    super.key,
    required this.title,
    required this.icon,
    this.color = TColors.primary,
    this.onExpansionChanged,
  });
  final String title;
  final IconData icon;
  final Color color;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        collapsedBackgroundColor: TColors.white,
        title: Text(title),
        trailing: Icon(icon),
        leading: const IconWidget(
          icon: Icons.history_outlined,
          color: TColors.primary,
        ),
        onExpansionChanged: onExpansionChanged,
      ),
    );
  }
}
