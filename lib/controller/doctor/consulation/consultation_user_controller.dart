import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'doctor_consultations_controller.dart';

abstract class ConsultationUserController extends GetxController {
  getConsultations();
  getMoreConsultations();
  sendConsultation();
  marksRead(User user);
  Future<void> selectedOneImageFromGallery();
  Future<void> selectedOneImageFromCamera();
  void consultationControllerClear();
  Future<void> compressImageAndUpload();
  void imageClear();
}

class ConsultationUserControllerImp extends ConsultationUserController {
  GetData getData = GetData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  late ConsultationPagination consultationPagination;
  final consultations = <Consultation>[].obs;
  StatusRequest marksReadRequest = StatusRequest.none;

  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
  final Rx<StatusRequest> statusSendConsultation = StatusRequest.none.obs;
  int page = 0;
  ScrollController scrollController = ScrollController();
  User? user;
  DoctorResponse? doctorResponse;
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String? imagePath;
  RxInt selectedImagesCount = 0.obs;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController consultationController;
  // ! Authorization Bearer
  get authorizationToken =>
      {'Authorization': 'Bearer ${doctorResponse!.token}'};

  @override
  void onInit() {
    super.onInit();
    user = Get.arguments['user'];
    consultationController = TextEditingController();
    getConsultations();
    marksRead(user!);
  }

  @override
  void onReady() {
    super.onReady();
    paginateState();
  }

  void paginateState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (page < consultationPagination.lastPage) {
          page++;
          getMoreConsultations();
        }
      }
    });
  }

  @override
  getConsultations() async {
    statusRequest.value = StatusRequest.loading;
    doctorResponse = getStorage.getDoctorResponse('doctor');
    doctorResponse ?? Get.offNamed(AppRouteDoctor.loginDoctor);
    if (doctorResponse != null) {
      final response = await getData.getData(
          "doctor/consultaions?page=$page",
          {'doctor_id': doctorResponse!.doctor.id, 'user_id': user!.id},
          authorizationToken);
      if (kDebugMode) {
        print(response);
      }
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          consultationPagination =
              ConsultationPagination.fromMap(response['data']);
          if (consultationPagination.consultations != consultations) {
            consultations.value = consultationPagination.consultations;
          }
        } else {
          statusRequest.value = StatusRequest.failure;
          showDialogDoctor('title', response['message']);
        }
      } else if (response['message'] == 'Unauthenticated.') {
        await showDialogDoctor('message', response['message'],
            loginMessage: true);
      } else if (response['errors'].toString().isNotEmpty) {
        statusRequest.value = StatusRequest.success;
        // showDialogDoctor('title', response['message']);
      }
    }
  }

  @override
  getMoreConsultations() async {
    anotherStatusRequest.value = StatusRequest.loading;
    final response = await getData.getData(
        "doctor/consultaions?page=$page",
        {'doctor_id': doctorResponse!.doctor.id, 'user_id': user!.id},
        authorizationToken);
    anotherStatusRequest.value = handlingData(response);
    if (anotherStatusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        consultationPagination =
            ConsultationPagination.fromMap(response['data']);
        consultations.addAll(consultationPagination.consultations);
      } else {
        anotherStatusRequest.value = StatusRequest.failure;
      }
    } else if (response['message'] == 'Unauthenticated.') {
      showDialogDoctor('message', response['message']);
    }
  }

  Map get data => {
        'text': consultationController.text.trim(),
        'type': 'answer',
        'doctor_id': doctorResponse!.doctor.id,
        'user_id': user!.id,
      };

  Future<d.FormData> get formData async {
    // تحويل ملف الصورة إلى MultipartFile
    final imageFile = await d.MultipartFile.fromFile(imagePath!);

    // إرسال طلب POST مع الصورة
    return d.FormData.fromMap({
      'image': imageFile,
      'text': consultationController.text.trim(),
      'type': 'answer',
      'doctor_id': doctorResponse!.doctor.id,
      'user_id': user!.id,
    });
  }

  Future<d.FormData> get onlyFormImage async {
    // تحويل ملف الصورة إلى MultipartFile
    final imageFile = await d.MultipartFile.fromFile(imagePath!);

    // إرسال طلب POST مع الصورة
    return d.FormData.fromMap({
      'image': imageFile,
      'type': 'answer',
      'doctor_id': doctorResponse!.doctor.id,
      'user_id': user!.id,
    });
  }

  @override
  sendConsultation() async {
    doctorResponse = getStorage.getDoctorResponse('doctor');
    doctorResponse ?? Get.toNamed(AppRouteDoctor.loginDoctor);
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
        response = await getData.postData(
            "doctor/consultaions", data, authorizationToken);
      } else if (imagePath != null) {
        // رفع صوره
        response = await getData.uploadImageWithData(
            imagePath, "consultaions", await onlyFormImage, authorizationToken);
      }
      statusSendConsultation.value = handlingData(response);
      if (statusSendConsultation.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          final consultation = Consultation.fromMap(
              response['consultation'] as Map<String, dynamic>);

          consultations.add(consultation);
          statusRequest.value = StatusRequest.loading;
          statusRequest.value = StatusRequest.success;
        } else {
          statusSendConsultation.value = StatusRequest.failure;
          await showDialogDoctor('message', response['message'],
              loginMessage: true);
        }
      }
      if (response['message'] == 'Unauthenticated.') {
        await showDialogDoctor('message', response['message'],
            loginMessage: true);
      } else if (response['errors'].toString().isNotEmpty) {
        statusRequest.value = StatusRequest.success;
        // showDialogDoctor('title', response['message']);
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

  @override
  Future<void> compressImageAndUpload() async {
    if (imagePath != null && await image!.length() > 200000) {
      var decodedImage = await decodeImageFromList(await image!.readAsBytes());
      if (kDebugMode) {
        print("width ${decodedImage.width} height ${decodedImage.height}");
      }
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
    await sendConsultation();
  }

  @override
  marksRead(User user) async {
    if (user.unreadCount! > 0) {
      doctorResponse = doctorResponse ?? getStorage.getDoctorResponse('doctor');
      marksReadRequest = StatusRequest.loading;
      final response = await getData.postData(
          "marksRead", {'user_id': user.id}, authorizationToken);
      marksReadRequest = handlingData(response);
      if (marksReadRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.find<DoctorConsultationsControllerImp>().marksRead(user);
        }
      }
    }
  }
}
