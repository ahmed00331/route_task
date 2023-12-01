import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/di/config.dart';
import '../../../../../core/error/execptions.dart';
import '../../../../../core/error/failures.dart';
import '../../models/ProductModel.dart';
import 'product_list_ds.dart';

@Injectable(as: ProductRemoteDS)
class ProductRemoteDSImpl implements ProductRemoteDS {
  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      Response response = await getIt<ApiManager>().getData();
      var productsListModel = ProductModel.fromJson(response.data);
      print(productsListModel.products);
      return Right(productsListModel);
    } catch (e) {
      print(Exceptions(e.toString()));
      return Left(Exceptions(e.toString()));
    }
  }
}
