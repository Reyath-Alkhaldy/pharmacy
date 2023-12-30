import 'package:new_maps/core/class/crud.dart';

class CategoryData {
  Crud crud;
  CategoryData(this.crud);
  getCategories(linkurl, [Map? data]) async {
    var response = await crud.getData(linkurl, data);
    return response.fold((l) => l, (r) => r);
  }
}
