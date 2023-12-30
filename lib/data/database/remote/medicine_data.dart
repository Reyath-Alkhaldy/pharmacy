// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:new_maps/core/class/crud.dart';

class MedicineData {
  Crud crud;
  MedicineData({
    required this.crud,
  });
  getMedicines(linkurl, [Map? data]) async {
    var response = await crud.getData(linkurl, data);
    return response.fold((l) => l, (r) => r);
  }
}
