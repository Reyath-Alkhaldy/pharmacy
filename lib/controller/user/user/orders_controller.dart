import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/order.dart';
import 'package:new_maps/data/models/user.dart';
// import 'package:dio/dio.dart' as d;

abstract class OrdersController extends GetxController {
  void getTabSelected(int tabIndex);
  getOrders();
  getMoreOrders();
  gotoOrder(int indexOrder);
}

class OrdersControllerImp extends OrdersController {
  int tabIndex = 0;
  GetData getData = GetData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final orders = <Order>[].obs;
  late OrderPagination orderPagination;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
  int page = 0;
  ScrollController scrollController = ScrollController();
  UserResponse? userResponse;
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();
  // ! Authorization Bearer
  get authorizationToken => {'Authorization': 'Bearer ${userResponse!.token}'};

  @override
  void onInit() {
    super.onInit();
    getOrders();
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
        if (page < orderPagination.lastPage) {
          page++;
          getMoreOrders();
        }
      }
    });
  }

  @override
  getOrders() async {
    statusRequest.value = StatusRequest.loading;
    userResponse = getStorage.getUserResponse('user');
    userResponse ?? goToLoginCreen();
    if (userResponse != null) {
      final response =
          await getData.getData("/checkout?page=$page", {}, authorizationToken);
      if (kDebugMode) {
        print(response);
      }
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          orderPagination = OrderPagination.fromMap(response['data']);
          orders.value = orderPagination.orders;
        } else {
          statusRequest.value = StatusRequest.success;
        }
      } else if (response['message'] == 'Unauthenticated.') {
        showDialogg('message', response['message']);
        goToLoginCreen;
      } 
    }
  }

  @override
  getMoreOrders() async {
    anotherStatusRequest.value = StatusRequest.loading;
    final response =
        await getData.getData("/checkout?page=$page", {}, authorizationToken);
    anotherStatusRequest.value = handlingData(response);
    if (anotherStatusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        orderPagination = OrderPagination.fromMap(response['data']);
        orders.addAll(orderPagination.orders);
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

  @override
  void getTabSelected(int tabIndex) {
    if (this.tabIndex != tabIndex) {
      this.tabIndex = tabIndex;
      update();
    }
  }

  @override
  gotoOrder(num indexOrder) {
    Get.toNamed(AppRoute.orderScreen, arguments: {'indexOrder': indexOrder});
  }
}
