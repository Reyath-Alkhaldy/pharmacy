import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:new_maps/controller/user/consulation/consultation_controller.dart';
import 'package:new_maps/controller/user/image/image_picker_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/models/consultation.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'widgets/chat_field_input.dart';

class ConsulationScreen extends StatelessWidget {
  const ConsulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultationControllerImp());
    final controllerImagePicker = Get.put(ImagePickerControllerImp());
    return Scaffold(
      appBar: consulationAppBar(context, 'The name'),
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
                  elements: controller.consultations.value,
                  groupBy: (consultation) {
                    final date = DateTime.parse(consultation.createdAt);
                    return DateTime(date.year, date.month, date.day, date.hour,
                        date.minute);
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
                    bool type = consultation.type == 'question';
                    return BubbleSpecialThree(
                      text: consultation.text,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: type ? TColors.black : TColors.white),
                      isSender: type ? true : false,
                      tail: true,
                      color: type ? TColors.white : TColors.primary,
                    );
                  },
                ),
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: GridView.builder(
                  itemCount: controllerImagePicker.selectedImagesCount.value,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.file(
                      File(controllerImagePicker.imagesPaths[index]),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  }),
            ),
          ),
          ChatFieldInput(
            controller: controller,
            controllerImagePicker: controllerImagePicker,
          )
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
