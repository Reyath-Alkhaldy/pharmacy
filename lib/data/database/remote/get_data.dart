import 'package:new_maps/core/class/crud.dart';

class GetData {
  Crud crud;
  GetData(this.crud);
  // GET DATA
  getData(linkurl,[Map? data]) async {
    var response = await crud.getData(linkurl,  data!);
    return response.fold((l) => l, (r) => r);
  }

  // POST DATA
  postData(linkurl,[Map? data]) async {
    var response = await crud.postData(linkurl,  data!);
    return response.fold((l) => l, (r) => r);
  }

  // PUT DATA
  putData(linkurl,[Map? data]) async {
    var response = await crud.putData(linkurl,  data!);
    return response.fold((l) => l, (r) => r);
  }

  // DELETE DATA
  deleteData(linkurl,[Map? data]) async {
    var response = await crud.deleteData(linkurl,  data!);
    return response.fold((l) => l, (r) => r);
  }
}
