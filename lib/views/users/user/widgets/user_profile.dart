import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();

    return GFListTile(
      title: Text(getStorage.getUserResponse('user')!.user.name),
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
      avatar: GFAvatar(
        shape: GFAvatarShape.square,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: CachedNetworkImageWidget(
            imageUrl: getStorage.getUserResponse('user')!.user.imageUrl),
        // backgroundImage: AssetImage(AppImageAsset.myImageProfile),
      ),
    );
  }
}
