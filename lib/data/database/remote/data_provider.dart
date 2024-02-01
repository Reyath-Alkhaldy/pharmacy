import 'package:new_maps/core/class/curd_provider.dart';

class DataProvider {
  CrudProvider crud;
  DataProvider(this.crud);
  // GET DATA
  getData(linkurl, [Map? data, Map<String, dynamic>? headers]) async {
    var response = await crud.getData(linkurl, data!,headers);
    return response.fold((l) => l, (r) => r);
  }

  // POST DATA
  postData(linkurl, [Map? data, Map<String, dynamic>? headers]) async {
    var response = await crud.postData(linkurl, data, headers);
    return response.fold((l) => l, (r) => r);
  }

  // PUT DATA
  putData(linkurl, [Map? data, Map<String, dynamic>? headers]) async {
    var response = await crud.putData(linkurl, data!,headers);
    return response.fold((l) => l, (r) => r);
  }

  // DELETE DATA
  deleteData(linkurl, [Map? data, Map<String, dynamic>? headers]) async {
    var response = await crud.deleteData(linkurl, data!,headers);
    return response.fold((l) => l, (r) => r);
  }
}
