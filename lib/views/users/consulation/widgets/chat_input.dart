import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/consulation/consultation_controller.dart';
import 'package:new_maps/core/class/handlingdataview.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class ChatInput extends StatefulWidget {
    ChatInput({super.key, this.maxLins = 1, required this.onPressed});
  final int? maxLins;
  void Function() onPressed;
  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final controller = Get.put(ConsultationControllerImp());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Obx(() => HandlingDataRequest(
                statusRequest: controller.statusSendConsultation.value,
                widget: Form(
                  key: controller.formstate,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              maxLines: widget.maxLins,
                              controller: controller.consultationController,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: 'اكتب إستشارتك هنا...',
                                border: const OutlineInputBorder(),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.image),
                                      onPressed: () async {
                                        // اختيار صورة من المعرض
                                        await controller
                                            .selectedOneImageFromGallery();
                                        setState(() {});
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.camera_alt),
                                      onPressed: () async {
                                        // اختيار صورة من camera
                                        await controller
                                            .selectedOneImageFromCamera();
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: TColors.primary,
                            ),
                            onPressed: () async {
                              setState(() {
                                widget.onPressed();
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (controller.image != null)
                        Image.file(
                          File(
                            controller.image!.path,
                          ),
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
