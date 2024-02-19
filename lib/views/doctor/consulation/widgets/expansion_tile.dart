// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:new_maps/controller/doctor/consulation/doctor_consultations_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';

class ExpansionTileDoctorWidget extends StatelessWidget {
  const ExpansionTileDoctorWidget({
    super.key,
    required this.index,
    required this.controller,
  });
  final int index;
  final DoctorConsultationsControllerImp controller;
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
              onExpansionChanged: (bool b) {
                controller.goToConsultationScreen(
                    controller.usersConsultations[index].doctor);
              },
              title: Text(controller.usersConsultations[index].doctor.name),
              subtitle: Text(controller.usersConsultations[index].doctor.email!),
              leading: GFAvatar(
                backgroundColor: TColors.primary,
                size: GFSize.MEDIUM,
                shape: GFAvatarShape.circle,
                child: CircleAvatar(
                  child: CachedNetworkImageWidget(
                      imageUrl:
                          controller.usersConsultations[index].doctor.imageUrl),
                ),
              ),
              children: [
                const Divider(),
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
                      backgroundImage: AssetImage(AppImageAsset.pharmacy),
                    ),
                  ),
                  description: Text(controller.usersConsultations[index].text,
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
                      backgroundImage: AssetImage(
                        AppImageAsset.myImageProfile,
                      ),
                    ),
                  ),
                  description: Text(controller.usersConsultations[index].text,
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
