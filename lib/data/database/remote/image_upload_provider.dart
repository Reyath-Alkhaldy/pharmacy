import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/connect.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/string.dart';

class ImageUploadProvider extends GetConnect {
  Future<String> uploadImages(List<String> imagesPath) async {
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

  //
  Future<Either<StatusRequest, Map>> uploadImage(String imagePath, String path,
      [Map? data, Map<String, String>? headers]) async {
    try {
      final form = FormData({});
      form.files.add(MapEntry(
          'image',
          MultipartFile(File(imagePath),
              filename:
                  "${DateTime.now().millisecondsSinceEpoch}.${imagePath.split('.').last}")));
      form.fields.add(MapEntry('text', data?['text']));
      form.fields.add(MapEntry('type', data?['type']));
      form.fields.add(MapEntry('user_id', data?['user_id']));
      form.fields.add(MapEntry('doctor_id', data?['doctor_id']));
      final response = await post("$url$path", form, headers: headers ?? {});
      if (response.status.hasError) {
        return const Left(StatusRequest.serverfailure);
      } else {
        Map data = response.body;
        return Right(data);
      }
    } catch (e) {
      return left(StatusRequest.failure);
    }
  }
}
