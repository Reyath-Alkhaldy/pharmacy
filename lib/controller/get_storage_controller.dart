import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_maps/data/models/user.dart';

abstract class GetStorageController extends GetxController {
  UserResponse? getUserResponse(String key);
  // void removeData(String key);
}

class GetStorageControllerImp extends GetStorageController {
  late GetStorage instance;
  @override
  void onInit() {
    super.onInit();
    instance = GetStorage();
  }

  @override
  UserResponse? getUserResponse(String key) {
    var user = instance.hasData(key);
    print(instance.read(key));
    print('aaaaaaaaaaaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAaa');
    return user ? UserResponse.fromJson(instance.read(key)) : null;
  }

  // @override
  // void removeData(String key) {
  //   if (instance.hasData(key)) {
  //     instance.remove(key);
  //   }
  // }
}
