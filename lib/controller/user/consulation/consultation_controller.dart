import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/consultation.dart';
import 'package:new_maps/data/models/doctor.dart';
import 'package:new_maps/data/models/user.dart';
import '../../../data/models/specialty.dart';

abstract class ConsultationController extends GetxController {
  getConsultations();
  goToDoctorsScreen(Specialty specialty);
  getMoreConsultations();
}

class ConsultationControllerImp extends ConsultationController {
  GetData getData = GetData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final consultations = <Consultation>[].obs;
  late ConsultationPagination consultationPagination;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
// final NetWorkController netWorkController = Get.find<NetWorkController>();
  int page = 0;
  late int doctorId;
  ScrollController scrollController = ScrollController();
  late Doctor doctor;
  late UserResponse userResponse;
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();
  @override
  void onInit() {
    super.onInit();
    doctorId = Get.arguments['doctor_id'];
    getConsultations();
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
    var userResp = getStorage.instance.read('user');
    userResponse = UserResponse.fromJson(userResp);
    final response = await getData.getData("/consultaions?page=$page",
        {'user_id': userResponse.user.id, 'doctor_id': doctorId});
    if (kDebugMode) {
      print(response);
    }
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        consultationPagination =
            ConsultationPagination.fromMap(response['data']);
        consultations.value = consultationPagination.consultations;
      } else {
        statusRequest.value == StatusRequest.failure;
        showDialogg('title', response['message']);
      }
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
      showDialogg('title', response['message']);
    } else {
      showDialogg('title', response['message']);
    }
  }

  @override
  goToDoctorsScreen(Specialty specialty) {
    Get.toNamed(AppRoute.doctors, arguments: {'specialty': specialty});
  }

  @override
  getMoreConsultations() async {
    try {
      anotherStatusRequest.value = StatusRequest.loading;
      final response = await getData.getData("/consultaions?page=$page",
          {'user_id': userResponse.user.id, 'doctor_id': doctorId});
      anotherStatusRequest.value = handlingData(response);
      if (anotherStatusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          consultationPagination =
              ConsultationPagination.fromMap(response['data']);
          consultations.addAll(consultationPagination.consultations);
        } else {
          anotherStatusRequest.value == StatusRequest.failure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ  ");
      }
      e.printError();
    }
  }
}
