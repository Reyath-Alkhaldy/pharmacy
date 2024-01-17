import 'package:flutter/material.dart';

import '../../../../core/utils/constant/export_constant.dart';
import 'icon_widget.dart';

class ExpansionTitleUser extends StatelessWidget {
  const ExpansionTitleUser({
    super.key,
    required this.title,
    required this.icon,
    required this.leading,
    this.color = TColors.primary,
    this.onExpansionChanged,
  });
  final String title;
  final IconData icon;
  final Color color;
  final Widget leading;
  final void Function(bool)? onExpansionChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        collapsedBackgroundColor: TColors.white,
        title: Text(title),
        trailing: Icon(icon),
        leading: leading ,
        onExpansionChanged: onExpansionChanged,
      ),
    );
  }
}
