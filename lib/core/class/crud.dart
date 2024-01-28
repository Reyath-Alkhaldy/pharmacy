import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:new_maps/core/class/dio_client.dart';
import '../functions/check_internet_connection.dart';
import 'status_request.dart';

class Crud {
  DioClient? dio;
  // final NetWorkController netWorkController = Get.find<NetWorkController>();

  Crud() {
    // netWorkController.connectionStatus.value;
    dio = DioClient();
  }
  //! get rquest DATA
  Future<Either<StatusRequest, Map>> getData(String linkurl,
      [Map? data]) async {
    print('before checked Internet conntected');
    if (await checkInternetConnection()) {
      if (kDebugMode) {
        print('checked Internet conntected');
      }
      var response = await dio!.instance.get(
        linkurl,
        data: data ?? {},
      );
      if (kDebugMode) {
        print(response.data);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = response.data;
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  //! post rquest DATA
  Future<Either<StatusRequest, Map>> postData(String linkurl,
      [Map? data]) async {
    if (await checkInternetConnection()) {
      var response = await dio!.instance.post(linkurl, data: data ?? {});
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = response.data;
        return Right(responsebody);
      } else if (response.statusCode! >= 500) {
        return const Left(StatusRequest.serverfailure);
      } else if (response.statusCode == 422) {
        Map responsebody = response.data;
        return Right(responsebody);
      } else if (response.statusCode! >= 400 || response.statusCode! <= 500) {
        Map responsebody = response.data;
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  //! put rquest DATA
  Future<Either<StatusRequest, Map>> putData(String linkurl,
      [Map? data]) async {
    if (await checkInternetConnection()) {
      var response = await dio!.instance.put(linkurl, data: data ?? {});
      if (kDebugMode) {
        print(response.statusCode);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = response.data;
        // print(responsebody);
        if (kDebugMode) {
          print('object');
        }
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  //! get rquest DATA
  Future<Either<StatusRequest, Map>> deleteData(String linkurl,
      [Map? data]) async {
    if (await checkInternetConnection()) {
      var response = await dio!.instance.delete(
        linkurl,
        data: data ?? {},
      );
      if (kDebugMode) {
        print(response.statusCode);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = response.data;
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
