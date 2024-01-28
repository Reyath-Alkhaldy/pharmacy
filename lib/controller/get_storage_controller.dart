import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class GetStorageController extends GetxController {}

class GetStorageControllerImp extends GetStorageController {
  late GetStorage instance;
  @override
  void onInit() {
    super.onInit();
    instance = GetStorage();
  }
}
