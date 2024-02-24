import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/order.dart';
import 'package:new_maps/data/models/user.dart';

abstract class OrderController extends GetxController {
  getOrder();
}

class OrderControllerImp extends OrderController {
  GetData getData = GetData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  Order? order;
  late int indexOrder;
  UserResponse? userResponse;
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();
  // ! Authorization Bearer
  get authorizationToken => {'Authorization': 'Bearer ${userResponse!.token}'};

  @override
  void onInit() {
    super.onInit();
    indexOrder = Get.arguments['indexOrder'];
    getOrder();
  }

  @override
  getOrder() async {
    statusRequest.value = StatusRequest.loading;
    userResponse = getStorage.getUserResponse('user');
    userResponse ?? goToLoginCreen();
    if (userResponse != null) {
      final response = await getData.getData("/checkout/$indexOrder", {},
          userResponse != null ? authorizationToken : {});
      if (kDebugMode) {
        // print(response);
        TLogger.warining("$response");
      }
      final status = handlingData(response);
      if (status == StatusRequest.success) {
        if (response['status'] == 'success') {
          order = Order.fromMap(response['order'] as Map<String, dynamic>);
          statusRequest.value = StatusRequest.success;
        } else {
          statusRequest.value = StatusRequest.success;
        }
      } else if (response['message'] == 'Unauthenticated.') {
        showDialogg('message', response['message'], loginMessage: true);
      }
    }
  }
}
