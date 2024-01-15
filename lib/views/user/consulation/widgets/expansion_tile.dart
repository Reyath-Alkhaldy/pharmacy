// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';

import '../../../../controller/repository/doctors_data.dart';
import '../../../../core/utils/constant/export_constant.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.data,
  });
  final Map data;
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return Card(
      color: TColors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إستشارة طبية',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: TColors.darkerGrey),
            ),
            Row(
              children: [
                const Icon(Icons.alarm),
                const Gap(5),
                Text(
                  "${DateFormat("E dd/MM/yyyy  hh:mm", 'en').format(now)} ",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: TColors.darkerGrey),
                )
              ],
            ),
            // const Divider(),
            ExpansionTile(
            
              title: Text(data['title']),
              subtitle: Text(data['subtitle']),
              leading: const GFAvatar(
                backgroundColor: TColors.primary,
                size: GFSize.MEDIUM,
                shape: GFAvatarShape.circle,
                child: CircleAvatar(
                    backgroundImage: AssetImage(
                  AppImageAsset.myImageProfile,
                )),
              ),
              children: [
                const Divider(),
                GFListTile(
                  title: Text(
                    "الأسم",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  avatar: GFAvatar(
                    backgroundColor: TColors.primary,
                    size: GFSize.SMALL - 10,
                    shape: GFAvatarShape.circle,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                         AppImageAsset.pharmacy
                      ),
                    ),
                  ),
                  description: Text(data['content'],
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: TColors.darkerGrey)),
                ),
                GFListTile(
                  title: Text(
                    "الأسم",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  avatar: const GFAvatar(
                    backgroundColor: TColors.primary,
                    size: GFSize.SMALL - 10,
                    shape: GFAvatarShape.circle,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(  AppImageAsset.myImageProfile,
                      ),
                    ),
                  ),
                  description: Text(data['content'],
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: TColors.darkerGrey)),
                ),
             
              ],
            ),
          ],
        ),
      ),
    );
  }
}
