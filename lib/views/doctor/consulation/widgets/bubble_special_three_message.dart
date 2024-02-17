import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/models/consultation.dart';

class BubbleSpecialThreeMessage extends StatelessWidget {
  const BubbleSpecialThreeMessage({
    super.key,
    required this.consultation,
  });

  final Consultation consultation;

  @override
  Widget build(BuildContext context) {
    bool type = consultation.type == 'question';

    return BubbleSpecialThree(
      text: consultation.text!,
      textStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: type ? TColors.black : TColors.white),
      isSender: type ? true : false,
      tail: true,
      color: type ? TColors.white : TColors.primary,
    );
  }
}
