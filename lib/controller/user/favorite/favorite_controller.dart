import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/model.dart';
import 'package:new_maps/data/models/user.dart';
import 'package:uuid/uuid.dart';

abstract class FavoriteController extends GetxController {
  getFavorite();
  add(Favorite favorite, [int quantity = 1]);
  delete(int favoriteId);
  void setfavorite(id, val);
}

class FavoriteControllerImp extends FavoriteController {
  GetData getData = GetData(Get.find());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final favorites = <Favorite>[].obs;
  String? deviceId;
  late FavoritePagination favoritePagination;
  Map isFavorites = {};
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
  getFavorite() async {
    statusRequest.value = StatusRequest.loading;
    // ! Authorization Bearer
    userResponse = getStorage.getUserResponse('user');
    final response = await getData.getData('favorites', {'device_id': deviceId},
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
    } else {
      statusRequest.value = StatusRequest.success;
    }
  }

  @override
  add(Favorite favorite, [int quantity = 1]) async {
    update();
    statusRequest.value = StatusRequest.loading;
    userResponse = userResponse ?? getStorage.getUserResponse('user');
    final response = await getData.postData(
        'favorites',
        {"medicine_id": favorite.id, 'device_id': deviceId},
        userResponse != null ? authorizationToken : {});
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        FavoritePagination cartResponse =
            FavoritePagination.fromMap(response as Map<String, dynamic>);
        if (favorites.value != cartResponse.favorites) {
          favorites.value = cartResponse.favorites!;
          Get.back();
        } else {
          statusRequest.value = StatusRequest.success;
          showDialogg('title', response['message']);
        }
      } else {
        statusRequest.value = StatusRequest.success;
      }
    }
  }

  @override
  delete(int favoriteId) async {
    // update();
    statusRequest.value = StatusRequest.loading;
    userResponse = userResponse ?? getStorage.getUserResponse('user');
    final response = await getData.deleteData(
        'favorites/$favoriteId',
        {'device_id': deviceId},
        userResponse != null ? authorizationToken : {});
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        FavoritePagination cartResponse =
            FavoritePagination.fromMap(response as Map<String, dynamic>);
        if (favorites.value != cartResponse.favorites) {
          favorites.value = cartResponse.favorites!;
          // update();
        }
      } else {
        statusRequest.value = StatusRequest.success;
        showDialogg('title', response['message']);
      }
    } else {
      statusRequest.value = StatusRequest.success;
    }
  }
  @override
  void setfavorite(id, val)async {
    isFavorites[id] = val;
    update();
  }

}
