import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:new_maps/controller/user/consulation/consulation_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/views/users/Auth/widget/custom_button.dart';
import 'package:new_maps/views/users/medicines_pharmacy_view/medicine_details_screen.dart';
import '../pharmacy/widget/doctor_bottomsheet_consultation.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final consultationController = Get.put(ConsulatiolnControllerImp());
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(60, 199, 180, 1),
          actions: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const ImageIcon(
                      AssetImage(AppImageIcon.arrow),
                      color: TColors.white,
                    )))
          ]),
      body: Stack(
        children: [
          const MyStackCategoryBackground(),
          Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.spaceBtwContainerHoriz),
              child:
                  GetBuilder<ConsulatiolnControllerImp>(builder: (controller) {
                return HandlingDataView(
                  statusRequest: consultationController.statusRequest,
                  widget: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: TColors.white,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              // minRadius: 100,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                                imageUrl:
                                    consultationController.doctor.imageUrl,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.edit,
                                    color: TColors.white,
                                    size: TSizes.iconMd,
                                    fill: 1.0,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const MaxGap(5),
                      Text(
                        consultationController.doctor.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const MaxGap(5),
                      const Text(
                        "متخصص في جراحة المخ والاعصاب",
                        style: TextStyle(color: TColors.textColor),
                      ),
                      CustomButton(
                        content: 'عمل إستشارة',
                        width: 200,
                        onPressed: () {
                          Get.bottomSheet(
                              const DoctorBottomSheetConsultation());
                        },
                      ),
                      const MaxGap(20),
                      const GFListTile(
                        avatar: Icon(
                          FontAwesomeIcons.solidCircleUser,
                          color: TColors.primary,
                          size: TSizes.iconLg,
                        ),
                        titleText: 'السيرة الذاتية :',
                        subTitleText: 'ماجستير من جامعة بغداد',
                      ),
                      //
                      GFListTile(
                        avatar: const GFAvatar(
                          backgroundColor: TColors.primary,
                          size: 20,
                          child: Icon(
                            Icons.phone,
                            color: TColors.white,
                            size: TSizes.iconMd,
                          ),
                        ),
                        titleText: "لتواصل والإستفسار :",
                        subTitleText: "770234262",
                        description: Text(
                          consultationController.doctor.email,
                          style: const TextStyle(color: TColors.darkerGrey),
                        ),
                      ),
                    ],
                  ),
                );
              })),
        ],
      ),
    );
  }
}
