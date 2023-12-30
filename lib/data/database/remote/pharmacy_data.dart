import 'package:new_maps/core/class/crud.dart';

class PharmacyData {
  Crud crud;
  PharmacyData(this.crud);
  getPharmacies(linkurl,[Map? data]) async {
    var response = await crud.getData(linkurl,  data!);
    return response.fold((l) => l, (r) => r);
  }
}
