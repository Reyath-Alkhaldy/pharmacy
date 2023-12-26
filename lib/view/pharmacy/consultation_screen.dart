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

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({super.key});

  @override
  State<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    GFBottomSheetController controller = GFBottomSheetController();

    return SingleChildScrollView(
      child: Column(
        children: [
          GFSearchBar(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 2),
            padding: const EdgeInsets.all(0),
            searchBoxInputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.all(5),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'بحث ...',
              suffixIconColor: TColors.grey,
              suffixIcon: Container(
                padding: const EdgeInsets.all(8),
                height: 10,
                width: 10,
                child: const ImageIcon(
                  AssetImage(AppImageIcon.customSearch),
                  size: TSizes.xs,
                ),
              ),
            ),
            searchList: const [],
            overlaySearchListItemBuilder: (item) {
              return item;
              // return const PharmacyTileWidget( );
            },
            searchQueryBuilder: (String query, List<dynamic> list) {
              return phparmaciesData;
            },
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              itemCount: doctorsData.length,
              itemBuilder: (BuildContext context, int index) {
                return ConsultationListTileWidget(
                  index: index,
                );
              }),
        ],
      ),
    );
  }
}

class ConsultationListTileWidget extends StatelessWidget {
  const ConsultationListTileWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.doctor);
      },
      child: GFListTile(
        margin: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 16),
        avatar: InkWell(
          onTap: () {
            Get.toNamed(AppRoute.doctor);
          },
          child: GFAvatar(
            backgroundColor: TColors.primary,
            size: GFSize.SMALL,
            shape: GFAvatarShape.circle,
            child: CircleAvatar(
                backgroundImage: AssetImage(
              doctorsData[index].image,
            )),
          ),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
        color: TColors.white,
        title: InkWell(
            onTap: () {
              Get.toNamed(AppRoute.doctor);
            },
            child: Text(
              doctorsData[index].name,
              style: Theme.of(context).textTheme.titleSmall,
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
      ),
    );
  }
}
