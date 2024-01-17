import 'package:new_maps/core/class/crud.dart';

class GetData {
  Crud crud;
  GetData(this.crud);
  getData(linkurl,[Map? data]) async {
    var response = await crud.getData(linkurl,  data!);
    return response.fold((l) => l, (r) => r);
  }
  postData(linkurl,[Map? data]) async {
    var response = await crud.postData(linkurl,  data!);
    return response.fold((l) => l, (r) => r);
  }
}
