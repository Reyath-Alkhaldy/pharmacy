import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageDetails extends StatelessWidget {
  const CachedNetworkImageDetails({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      // fit: BoxFit.contain,
      height: 250,
      width: double.maxFinite,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration:
              BoxDecoration(image: DecorationImage(image: imageProvider)),
        );
      },
      placeholder: (context, url) {
        return Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}
