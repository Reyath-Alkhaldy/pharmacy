import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/cart.dart';
import 'package:new_maps/data/models/medicine.dart';
import 'package:new_maps/data/models/pharmacy_pagination.dart';
import 'package:new_maps/data/models/user.dart';
import 'package:uuid/uuid.dart';

abstract class CartController extends GetxController {
  getCart();
  add(Medicine medicine, [int quantity = 1]);
  deleteAll();
  delete(int medicineId);
  edit();
  decrement(Cart cart);
  increment(Cart cart);
  checkout();
  goToCheckoutScreen();
}

class CartControllerImp extends CartController {
  GetData getData = GetData(Get.find());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final carts = <Cart>[].obs;
  RxDouble total = 0.0.obs;
  String? deviceId;
  Pharmacy? pharmacy;
  late CartResponse cartResponse;
  bool canPop = false;
  UserResponse? userResponse;
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();

// ! Authorization Bearer
  get authorizationToken => {'Authorization': 'Bearer ${userResponse!.token}'};

  void _setUuid() {
    deviceId = getStorage.instance.read('device_id');
    if (deviceId == null) {
      deviceId = const Uuid().v1();
      getStorage.instance.write('device_id', deviceId);
    }
  }

// ! Authorization Bearer
  // get authorizationToken => {'Authorization': 'Bearer ${userResponse!.token}'};
  @override
  void onInit() {
    super.onInit();
    pharmacy = Get.arguments['pharmacy'];
    _setUuid();
    pharmacy != null ? getCart() : null;
  }

  @override
  getCart() async {
    statusRequest.value = StatusRequest.loading;
    final response = await getData
        .getData('cart', {'device_id': deviceId, 'pharmacy_id': pharmacy!.id});
    // TLogger.warining("carts is :${response['carts']}");
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        cartResponse = CartResponse.fromMap(response as Map<String, dynamic>);
        // ignore: invalid_use_of_protected_member
        if (carts.value != cartResponse.carts) {
          total.value = cartResponse.total;
          carts.value = cartResponse.carts!;
        }
      } else {
        statusRequest.value = StatusRequest.success;
        showDialogg('title', response['message']);
      }
    } else {
      showDialogg('title', response['message']);
    }
  }

  @override
  add(Medicine medicine, [int quantity = 1]) async {
    update();
    statusRequest.value = StatusRequest.loading;
    final response = await getData.postData('cart', {
      "medicine_id": medicine.id,
      'device_id': deviceId,
      'quantity': quantity
    });
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        CartResponse cartResponse =
            CartResponse.fromMap(response as Map<String, dynamic>);
        if (carts != cartResponse.carts) {
          total.value = cartResponse.total;
          carts.value = cartResponse.carts!;
          Get.back();
        } else {
          statusRequest.value = StatusRequest.success;
          await showDialogg('title', response['message']);
        }
      }
      if (response['message'] == 'Unauthenticated.') {
        await showDialogg('message', response['message']);
      } else if (response['errors'].toString().isNotEmpty) {
        statusRequest.value = StatusRequest.success;
      }
    }
  }

  @override
  edit() {}

  @override
  delete(int medicineId) async {
    // update();
    statusRequest.value = StatusRequest.loading;
    final response = await getData.deleteData('cart/$medicineId', {
      'device_id': deviceId,
    });
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        CartResponse cartResponse =
            CartResponse.fromMap(response as Map<String, dynamic>);
        // ignore: invalid_use_of_protected_member
        if (carts.value != cartResponse.carts) {
          total.value = cartResponse.total;
          carts.value = cartResponse.carts!;
          // update();
        }
      } else {
        statusRequest.value = StatusRequest.success;
        await showDialogg('title', response['message']);
      }
    }
    if (response['message'] == 'Unauthenticated.') {
      await showDialogg('message', response['message']);
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
      // showDialogg('title', response['message']);
    }
  }

  @override
  deleteAll() {}

  @override
  increment(Cart cart) {
    List<Cart> cts = <Cart>[];
    double totals = 0.0;
    for (var element in carts) {
      if (cart == element) {
        var c = cart.copyWith(quantity: cart.quantity + 1);
        totals += c.quantity * c.medicine.price;
        cts.add(c);
      } else {
        totals += element.quantity * element.medicine.price;
        cts.add(element);
      }
    }
    total.value = totals;
    carts.value = [...cts];
  }

  @override
  decrement(Cart cart) {
    List<Cart> cts = <Cart>[];
    double totals = total.value;
    if (cart.quantity > 1) {
      for (var element in carts) {
        if (cart == element) {
          var c = cart.copyWith(quantity: cart.quantity - 1);
          totals -= c.quantity * c.medicine.price;
          cts.add(c);
        } else {
          totals -= element.quantity * element.medicine.price;
          cts.add(element);
        }
      }
      total.value = totals;
      carts.value = [...cts];
    } else {
      for (var element in carts) {
        if (cart != element) {
          cts.add(element);
        }
      }
      carts.value = [...cts];
    }
  }

  set setCanPop(bool can) {
    canPop = can;
  }

  Future<void> changesSave() async {
    if (cartResponse.carts != carts) {
      await showDialoggExits('السلة', 'هل تريد حفظ التغييرات على السلة',
          () async {
        setCanPop = true;
        Get.back();
      });
    }
    setCanPop = true;
    Get.back();
  }

  showDialoggExits(title, message, Future<void> Function() onTap) async =>
      await showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text('لا'),
                ),
                InkWell(
                  onTap: onTap,
                  child: const Text('نعم'),
                ),
              ],
            );
          });

  Map get data {
    Map maps = {};
    List<Map<String, dynamic>> list = [];
    for (var cart in carts) {
      list.add({
        'medicine_id': cart.medicineId,
        'quantity': cart.quantity,
        // 'price':cart.medicine.price,
      });
    }
    maps.addAll({'cart': list});
    maps.addAll({'device_id': deviceId, 'pharmacy_id': pharmacy!.id});
    // print('it is ok');
    // print(maps);
    // print('it is ok');
    return maps;
  }

  @override
  checkout() async {
    statusRequest.value = StatusRequest.loading;
    // ! Authorization Bearer
    userResponse = getStorage.getUserResponse('user');
    final response = await getData.postData(
        'checkout', data, userResponse != null ? authorizationToken : {});
    TLogger.warining("carts is :$response");
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.back();
        Get.back();
      } else {
        statusRequest.value = StatusRequest.success;
        showDialogg('title', response['message']);
      }
    } else {
      statusRequest.value = StatusRequest.success;
    }
  }

  @override
  goToCheckoutScreen() {
    if (carts.isNotEmpty) {
      Get.toNamed(AppRoute.checkoutScreen);
    } else {
      showDialogg('السلة فارغة', 'السلة فارعة .');
    }
  }
}
