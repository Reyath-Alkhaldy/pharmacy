import 'package:new_maps/core/class/crud.dart';

class GetData {
  Crud crud;
  GetData(this.crud);
  // GET DATA
  getData(linkurl, [Map? data, Map<String, dynamic>? headers]) async {
    var response = await crud.getData(linkurl, data!, headers);
    return response.fold((l) => l, (r) => r);
  }

  // POST DATA
  postData(linkurl, [Map? data, Map<String, dynamic>? headers]) async {
    var response = await crud.postData(linkurl, data, headers);
    return response.fold((l) => l, (r) => r);
  }

  // POST DATA
  uploadImageWithData(imagePath, String url,
     data,[ Map<String, String>? headers]) async {
    var response = await crud.uploadImage(imagePath,url, data, headers);
    return response.fold((l) => l, (r) => r);
  }

  // PUT DATA
  putData(linkurl, [Map? data, Map<String, dynamic>? headers]) async {
    var response = await crud.putData(linkurl, data!, headers);
    return response.fold((l) => l, (r) => r);
  }

  // DELETE DATA
  deleteData(linkurl, [Map? data, Map<String, dynamic>? headers]) async {
    var response = await crud.deleteData(linkurl, data!, headers);
    return response.fold((l) => l, (r) => r);
  }
}
