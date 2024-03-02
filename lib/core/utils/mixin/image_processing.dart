import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart'as p;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

mixin ImageProcessing {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String? imagePath;
  RxInt selectedImagesCount = 0.obs;
  Future<void> selectedOneImageFromGallery() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = image!.path;
      selectedImagesCount.value = 1;
    } else {
      selectedImagesCount.value = 0;
      Get.snackbar('fail', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> selectedOneImageFromCamera() async {
    image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath = image!.path;
      selectedImagesCount.value = 1;
    } else {
      selectedImagesCount.value = 0;
      Get.snackbar('fail', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void imageClear() {
    image = null;
    imagePath = null;
    selectedImagesCount.value = 0;
  }

  Future<void> compressImageAndUpload() async {
    if (imagePath != null && await image!.length() > 200000) {
      var decodedImage = await decodeImageFromList(await image!.readAsBytes());
      print("width ${decodedImage.width} height ${decodedImage.height}");
      final newPath = p.join((await getTemporaryDirectory()).path,
          "${DateTime.now()}.${p.extension(imagePath!)}");
      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        imagePath!,
        newPath,
        quality: 50,
        minHeight: 2400,
        minWidth: 1920,
      );
      if (kDebugMode) {
        print('compressedImage!.length().......');
        print(await compressedImage!.length());
      }
      imagePath = compressedImage!.path;
    }
  }
}
