import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/user/consulation/doctors_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/pharmacy/widget/doctor_bottomsheet_consultation.dart';
import '../../../controller/user/repository/pharmacies_data.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  // @override
  // bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    final doctorsController = Get.put(DoctorsControllerImp());

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
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
    return GFListTile(
      onTap: () {
        doctorsControllerImp
            .goToConsultationScreen(doctorsControllerImp.doctors.value[index]);
      },
      margin: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwContainerVert, horizontal: 16),
      avatar: GFAvatar(
        backgroundColor: TColors.primary,
        size: GFSize.SMALL,
        shape: GFAvatarShape.circle,
        child: CircleAvatar(
          backgroundImage: AssetImage(
            doctorsControllerImp.doctors[index].imageUrl,
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
    );
  }
}
