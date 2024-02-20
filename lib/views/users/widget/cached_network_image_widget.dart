import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
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
      errorWidget: (BuildContext context, String s, Object object) {
        return Center(
          child: Image.asset(
            AppImageAsset.pharmacy,
            fit: BoxFit.contain,
          ),
        );
      },
      // progressIndicatorBuilder: (BuildContext context, s,DownloadProgress dp  ) {
      //   return CircularProgressIndicator(value: dp.progress,);
      // },
    );
  }
}
