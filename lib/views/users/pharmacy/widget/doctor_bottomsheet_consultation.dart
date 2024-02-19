import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/consulation/doctor/doctor_bottomsheet_consultation_controller.dart';
import 'package:new_maps/views/users/consulation/widgets/chat_input_for_doctor_screen.dart';

// class DoctorBottomSheetConsultation extends GetView<DoctorControllerImp> {
class DoctorBottomSheetConsultation extends StatelessWidget {
  const DoctorBottomSheetConsultation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        final doctorBottomController =
            Get.put(DoctorBottomSheetConsultationControllerImp());

        return SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text('أكتب أستشارتك بإختصار .'),
                  const SizedBox(height: 10),
                  ChatInputForDoctorScreen(
                    maxLins: 7,
                    onPressed: () async {
                      // إرسال الرسالة
                      // Get.back();
                      await doctorBottomController.sendConsultation();
                      doctorBottomController.consultationControllerClear();
                      doctorBottomController.imageClear();
                    },
                  ),

                  // TextField(
                  //   controller: controller.consultationController,
                  //   maxLines: 7,
                  //   decoration: const InputDecoration(
                  //     hintText: 'أكتب هنا ...',
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  // Container(
                  //   height: 50,
                  //   color: TColors.lightGrey,
                  //   child: const Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       ImageIcon(
                  //         AssetImage(AppImageIcon.writing),
                  //       ),
                  //       Text(
                  //         'ارفاق صورة (اختياري)',
                  //         style: TextStyle(
                  //           color: TColors.darkerGrey,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  // CustomButton(
                  //     content: 'إرسال',
                  //     width: 200,
                  //     onPressed: () async {
                  //       await controller.sendConsultation();
                  //     }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
