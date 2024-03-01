import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class SearchDelegateWidget extends StatelessWidget {
  const SearchDelegateWidget({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'بحث ...',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: TColors.darkerGrey),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
