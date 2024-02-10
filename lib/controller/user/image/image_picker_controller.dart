import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/image_upload_provider.dart';

abstract class ImagePickerController extends GetxController {
  void selectedOneImage();
  void uploadImage();
}

class ImagePickerControllerImp extends ImagePickerController {
  final ImagePicker _picker = ImagePicker();
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();

  XFile? image;
  String? imagePath;
  RxInt selectedImagesCount = 0.obs;

  @override
  void selectedOneImage() async {
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

  @override
  void uploadImage() {
    //  if (text != null && text.trim().isNotEmpty) {
    //   // userResponse = getStorage.getUserResponse;
    //   final response = await getData.uploadImageWithData("/consultaions", {
    //     'user_id': userResponse!.user.id,
    //     'doctor_id': doctorId,
    //     'type': 'question',
    //     'text':  text ,
    //   });
    if (selectedImagesCount > 0) {
      Get.dialog(const Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
      ImageUploadProvider().uploadImage(imagePath!,'consultaions', {}).then((response) {
        Get.back();
        if (response == 'success') {
          Get.snackbar('success', 'Image uploaded',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: TColors.primary,
              colorText: TColors.white);
          image = null;
          imagePath = null;
          selectedImagesCount.value = 0;
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
