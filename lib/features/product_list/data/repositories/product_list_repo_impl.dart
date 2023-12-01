import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/config.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/product_list_repo.dart';
import '../data_sources/remote_ds/product_list_ds.dart';
import '../models/ProductModel.dart';

@Injectable(as: ProductListRepo)
class ProductListRepoImpl implements ProductListRepo {
  @override
  Future<Either<Failures, ProductModel>> getProductList() =>
      getIt<ProductRemoteDS>().getProducts();
}
