import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/app_image_icon.dart';
import 'package:new_maps/core/utils/constant/colors.dart';

import '../../Auth/widget/custom_button.dart';

class DoctorBottomSheetConsultation extends StatelessWidget {
  const DoctorBottomSheetConsultation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text('أكتب أستشارتك بإختصار .'),
                    const SizedBox(height: 10),
                    const TextField(
                      maxLines: 7,
                      decoration: InputDecoration(
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
                        content: 'إرسال', width: 200, onPressed: () {}),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
