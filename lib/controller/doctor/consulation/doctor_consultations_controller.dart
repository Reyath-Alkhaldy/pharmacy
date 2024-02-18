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
import 'package:new_maps/data/models/user.dart';
import 'package:new_maps/data/models/users_consultation.dart';

abstract class DoctorConsultationsController extends GetxController {
  getConsultations();
  goToConsultationScreen(User user);
  getMoreConsultations();
}

class DoctorConsultationsControllerImp extends DoctorConsultationsController {
  GetData getData = GetData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final usersConsultations = <UsersConsultation>[].obs;
  late UsersConsultationPagination doctorsConsultationPagination;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
// final NetWorkController netWorkController = Get.find<NetWorkController>();
  int page = 0;
  ScrollController scrollController = ScrollController();
  DoctorResponse? userResponse;
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
    userResponse = getStorage.getDoctorResponse('doctor');
    userResponse ?? goToLoginCreen();

    final response = await getData.getData(
        "doctor/consultations/users?page=$page",
        {'doctor_id': userResponse!.doctor.id},
        authorizationToken);
    if (kDebugMode) {
      print(response);
    }
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        doctorsConsultationPagination =
            UsersConsultationPagination.fromMap(response['consultations']);
        usersConsultations.value =
            doctorsConsultationPagination.doctorsConsultations;
      } else {
        statusRequest.value == StatusRequest.offlinefailure;
        await showDialogDoctor('message', response['message'], loginMessage: true);
      }
    }
    if (response['message'] == 'Unauthenticated.') {
      await showDialogDoctor('message', response['message'], loginMessage: true);
      // getStorage.removeData('user');
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
      // showDialogDoctor('title', response['errors']);
    }
  }

  @override
  getMoreConsultations() async {
    anotherStatusRequest.value = StatusRequest.loading;
    final response = await getData.getData(
        "doctor/consultations/users?page=$page",
        {'doctor_id': userResponse!.doctor.id});
    anotherStatusRequest.value = handlingData(response);
    if (anotherStatusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        doctorsConsultationPagination =
            UsersConsultationPagination.fromMap(response['consultations']);
        usersConsultations
            .addAll(doctorsConsultationPagination.doctorsConsultations);
      } else {
        statusRequest.value == StatusRequest.failure;
        showDialogDoctor('title', response['message']);
      }
    }
    if (response['message'] == 'Unauthenticated.') {
      await showDialogDoctor('message', response['message'], loginMessage: true);
      goToLoginCreen;
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
      showDialogDoctor('title', response['message']);
    }
  }

  @override
  goToConsultationScreen(User user) {
    Get.toNamed(AppRouteDoctor.consulationUserScreen,
        arguments: {"user": user});
  }
}
