import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/image_upload_provider.dart';

abstract class ImagesPickerController extends GetxController {
  void selectedMultipleImage();
  void uploadImages();
}

class ImagesPickerControllerImp extends ImagesPickerController {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? images = [];
  List<String> imagesPaths = [];
  RxInt selectedImagesCount = 0.obs;

  @override
  void selectedMultipleImage() async {
    images = await _picker.pickMultiImage();
    if (images != null) {
      for (XFile file in images!) {
        imagesPaths.add(file.path);
      }
    } else {
      Get.snackbar('fail', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM);
    }
    selectedImagesCount.value = imagesPaths.length;
  }

  @override
  void uploadImages() {
    if (selectedImagesCount > 0) {
      Get.dialog(const Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
      ImageUploadProvider().uploadImages(imagesPaths).then((response) {
        Get.back();
        if (response == 'success') {
          Get.snackbar('success', 'Image uploaded',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: TColors.primary,
              colorText: TColors.white);
          images = [];
          imagesPaths = [];
          selectedImagesCount.value = imagesPaths.length;
        }
      }).onError((error, stackTrace) {
        Get.back();
        TLogger.warining(error.toString());
        error.printInfo();
        error.printError();
        Get.snackbar('fail', 'There is something error',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: TColors.secondary,
            colorText: TColors.white);
      });
    } else {
      Get.snackbar('fail', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
