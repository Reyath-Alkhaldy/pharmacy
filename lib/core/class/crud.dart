import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:new_maps/core/class/dio_client.dart';
import '../functions/check_internet_connection.dart';
import 'status_request.dart';

class Crud {
  DioClient? dio;

  //! get rquest DATA
  Future<Either<StatusRequest, Map>> getData(String linkurl,
      [Map? data]) async {
    print('before checked Internet conntected');
    dio = DioClient();
    if (await checkInternetConnection()) {
      if (kDebugMode) {
        print('checked Internet conntected');
      }
      var response = await dio!.instance.get(linkurl, data: data ?? {},);
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

  //! post rquest DATA
  Future<Either<StatusRequest, Map>> postData(String linkurl,[ Map? data]) async {
    dio = DioClient();
    if (await checkInternetConnection()) {
      var response = await dio!.instance.post(linkurl, data: data ?? {});
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.data);
        if (kDebugMode) {
          print(responsebody);
        }

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  //! put rquest DATA
  Future<Either<StatusRequest, Map>> putData(String linkurl, Map data) async {
    dio = DioClient();
    if (await checkInternetConnection()) {
      var response = await dio!.instance.put(
        linkurl,
      );
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
}
