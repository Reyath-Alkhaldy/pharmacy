import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/consultation.dart';
import 'package:new_maps/data/models/doctor.dart';
import 'package:new_maps/data/models/user.dart';
import 'package:dio/dio.dart' as d;

import 'doctor_controller.dart';

abstract class DoctorBottomSheetConsultationController extends GetxController {
  sendConsultation();
  Future<void> selectedOneImageFromGallery();
  Future<void> selectedOneImageFromCamera();
  void consultationControllerClear();
  void imageClear();
}

class DoctorBottomSheetConsultationControllerImp
    extends DoctorBottomSheetConsultationController {
  GetData getData = GetData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  // final consultations = <Consultation>[].obs;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
  final Rx<StatusRequest> statusSendConsultation = StatusRequest.none.obs;
  Doctor? doctor;
  final doctorController = Get.find<DoctorControllerImp>();
  UserResponse? userResponse;
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String? imagePath;
  RxInt selectedImagesCount = 0.obs;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController consultationController;
  // ! Authorization Bearer
  get authorizationToken => {'Authorization': 'Bearer ${userResponse!.token}'};
  @override
  void onInit() {
    super.onInit();
    doctor = doctorController.doctor;
    print(" the doctor in DoctorBottomSheetConsultationControllerImp  $doctor");
    consultationController = TextEditingController();
  }

  Map get data => {
        'text': consultationController.text.trim(),
        'type': 'question',
        'user_id': userResponse!.user.id,
        'doctor_id': doctor!.id,
      };

  Future<d.FormData> get formData async {
    // تحويل ملف الصورة إلى MultipartFile
    final imageFile = await d.MultipartFile.fromFile(imagePath!);

    // إرسال طلب POST مع الصورة
    return d.FormData.fromMap({
      'image': imageFile,
      'text': consultationController.text.trim(),
      'type': 'question',
      'user_id': userResponse!.user.id,
      'doctor_id': doctor!.id,
    });
  }

  Future<d.FormData> get onlyFormImage async {
    // تحويل ملف الصورة إلى MultipartFile
    final imageFile = await d.MultipartFile.fromFile(imagePath!);

    // إرسال طلب POST مع الصورة
    return d.FormData.fromMap({
      'image': imageFile,
      'type': 'question',
      'user_id': userResponse!.user.id,
      'doctor_id': doctor!.id,
    });
  }

  @override
  sendConsultation() async {
    userResponse = getStorage.getUserResponse('user');
    userResponse ?? goToLoginCreen();
    if (formstate.currentState!.validate()) {
      statusSendConsultation.value = StatusRequest.loading;
      dynamic response;

      if (imagePath != null && consultationController.text.isNotEmpty) {
        print(' // رفع صوره مع إستشار');
        // رفع صوره مع إستشارة
        response = await getData.uploadImageWithData(
            imagePath, "consultaions", await formData, authorizationToken);
      } else if (consultationController.text.isNotEmpty) {
        // رفع مع إستشارة
        response =
            await getData.postData("consultaions", data, authorizationToken);
      } else if (imagePath != null) {
        // رفع صوره
        response = await getData.uploadImageWithData(
            imagePath, "consultaions", await onlyFormImage, authorizationToken);
      }
      statusSendConsultation.value = handlingData(response);
      if (statusSendConsultation.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          // final consultation = Consultation.fromMap(
          // response['consultation'] as Map<String, dynamic>);

          // consultations.add(consultation);
          statusRequest.value = StatusRequest.loading;
          statusRequest.value = StatusRequest.success;
        } else {
          statusSendConsultation.value = StatusRequest.failure;
          await showDialogg('message', response['message'], loginMessage: true);
        }
      }
      if (response['message'] == 'Unauthenticated.') {
        await showDialogg('message', response['message'], loginMessage: true);
      } else if (response['errors'].toString().isNotEmpty) {
        statusRequest.value = StatusRequest.success;
        // showDialogg('title', response['message']);
      }
    }
  }

  @override
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

  @override
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

  @override
  void consultationControllerClear() {
    if (consultationController.text.isNotEmpty) {
      consultationController.clear();
    }
  }

  @override
  void imageClear() {
    image = null;
    imagePath = null;
    selectedImagesCount.value = 0;
  }
}
