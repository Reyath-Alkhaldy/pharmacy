import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_maps/controller/user/consulation/consultation_controller.dart';
import 'package:new_maps/controller/user/image/image_picker_controller.dart';

class ChatFieldInput extends StatelessWidget {
  const ChatFieldInput(
      {super.key,
      required this.controller,
      required this.controllerImagePicker});

  final ConsultationControllerImp controller;
  final ImagePickerControllerImp controllerImagePicker;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MessageBar(
        // replying: true,
        onSend: (value) {
          controllerImagePicker.uploadImage();

          controller.sendConsultation(value);
        },
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: InkWell(
              child: const Icon(
                Icons.camera_alt,
                color: Colors.green,
                size: 24,
              ),
              onTap: () {
                controllerImagePicker.selectedMultipleImage();
              },
            ),
          ),
        ],
      ),
    );
  }
}
