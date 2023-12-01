import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'failures.dart';

@factoryMethod
class Exceptions extends Failures {
  Exceptions(super.message);

  factory Exceptions.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Exceptions('Connection timeout with api server');

      case DioExceptionType.sendTimeout:
        return Exceptions('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return Exceptions('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return Exceptions('badCertificate with api server');
      case DioExceptionType.badResponse:
        return Exceptions.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return Exceptions('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return Exceptions('No Internet Connection');
      case DioExceptionType.unknown:
        return Exceptions('Opps There was an Error, Please try again');
    }
  }

  factory Exceptions.fromResponse(int statusCode, dynamic response) {
    return Exceptions(response['detail']);
  }
}
