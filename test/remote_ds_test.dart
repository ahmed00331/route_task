import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:route_task/core/api/api_manager.dart';
import 'package:route_task/core/error/execptions.dart';
import 'package:route_task/core/error/failures.dart';
import 'package:route_task/features/product_list/data/data_sources/remote_ds/product_list_ds_impl.dart';
import 'package:route_task/features/product_list/data/models/ProductModel.dart';

import 'remote_ds_test.mocks.dart';

@GenerateMocks([ApiManager])
main() {
  late MockApiManager manager;
  late ProductRemoteDSImpl productRemoteDSImpl;
  setUp(() {
    manager = MockApiManager();
    productRemoteDSImpl = ProductRemoteDSImpl(apiManager: manager);
  });

  group('Get All products', () {
    test('return products if the status code is 200 ', () async {
      //Arrange
      var data = {
        "products": [
          {
            "id": 1,
            "title": "iPhone 9",
            "description": "An apple mobile which is nothing like apple",
            "price": 549,
            "discountPercentage": 12.96,
            "rating": 4.69,
            "stock": 94,
            "brand": "Apple",
            "category": "smartphones",
            "thumbnail":
                "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
            "images": [
              "https://i.dummyjson.com/data/products/1/1.jpg",
              "https://i.dummyjson.com/data/products/1/2.jpg",
              "https://i.dummyjson.com/data/products/1/3.jpg",
              "https://i.dummyjson.com/data/products/1/4.jpg",
              "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
            ]
          }
        ]
      };
      when(manager.getData()).thenAnswer((_) async => data);

      //Act

      final result = await productRemoteDSImpl.getProducts();

      //Assert

      expect(result, isA<Right<Failures, ProductModel>>());
    });
    test('return products the status code is 400 ', () async {
      when(manager.getData())
          .thenThrow((_) async => Exceptions("status code is 400"));
      final result = await productRemoteDSImpl.getProducts();
      expect(result, isA<Left<Failures, dynamic>>());
    });
  });
}
