import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/sizes.dart';
class ImageAddShowers extends StatelessWidget {
  const ImageAddShowers({
    super.key, required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TSizes.imageCarouselHeight,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(20),
        // color: const Color(0xffF0FEFE),
      ),
      padding: const EdgeInsets.symmetric(  vertical: 16),
      child: Image.asset(
        image,
      fit: BoxFit.cover,
      
      ),
    );
  }
}
