import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
import 'package:new_maps/core/class/dio_client.dart';
import 'package:new_maps/core/utils/logger.dart';
import '../functions/check_internet_connection.dart';
import 'status_request.dart';
import 'dart:io';

extension DioErrorX on DioException {
  bool get isNoConnectionError =>
      type == DioExceptionType.connectionError &&
      error is SocketException; // import 'dart:io' for SocketException
}

class Crud {
  DioClient? dio;
  // final NetWorkController netWorkController = Get.find<NetWorkController>();

  Crud() {
    // netWorkController.connectionStatus.value;
    dio = DioClient();
  }
  //
  Future<Either<StatusRequest, Map>> uploadImage(String imagePath, String path,
      data,[ Map<String, String>? headers]) async {
    if (await checkInternetConnection()) {
      try {
        final response = await dio!.instance
            .post(path, data: data, options: Options(headers: headers ?? {}));
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
      } on DioException catch (e) {
        if (e.isNoConnectionError) {
          // handle no connection error
          TLogger.info('immmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm1');
          return const Left(StatusRequest.offlinefailure);
        } else if (e.response != null) {
          TLogger.error('immmmmmmmmmmmmmmmmmmmmmmmmmmmmm2');
          print(e.response?.statusCode);
          TLogger.info(e.response!.data['message']);
          TLogger.error('immmmmmmmmmmmmmmmmmmmmmmmmmmmmm3');
        }

        return Right(e.response?.data);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  //! get rquest DATA
  Future<Either<StatusRequest, Map>> getData(String linkurl,
      [Map? data, Map<String, dynamic>? headers]) async {
    if (await checkInternetConnection()) {
      try {
        var response = await dio!.instance.get(linkurl,
            data: data ?? {}, options: Options(headers: headers ?? {}));

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = response.data;
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } on DioException catch (e) {
        if (e.isNoConnectionError) {
          // handle no connection error
          TLogger.info('helloooooooooooo1');
          return const Left(StatusRequest.offlinefailure);
        } else if (e.response != null) {
          TLogger.error('helloooooooooooo2');
          TLogger.info(e.response!.data['message']);

          TLogger.error('helloooooooooooo3');
        }

        return Right(e.response?.data);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  //! post rquest DATA
  Future<Either<StatusRequest, Map>> postData(String linkurl,
      [Map? data, Map<String, dynamic>? headers]) async {
    if (await checkInternetConnection()) {
      try {
        var response = await dio!.instance.post(linkurl,
            data: data ?? {}, options: Options(headers: headers ?? {}));
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
      } on DioException catch (e) {
        if (e.isNoConnectionError) {
          // handle no connection error
          TLogger.info('helloooooooooooo1');
          return const Left(StatusRequest.offlinefailure);
        } else if (e.response != null) {
          TLogger.error('helloooooooooooo2');
          print(e.response?.statusCode);
          TLogger.info(e.response!.data['message']);

          TLogger.error('helloooooooooooo3');
        }

        return Right(e.response?.data);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  //! put rquest DATA
  Future<Either<StatusRequest, Map>> putData(String linkurl,
      [Map? data, Map<String, dynamic>? headers]) async {
    if (await checkInternetConnection()) {
      try {
        var response = await dio!.instance.put(linkurl,
            data: data ?? {}, options: Options(headers: headers ?? {}));
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
      } on DioException catch (e) {
        if (e.isNoConnectionError) {
          // handle no connection error
          TLogger.info('helloooooooooooo1');
          return const Left(StatusRequest.offlinefailure);
        } else if (e.response != null) {
          TLogger.error('helloooooooooooo2');
          print(e.response?.statusCode);
          TLogger.info(e.response!.data['message']);

          TLogger.error('helloooooooooooo3');
        }

        return Right(e.response?.data);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  //! delete rquest DATA
  Future<Either<StatusRequest, Map>> deleteData(String linkurl,
      [Map? data, Map<String, dynamic>? headers]) async {
    if (await checkInternetConnection()) {
      try {
        var response = await dio!.instance.delete(linkurl,
            data: data ?? {}, options: Options(headers: headers ?? {}));
        if (kDebugMode) {
          print(response.statusCode);
        }

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = response.data;
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } on DioException catch (e) {
        if (e.isNoConnectionError) {
          // handle no connection error
          TLogger.info('helloooooooooooo1');
          return const Left(StatusRequest.offlinefailure);
        } else if (e.response != null) {
          TLogger.error('helloooooooooooo2');
          print(e.response?.statusCode);
          TLogger.info(e.response!.data['message']);

          TLogger.error('helloooooooooooo3');
        }

        return Right(e.response?.data);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
