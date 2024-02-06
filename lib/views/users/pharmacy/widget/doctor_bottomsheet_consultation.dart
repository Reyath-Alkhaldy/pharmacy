import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/consulation/doctor_controller.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';
import '../../Auth/widget/custom_button.dart';

class DoctorBottomSheetConsultation extends GetView<DoctorControllerImp> {
  const DoctorBottomSheetConsultation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(DoctorControllerImp());
    return BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text('أكتب أستشارتك بإختصار .'),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.consultationController,
                      maxLines: 7,
                      decoration: const InputDecoration(
                        hintText: 'أكتب هنا ...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      color: TColors.lightGrey,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageIcon(
                            AssetImage(AppImageIcon.writing),
                          ),
                          Text(
                            'ارفاق صورة (اختياري)',
                            style: TextStyle(
                              color: TColors.darkerGrey,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                        content: 'إرسال',
                        width: 200,
                        onPressed: () async {
                          await controller.postConsultaion();
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
