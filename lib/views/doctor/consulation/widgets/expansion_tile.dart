// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:new_maps/controller/doctor/consulation/doctor_consultations_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';
import 'package:badges/badges.dart' as badges;

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
    return Card(
      color: TColors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.alarm),
                const Gap(5),
                Text(
                  DateFormat("E dd/MM/yyyy  hh:mm", 'en').format(DateTime.parse(
                      controller.users[index].consultation!.createdAt)),
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: TColors.darkerGrey),
                )
              ],
            ),
            badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                padding: EdgeInsets.all(7.0),
              ),
              showBadge: controller.users[index].unreadCount! > 0,
              position: badges.BadgePosition.custom(top: 20, end: 50),
              badgeContent: Text(
                controller.users[index].unreadCount.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: TColors.white),
              ),
              child: ExpansionTile(
                onExpansionChanged: (bool b) {
                  controller.goToConsultationScreen(controller.users[index]);
                },
                title: Text(controller.users[index].name),
                trailing: const Icon(Icons.keyboard_arrow_left_outlined),
                subtitle:
                    Text(controller.users[index].consultation!.text ?? 'image'),
                leading: GFAvatar(
                  backgroundColor: TColors.primary,
                  size: GFSize.MEDIUM,
                  shape: GFAvatarShape.circle,
                  child: CircleAvatar(
                    child: CachedNetworkImageWidget(
                        imageUrl: controller.users[index].imageUrl),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
