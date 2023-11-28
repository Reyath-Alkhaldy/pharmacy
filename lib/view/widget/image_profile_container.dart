import 'package:flutter/material.dart';

class ImageProfileContainer extends StatelessWidget {
  const ImageProfileContainer({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              image,
            ),
          ),
          boxShadow: [BoxShadow(blurRadius: 0.9)],
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
