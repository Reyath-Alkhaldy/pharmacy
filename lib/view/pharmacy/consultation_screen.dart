import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/repository/doctors_data.dart';
import 'package:new_maps/controller/repository/pharmacies_data.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
import '../../core/utils/constant/routes.dart';
import 'widget/doctor_bottomsheet_consultation.dart';
import 'widget/list_view_pharmacies.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GFBottomSheetController controller = GFBottomSheetController();

    return Column(
      children: [
        GFSearchBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          searchBoxInputDecoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'بحث ...',
            suffixIconColor: TColors.grey,
            suffixIcon: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: const ImageIcon(
                AssetImage(AppImageIcon.customSearch),
                size: TSizes.iconMd,
              ),
            ),
          ),
          searchList: const [],
          overlaySearchListItemBuilder: (item) {
            return const PharmacyTileWidget(index: 1);
          },
          searchQueryBuilder: (String query, List<dynamic> list) {
            return phparmaciesData;
          },
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            itemCount: doctorsData.length,
            itemBuilder: (BuildContext context, int index) {
              return GFListTile(
                avatar: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.doctor);
                  },
                  child: GFAvatar(
                      size: GFSize.LARGE,
                      shape: GFAvatarShape.circle,
                      backgroundImage: AssetImage(doctorsData[index].image)),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                color: TColors.white,
                title: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoute.doctor);
                    },
                    child: Text(
                      doctorsData[index].name,
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                subTitle: Column(
                  children: [
                    Text(
                      " ${doctorsData[index].specialty}",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: TColors.grey),
                    ),
                    Text(
                      " ${doctorsData[index].hospital}",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: TColors.grey),
                    ),
                  ],
                ),
                icon: InkWell(
                  onTap: () {
                    Get.bottomSheet(const DoctorBottomSheetConsultation());
                  },
                  child: const ImageIcon(
                    AssetImage(AppImageIcon.comment),
                    color: TColors.primary,
                  ),
                ),
              );
            }),
      ],
    );
  }
}

