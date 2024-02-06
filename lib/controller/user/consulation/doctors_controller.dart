import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/doctor.dart';

abstract class DoctorsController extends GetxController {
  getDoctors();
  getMoreDoctors();
  goToDoctorScreen(Doctor doctor);
}

class DoctorsControllerImp extends DoctorsController {
  GetData getData = GetData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
  final doctors = <Doctor>[].obs;
  late DoctorPagination doctorPagination;
  int page = 0;
  ScrollController scrollController = ScrollController();
  var specialty;
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
    try {
      statusRequest.value = StatusRequest.loading;
      final response = await getData.getData("doctors?page=$page", {
        'specialty_id': specialty.id,
      });
      if (kDebugMode) {
        print(response);
        print('response. ============== pagination');
      }
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          doctorPagination = DoctorPagination.fromMap(
              response['data'] as Map<String, dynamic>);
          doctors.addAll(doctorPagination.doctors);
        } else {
          statusRequest.value == StatusRequest.failure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ  ");
      }
      e.printError();
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
        anotherStatusRequest.value == StatusRequest.failure;
        showDialogg('title', response['message']);
      }
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
      showDialogg('title', response['message']);
    } else {
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
}
