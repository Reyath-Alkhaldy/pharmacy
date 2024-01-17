import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_maps/data/database/remote/get_data.dart';

abstract class CartController extends GetxController {
  getCart();
  add();
  remove();
  edit();
}

class CartControllerImp extends CartController {
  GetStorage getStorage = GetStorage();
  GetData getData = GetData(Get.find());

  @override
  getCart() {
    getData.getData('cart');
  }

  @override
  add() {}

  @override
  edit() {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  remove() {
    // TODO: implement remove
    throw UnimplementedError();
  }
}
