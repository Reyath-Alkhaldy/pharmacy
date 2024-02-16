import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/doctor.dart';
import 'package:new_maps/data/models/doctors_consultation.dart';
import 'package:new_maps/data/models/user.dart';
import '../../../data/models/specialty.dart';

abstract class UserConsultationController extends GetxController {
  getConsultations();
  goToDoctorsScreen(Specialty specialty);
  goToConsultationScreen(Doctor doctor);
  getMoreConsultations();
}

class UserConsultationControllerImp extends UserConsultationController {
  GetData getData = GetData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final doctorsConsultations = <DoctorsConsultation>[].obs;
  late DoctorsConsultationPagination doctorsConsultationPagination;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
// final NetWorkController netWorkController = Get.find<NetWorkController>();
  int page = 0;
  ScrollController scrollController = ScrollController();
  UserResponse? userResponse;
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();

  //! Authorization
  get authorizationToken => {'Authorization': 'Bearer ${userResponse!.token}'};

  @override
  void onInit() {
    super.onInit();
    getConsultations();
    if (kDebugMode) {
      print('response. init');
    }
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
        if (page < doctorsConsultationPagination.lastPage!) {
          page++;
          getMoreConsultations();
        }
      }
    });
  }

  @override
  getConsultations() async {
    statusRequest.value = StatusRequest.loading;
    userResponse = getStorage.getUserResponse('user');
    userResponse ?? goToLoginCreen();

    final response = await getData.getData("consultations/doctors?page=$page",
        {'user_id': userResponse!.user.id}, authorizationToken);
    if (kDebugMode) {
      print(response);
    }
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        doctorsConsultationPagination =
            DoctorsConsultationPagination.fromMap(response['consultations']);
        doctorsConsultations.value =
            doctorsConsultationPagination.doctorsConsultations;
      } else {
        statusRequest.value == StatusRequest.offlinefailure;
       await showDialogg('message', response['message'], loginMessage: true);

      }
    }  
     if (response['message'] == 'Unauthenticated.') {
     await showDialogg('message', response['message'], loginMessage: true);
      // getStorage.removeData('user');
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
      showDialogg('title', response['message']);
    }
  }

  @override
  goToDoctorsScreen(Specialty specialty) {
    Get.toNamed(AppRoute.doctors, arguments: {'specialty': specialty});
  }

  @override
  getMoreConsultations() async {
    anotherStatusRequest.value = StatusRequest.loading;
    final response = await getData.getData(
        "consultations/doctors?page=$page", {'user_id': userResponse!.user.id});
    anotherStatusRequest.value = handlingData(response);
    if (anotherStatusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        doctorsConsultationPagination =
            DoctorsConsultationPagination.fromMap(response['consultations']);
        doctorsConsultations
            .addAll(doctorsConsultationPagination.doctorsConsultations);
      } else {
        statusRequest.value == StatusRequest.failure;
        showDialogg('title', response['message']);
      }
    }
    if (response['message'] == 'Unauthenticated.') {
     await showDialogg('message', response['message'], loginMessage: true);
      goToLoginCreen;
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
      showDialogg('title', response['message']);
    }
  }

  @override
  goToConsultationScreen(Doctor doctor) {
    Get.toNamed(AppRoute.consulationScreen, arguments: {"doctor": doctor});
  }
}
