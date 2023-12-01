import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../utils/constants.dart';
import 'end_points.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData() {
    return dio.get('${Constants.baseURl}${EndPoints.productList}');
  }
}
