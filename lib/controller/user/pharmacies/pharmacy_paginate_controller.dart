import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/database/remote/pharmacy_data.dart';
import 'package:new_maps/data/models/pharmacy_pagination.dart';
import '../../../core/utils/constant/export_constant.dart';

abstract class PharmacyPaginateController extends GetxController {
  getPharmacies();
  getMorePharmacies();
  goToChoseeScreen(Pharmacy pharmacy);
}

class PharmacyPaginateControllerImp extends PharmacyPaginateController {
  PharmacyData pharmacyData = PharmacyData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
  final pharmacies = <Pharmacy>[].obs;
  late PharmacyPagination pharmacyPagination;
  // final NetWorkController netWorkController = Get.find<NetWorkController>();
  int page = 0;
  // scrolle
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    getPharmacies();
  }

  @override
  void onReady() {
    super.onReady();
    paginateState();
  }

  @override
  getPharmacies() async {
   
      statusRequest.value = StatusRequest.loading;
      final response =
          await pharmacyData.getPharmacies("pharmacies?page=$page", {});
      if (kDebugMode) {
        print(response);
        print('response. ============== pagination');
      }
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          pharmacyPagination = PharmacyPagination.fromMap(
              response['data'] as Map<String, dynamic>);
          pharmacies.addAll(pharmacyPagination.pharmacies);
        } else {
          statusRequest.value == StatusRequest.failure;
        showDialogg('title', response['message']);

        }
      }
        else if (response['errors'].toString().isNotEmpty) {
        statusRequest.value = StatusRequest.success;
        showDialogg('title', response['message']);

      } else {
        showDialogg('title', response['message']);
      }
      
    
  }

  @override
  getMorePharmacies() async {
      anotherStatusRequest.value = StatusRequest.loading;
      final response =
          await pharmacyData.getPharmacies("pharmacies?page=$page", {});
      anotherStatusRequest.value = handlingData(response);
      if (anotherStatusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          pharmacyPagination = PharmacyPagination.fromMap(
              response['data'] as Map<String, dynamic>);
          pharmacies.addAll(pharmacyPagination.pharmacies);
        } else {
          anotherStatusRequest.value == StatusRequest.failure;
        showDialogg('title', response['message']);

        }
      }
   
  }

  void paginateState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (page < pharmacyPagination.lastPage) {
          page++;
          getMorePharmacies();
        }
      }
    });
  }

  @override
  goToChoseeScreen(Pharmacy pharmacy) {
    Get.toNamed(AppRoute.chose, arguments: {'pharmacy': pharmacy});
  }
}
