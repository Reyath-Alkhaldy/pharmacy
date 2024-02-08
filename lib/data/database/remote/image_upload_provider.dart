// import 'package:get/get.dart';

import 'dart:io';

import 'package:get/get_connect/connect.dart';
import 'package:new_maps/core/utils/constant/string.dart';

class ImageUploadProvider extends GetConnect {
  Future<String> uploadImage(List<String> imagesPath) async {
    try {
      final form = FormData({});
      for (var path in imagesPath) {
        form.files.add(MapEntry(
            'file[]',
            MultipartFile(File(path),
                filename:
                    "${DateTime.now().millisecondsSinceEpoch}.${path.split('.').last}")));
      }
      final response = await post("${url}uploadImage", form);
      if (response.status.hasError) {
        return Future.error(response.body);
      } else {
        return response.body['status'];
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
