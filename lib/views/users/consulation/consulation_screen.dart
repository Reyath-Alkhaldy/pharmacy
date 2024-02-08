import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:new_maps/controller/user/consulation/consultation_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/functions/validinput.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/models/consultation.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'dart:ui' as T;

class ConsulationScreen extends StatelessWidget {
  const ConsulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConsultationControllerImp());
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
                      return DateTime(date.year, date.month, date.day,
                          date.hour, date.minute);
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
                    // itemBuilder: (BuildContext context, consultation) {
                    //   return Align(
                    //     alignment: consultation.type == 'question'
                    //         ? Alignment.centerLeft
                    //         : Alignment.centerRight,
                    //     child: Card(
                    //       elevation: 8,
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(12.0),
                    //         child: Text(consultation.text),
                    //       ),
                    //     ),
                    //   );
                    // },
                  )),
            ),
          ),
          // ChatFieldInput(controller: controller),
         
               Directionality(
                textDirection: T.TextDirection.ltr,
                child: MessageBar(
                  
                  // replying: true,
                  onSend: (value) {
                    controller.sendConsultation(value);
                  },
                  actions: [
                    InkWell(
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 24,
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: InkWell(
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.green,
                          size: 24,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
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

class ChatFieldInput extends StatelessWidget {
  const ChatFieldInput({
    super.key,
    required this.controller,
  });

  final ConsultationControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: TColors.lightGrey,
      ),
      child: Form(
        key: controller.formstate,
        child: TextFormField(
          // controller: controller.consultationController,
          onChanged: (string) {},
          validator: (val) {
            return validInput(val!, 2, 100, "string");
          },
          decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                // borderSide: BorderSide.none,
              ),
              suffix: IconButton(
                onPressed: () async {
                  // await controller.sendConsultation();
                },
                icon: const Icon(
                  Icons.send,
                ),
              ),
              contentPadding: const EdgeInsets.all(12),
              hintText: 'Type Your Consultation here'),
        ),
      ),
    );
  }
}
