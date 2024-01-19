
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      title: const Text('رياض الخالدي'),
      subTitle: Wrap(
        spacing: 10,
        direction: Axis.horizontal,
        children: [
          Text(
            'تعديل',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Icon(
            Iconsax.user_edit,
            size: TSizes.iconSm,
          ),
        ],
      ),
      avatar: const GFAvatar(
        // child: Image.asset( AppImageAsset.myImageProfile),
        backgroundImage: AssetImage(AppImageAsset.myImageProfile),
      ),
    );
  }
}