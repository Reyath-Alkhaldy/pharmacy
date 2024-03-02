import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/favorite.dart';
import 'package:new_maps/data/models/medicine.dart';
import 'package:new_maps/data/models/user.dart';
import 'package:uuid/uuid.dart';

abstract class FavoriteController extends GetxController {
  getFavorite();
  getMoreFavorite();
  add(int medicineId);
  delete(Favorite favorite);
  setfavorite(int medicineId, bool val);
  goToMedicineDetails(Medicine medicine);
}

class FavoriteControllerImp extends FavoriteController {
  GetData getData = GetData(Get.find());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
  int page = 0;
  ScrollController scrollController = ScrollController();
  final favorites = <Favorite>[].obs;
  String? deviceId;
  late FavoritePagination favoritePagination;
  final Map<int, bool> isFavorites = {};
  UserResponse? userResponse;
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();

// ! Authorization Bearer
  get authorizationToken => {'Authorization': 'Bearer ${userResponse!.token}'};

  void _setUuid() async {
    deviceId = getStorage.instance.read('device_id');
    if (deviceId == null) {
      deviceId = const Uuid().v1();
      await getStorage.instance.write('device_id', deviceId);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _setUuid();
    getFavorite();
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
        if (page < favoritePagination.lastPage!) {
          page++;
          getMoreFavorite();
        }
      }
    });
  }

  @override
  getFavorite() async {
    statusRequest.value = StatusRequest.loading;
    // ! Authorization Bearer
    userResponse = userResponse ?? getStorage.getUserResponse('user');
    final response = await getData.getData(
        'favorites?page=$page',
        {'device_id': deviceId},
        userResponse != null ? authorizationToken : {});
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        favoritePagination = FavoritePagination.fromMap(
            response['favorites'] as Map<String, dynamic>);
        // ignore: invalid_use_of_protected_member
        if (favorites.value != favoritePagination.favorites) {
          favorites.value = favoritePagination.favorites!;
        }
      } else {
        statusRequest.value = StatusRequest.success;
        showDialogg('title', response['message']);
      }
    }
  }

  @override
  getMoreFavorite() async {
    anotherStatusRequest.value = StatusRequest.loading;
    final response = await getData.getData(
        'favorites?page=$page',
        {'device_id': deviceId},
        userResponse != null ? authorizationToken : {});
    anotherStatusRequest.value = handlingData(response);
    if (anotherStatusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        favoritePagination = FavoritePagination.fromMap(
            response['favorites'] as Map<String, dynamic>);
        if (favorites != favoritePagination.favorites) {
          favorites.addAll(favoritePagination.favorites!);
        }
      } else {
        anotherStatusRequest.value = StatusRequest.success;
        showDialogg('title', response['message']);
      }
    }
  }

  @override
  add(int medicineId) async {
    statusRequest.value = StatusRequest.loading;
    userResponse = userResponse ?? getStorage.getUserResponse('user');
    final response = await getData.postData(
        'favorites',
        {"medicine_id": medicineId, 'device_id': deviceId},
        userResponse != null ? authorizationToken : {});
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        TLogger.debug(response['message']);
        statusRequest.value = StatusRequest.success;
      } else {
        statusRequest.value = StatusRequest.success;
        showDialogg('title', response['message']);
      }
    }
  }

  _remove(int medicineId) async {
    statusRequest.value = StatusRequest.loading;
    userResponse = userResponse ?? getStorage.getUserResponse('user');
    final response = await getData.deleteData(
        'favorites/remove',
        {'medicine_id': medicineId},
        userResponse != null ? authorizationToken : {});
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        TLogger.debug(response['message']);
        statusRequest.value = StatusRequest.success;
      } else {
        statusRequest.value = StatusRequest.success;
        showDialogg('title', response['message']);
      }
    } else {
      statusRequest.value = StatusRequest.success;
    }
  }

  @override
  setfavorite(int medicineId, bool val) async {
    print(medicineId);
    val == false ? await _remove(medicineId) : await add(medicineId);
    isFavorites[medicineId] = val;
    update();
  }

  @override
  delete(Favorite favorite) async {
    // update();
    statusRequest.value = StatusRequest.loading;
    userResponse = userResponse ?? getStorage.getUserResponse('user');
    final response = await getData.deleteData(
        'favorites/${favorite.id}',
        {'device_id': deviceId},
        userResponse != null ? authorizationToken : {});
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        // ! remove frome list
        favorites.removeWhere((element) => element == favorite);
        statusRequest.value = StatusRequest.success;
      } else {
        statusRequest.value = StatusRequest.success;
        showDialogg('title', response['message']);
      }
    } else {
      statusRequest.value = StatusRequest.success;
    }
  }

  @override
  goToMedicineDetails(Medicine medicine) {
    Get.toNamed(AppRoute.medicineDetails, arguments: {
      'medicine': medicine,
    });
  }
}
