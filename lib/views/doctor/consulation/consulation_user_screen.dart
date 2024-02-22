import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:new_maps/controller/doctor/consulation/consultation_user_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/models/consultation.dart';
import 'package:new_maps/views/users/consulation/widgets/bubble_normal_image_message.dart';
import 'package:new_maps/views/users/consulation/widgets/bubble_special_three_message.dart';
import 'widgets/chat_input.dart';

class ConsulationUserScreen extends StatelessWidget {
  const ConsulationUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultationUserControllerImp());
    return Scaffold(
      appBar: consulationAppBar(context, controller.user!.name),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => HandlingDataView(
                statusRequest: controller.statusRequest.value,
                widget: GroupedListView<Consultation, DateTime>(
                  reverse: true,

                  order: GroupedListOrder.DESC,
                  controller: controller.scrollController,
                  padding: const EdgeInsets.all(8),
                  elements: controller.consultations,
                  groupBy: (consultation) {
                    final date = DateTime.parse(consultation.createdAt);
                    return DateTime(
                      date.year,
                      date.month,
                      date.day,
                    );
                  },
                  itemComparator: (consultation1, consultation2) {
                    if (kDebugMode) {
                      print(consultation1.createdAt);
                    print(consultation1.id);
                    print(consultation1.createdAt
                        .compareTo(consultation2.createdAt));
                    }
                    return consultation1.createdAt
                        .compareTo(consultation2.createdAt);
                  },
                  groupHeaderBuilder: (consultation) => SizedBox(
                    height: 40,
                    child: Center(
                      child: Card(
                          color: TColors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              DateFormat.yMMMEd().format(
                                DateTime.parse(consultation.createdAt),
                              ),
                              style: const TextStyle(
                                  color: TColors.white, fontSize: 10),
                            ),
                          )),
                    ),
                  ),
                  itemBuilder: (BuildContext context, consultation) {
                    if (consultation.imageUrl == null ||
                        consultation.imageUrl!.isEmpty) {
                      return BubbleSpecialThreeMessage(
                          consultation: consultation);
                    } else {
                      return BubbleNormalImageMessage(
                          consultation: consultation);
                    }
                  },
                ),
              ),
            ),
          ),

          //  chat Input
          ChatInputDoctor(
            onPressed: () async {
              // إرسال الرسالة
              await controller.compressImageAndUpload();
              controller.consultationControllerClear();
              controller.imageClear();
            },
          ),
        ],
      ),
    );
  }

  AppBar consulationAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: TColors.primary,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: GFAppBarTitleBar(
          child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold, fontSize: 15, color: TColors.white),
      )),
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
            ),
          ),
        ),
      ],
    );
  }
}
