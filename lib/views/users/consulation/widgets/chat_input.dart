import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/consulation/consultation_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _controller = TextEditingController();
    final controller = Get.put(ConsultationControllerImp());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Form(
          key: controller.formstate,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
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
                                controller.selectedOneImageFromGallery();
                                setState(() {});
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                // اختيار صورة من camera
                                controller.selectedOneImageFromCamera();
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
                    onPressed: () {
                      // إرسال الرسالة
                      controller.sendConsultation();
                      controller.consultationControllerClear();
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
      ),
    );
  }
}
