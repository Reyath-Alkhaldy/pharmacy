import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:new_maps/data/models/consultation.dart';

class BubbleNormalImageMessage extends StatelessWidget {
  const BubbleNormalImageMessage({
    super.key,
    required this.consultation,
  });

  final Consultation consultation;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BubbleNormalImage(
        id: consultation.id.toString(),
        image: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // CachedNetworkImageWidget(imageUrl: consultation.imageUrl!),
            SizedBox(
              height: 200,
                  width: 150,
              child: Image.network(consultation.imageUrl!,
                  height: 150, fit: BoxFit.contain)
            ),
            if (consultation.text != null) Text(consultation.text!),
          ],
        ),
        // color: Colors.purpleAccent,
        tail: true,
        // delivered: true,
      ),
    );
  }
}
