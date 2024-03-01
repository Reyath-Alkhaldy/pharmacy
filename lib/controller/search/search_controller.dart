import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';

abstract class SearchControllerClass extends GetxController {
  GetData getData = GetData(Get.find());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
  late dynamic data;

 Future<void> search(String url,[Map? mapDataQuery, Map<String, dynamic>? headers,String? keyOfResponse]) async {
    statusRequest.value = StatusRequest.loading;
    final response = await getData.getData(url,mapDataQuery,headers);
    if (kDebugMode) {
      print(response);
      print('response. ============== searchhhhhhhhhhh');
    }
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        data = response[keyOfResponse??'data'];
      } else {
        statusRequest.value = StatusRequest.failure;
        showDialogg('title', response['message']);
      }
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
    }
  }
}
