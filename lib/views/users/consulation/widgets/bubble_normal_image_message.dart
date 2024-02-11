import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/models/consultation.dart';

class BubbleNormalImageMessage extends StatelessWidget {
  const BubbleNormalImageMessage({
    super.key,
    required this.consultation,
  });

  final Consultation consultation;

  @override
  Widget build(BuildContext context) {
    bool type = consultation.type == 'question';

    return Directionality(
      textDirection: TextDirection.ltr,
      child: BubbleNormalImage(
        id: consultation.id.toString(),
        image: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // CachedNetworkImageWidget(imageUrl: consultation.imageUrl!),
            SizedBox(
                width: 100,
                child: Image.network(consultation.imageUrl!,
                    height: 150, fit: BoxFit.contain)),
            if (consultation.text!.isNotEmpty && consultation.text != null)
              BubbleSpecialThree(
                text: consultation.text!,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: type ? TColors.black : TColors.white),
                isSender: type ? true : false,
                color: type ? TColors.white : TColors.primary,
              ),
          ],
        ),
        // color: Colors.purpleAccent,
        tail: true,
        // delivered: true,
      ),
    );
  }
}
