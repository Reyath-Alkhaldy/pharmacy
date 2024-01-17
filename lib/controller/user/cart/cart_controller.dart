import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/logger.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/cart.dart';
import 'package:uuid/uuid.dart';

abstract class CartController extends GetxController {
  getCart();
  add(MedicineCart medicine, int quantity);
  remove();
  edit();
}

class CartControllerImp extends CartController {
  GetStorage getStorage = GetStorage();
  GetData getData = GetData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late RxList<Cart> carts = <Cart>[].obs;
  RxDouble total = 0.0.obs;
  String? deviceId;
  void _setUuid() {
    deviceId = getStorage.read('device_id');
    if (deviceId == null) {
      deviceId = const Uuid().v1();
      getStorage.write('device_id', deviceId);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _setUuid();
    // getCart();
  }

  @override
  getCart() async {
    try {
      statusRequest = StatusRequest.loading;
      final response = await getData.getData('cart', {'device_id': deviceId});
      TLogger.info("carts is :${response['carts']}");
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          CartResponse cartResponse =
              CartResponse.fromMap(response as Map<String, dynamic>);
          if (carts.value != cartResponse.carts) {
            total.value = cartResponse.total;
            carts.value = cartResponse.carts;
            update();
          }
        }
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      TLogger.error("there is wrong in carts :> 1");
      e.printError();
      TLogger.error("there is wrong in carts :> 2");
      e.printInfo();
    }
  }

  @override
  add(MedicineCart medicine, int quantity) async {
    update();
    try {
      statusRequest = StatusRequest.loading;
      final response = await getData.postData('cart', {
        "medicine_id": medicine.id,
        'device_id': deviceId,
        'quantity': quantity
      });
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          CartResponse cartResponse =
              CartResponse.fromMap(response as Map<String, dynamic>);
          if (carts.value != cartResponse.carts) {
            total.value = cartResponse.total;
            carts.value = cartResponse.carts;
            update();
            Get.back();
          }
        }
      }
    } catch (e) {
      statusRequest = StatusRequest.serverfailure;
      TLogger.error("there is wrong in carts :> 1");
      e.printError();
      TLogger.error("there is wrong in carts :> 2");
      e.printInfo();
    }
  }

  @override
  edit() {
    throw UnimplementedError();
  }

  @override
  remove() {
  }
}
