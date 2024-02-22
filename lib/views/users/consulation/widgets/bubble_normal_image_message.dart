import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/models/consultation.dart';
import 'package:new_maps/views/users/widget/cached_network_image_widget.dart';

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
        isSender: type ? true : false,
        image: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                width: 100,
                child: CachedNetworkImageWidget(
                  imageUrl: consultation.imageUrl!,
                  height: 200,
                ),
              ),
            ),
            if (consultation.text!.isNotEmpty && consultation.text != null)
              const Gap(10),
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
