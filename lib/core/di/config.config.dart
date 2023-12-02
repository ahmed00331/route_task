// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/product_list/data/data_sources/remote_ds/product_list_ds.dart'
    as _i7;
import '../../features/product_list/data/data_sources/remote_ds/product_list_ds_impl.dart'
    as _i8;
import '../../features/product_list/data/repositories/product_list_repo_impl.dart'
    as _i5;
import '../../features/product_list/domain/repositories/product_list_repo.dart'
    as _i4;
import '../../features/product_list/domain/use_cases/product_list_use_case.dart'
    as _i6;
import '../../features/product_list/presentation/cubit/products_list_cubit.dart'
    as _i9;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.ProductListRepo>(() => _i5.ProductListRepoImpl());
    gh.factory<_i6.ProductListUseCase>(() => _i6.ProductListUseCase());
    gh.factory<_i7.ProductRemoteDS>(
        () => _i8.ProductRemoteDSImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i9.ProductsListCubit>(
        () => _i9.ProductsListCubit(gh<_i6.ProductListUseCase>()));
    return this;
  }
}
