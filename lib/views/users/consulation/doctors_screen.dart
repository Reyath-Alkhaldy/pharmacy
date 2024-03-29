import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/user/consulation/doctor/doctors_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/search/doctors_search.dart';
import 'package:new_maps/views/users/pharmacy/widget/doctor_bottomsheet_consultation.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';
import 'package:new_maps/views/users/widget/search_delegate_widget.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final doctorsController = Get.put(DoctorsControllerImp());
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchDelegateWidget(onTap: () async {
                await showSearch(
                    context: context,
                    delegate: DoctorsSearch(Get.put(DoctorsControllerImp())));
              }),
              Obx(
                () => HandlingDataView(
                  statusRequest: doctorsController.statusRequest.value,
                  widget: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    itemCount: doctorsController.doctors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ConsultationListTileWidget(
                        index: index,
                        doctorsControllerImp: doctorsController,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class ConsultationListTileWidget extends StatelessWidget {
  const ConsultationListTileWidget({
    super.key,
    required this.index,
    required this.doctorsControllerImp,
  });
  final int index;
  final DoctorsControllerImp doctorsControllerImp;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        doctorsControllerImp
            .goToDoctorScreen(doctorsControllerImp.doctors[index]);
      },
      child: GFListTile(
        margin: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 16),
        avatar: GFAvatar(
          backgroundColor: TColors.primary,
          size: GFSize.SMALL,
          shape: GFAvatarShape.circle,
          child: CircleAvatar(
            child: CachedNetworkImageWidget(
              imageUrl: doctorsControllerImp.doctors[index].imageUrl,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwContainerVert, horizontal: 8),
        color: TColors.white,
        title: Text(
          doctorsControllerImp.doctors[index].name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subTitle: Column(
          children: [
            Text(
              " ${doctorsControllerImp.doctors[index].specialtyId}",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: TColors.grey),
            ),
            Text(
              " ${doctorsControllerImp.doctors[index].email}",
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
