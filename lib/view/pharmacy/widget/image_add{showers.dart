import 'package:flutter/material.dart';
class ImageAddShowers extends StatelessWidget {
  const ImageAddShowers({
    super.key, required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: const Color(0xffF0FEFE),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: Image.asset(
        image,
      ),
    );
  }
}
