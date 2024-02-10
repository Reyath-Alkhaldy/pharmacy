import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_maps/data/models/user.dart';

abstract class GetStorageController extends GetxController {
  UserResponse? get getUserResponse;
}

class GetStorageControllerImp extends GetStorageController {
  // late UserResponse userResponse;
  late GetStorage instance;
  @override
  void onInit() {
    super.onInit();
    instance = GetStorage();
  }

  @override
  UserResponse? get getUserResponse {
    var user = instance.read('user');
    return user != null || user.isNotEmpty ? UserResponse.fromJson(user) : null;
  }
}
