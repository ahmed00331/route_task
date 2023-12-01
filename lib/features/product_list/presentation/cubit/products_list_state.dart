part of 'products_list_cubit.dart';

@immutable
abstract class ProductsListState {}

class ProductsListInitial extends ProductsListState {}

class ProductsLoadingState extends ProductsListState {}

class ProductsFailureState extends ProductsListState {
  final Failures failures;

  ProductsFailureState({
    required this.failures,
  });
}

class ProductsSuccessState extends ProductsListState {
  ProductModel productsList;

  ProductsSuccessState({
    required this.productsList,
  });
}
