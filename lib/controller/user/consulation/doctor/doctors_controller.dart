import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/controller/search/search_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/models/doctor.dart';

abstract class DoctorsController extends SearchControllerClass {
  getDoctors();
  getMoreDoctors();
  goToDoctorScreen(Doctor doctor);
}

class DoctorsControllerImp extends DoctorsController {
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();
  int page = 0;
  ScrollController scrollController = ScrollController();
  var specialty;
  final doctors = <Doctor>[].obs;
  late DoctorPagination doctorPagination;
  final doctorsSearch = <Doctor>[].obs;
  late DoctorPagination doctorPaginationSearch;
  @override
  void onInit() {
    super.onInit();
    specialty = Get.arguments['specialty'];
    getDoctors();
  }

  @override
  void onReady() {
    super.onReady();
    paginateState();
  }

  @override
  getDoctors() async {
    statusRequest.value = StatusRequest.loading;
    final response = await getData.getData("doctors?page=$page", {
      'specialty_id': specialty.id,
    });
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        doctorPagination =
            DoctorPagination.fromMap(response['data'] as Map<String, dynamic>);
        doctors.addAll(doctorPagination.doctors);
      } else {
        statusRequest.value = StatusRequest.failure;
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
  getMoreDoctors() async {
    anotherStatusRequest.value = StatusRequest.loading;
    final response = await getData.getData("doctors?page=$page", {
      'specialty_id': specialty.id,
    });
    anotherStatusRequest.value = handlingData(response);
    if (anotherStatusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        doctorPagination =
            DoctorPagination.fromMap(response['data'] as Map<String, dynamic>);
        doctors.addAll(doctorPagination.doctors);
      } else {
        anotherStatusRequest.value = StatusRequest.failure;
        // showDialogg('title', response['message']);
      }
    } else if (response['message'] == 'Unauthenticated.') {
      showDialogg('message', response['message']);

      goToLoginCreen;
    } else if (statusRequest.value == StatusRequest.serverfailure) {
      statusRequest.value = StatusRequest.success;
      showDialogg('title', response['message']);
    }
  }

  void paginateState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (page < doctorPagination.lastPage) {
          page++;
          getMoreDoctors();
        }
      }
    });
  }

  @override
  goToDoctorScreen(Doctor doctor) {
    Get.toNamed(AppRoute.doctor, arguments: {'doctor': doctor});
  }

  @override
  Future<void> search(String url,
      [Map? mapDataQuery,
      Map<String, dynamic>? headers,
      String? keyOfResponse]) async {
    await super.search(url, mapDataQuery, headers, 'data');
    doctorPaginationSearch = DoctorPagination.fromMap(data);
    doctorsSearch.clear();
    doctorsSearch.addAll(doctorPaginationSearch.doctors);
  }
}
