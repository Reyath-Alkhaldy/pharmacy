import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/consulation/doctor_controller.dart';
import 'package:new_maps/views/users/consulation/widgets/chat_input.dart';

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
        return const SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text('أكتب أستشارتك بإختصار .'),
                  SizedBox(height: 10),
                  ChatInput(maxLins: 7,),

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
