import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/core/utils/helpers.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import '../../../data/models/specialty.dart';

abstract class SpecialtyController extends GetxController {
  getSpecialties();
  goToDoctorsScreen(Specialty specialty);
  getMoreSpecialties();
}

class SpecialtyControllerImp extends SpecialtyController {
  GetData getData = GetData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final specialties = <Specialty>[].obs;
  late SpecialtyPagination specialtyPagination;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
// final NetWorkController netWorkController = Get.find<NetWorkController>();
  int page = 0;
  // scrolle
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    getSpecialties();
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
        if (page < specialtyPagination.lastPage) {
          page++;
          getMoreSpecialties();
        }
      }
    });
  }

  @override
  getSpecialties() async {
    statusRequest.value = StatusRequest.loading;
    final response = await getData.getData("spicialties?page=$page", {});
    if (kDebugMode) {
      print(response);
      print('response.data');
    }
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        specialtyPagination = SpecialtyPagination.fromMap(response['data']);
        specialties.value = specialtyPagination.specialties;
      } else {
        statusRequest.value == StatusRequest.failure;
      }
    } else if (response['message'] == 'Unauthenticated.') {
      showDialogg('message', response['message']);
      goToLoginCreen;
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
  getMoreSpecialties() async {
    anotherStatusRequest.value = StatusRequest.loading;
    final response = await getData.getData("spicialties?page=$page", {});
    anotherStatusRequest.value = handlingData(response);
    if (anotherStatusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        specialtyPagination = SpecialtyPagination.fromMap(response['data']);
        specialties.addAll(specialtyPagination.specialties);
      } else {
        anotherStatusRequest.value == StatusRequest.failure;
      }
    } else if (response['message'] == 'Unauthenticated.') {
      showDialogg('message', response['message']);
      goToLoginCreen;
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
      showDialogg('title', response['message']);
    }
  }
}
