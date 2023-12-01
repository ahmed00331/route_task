import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  ProductModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((product) {
        products?.add(Products.fromJson(product));
      });
    }
    total = json['total'] as int?;
    skip = json['skip'] as int?;
    limit = json['limit'] as int?;
  }

  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  @override
  // TODO: implement props
  List<Object?> get props => [
        products,
        total,
        skip,
        limit,
      ];
}

class Products extends Equatable {
  Products({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"] as int?;
    title = json["title"] as String?;
    description = json["description"] as String?;
    price = json["price"] as int?;
    discountPercentage = (json["discountPercentage"] as num?)?.toDouble();
    rating = (json["rating"] as num?)?.toDouble();
    stock = json["stock"] as int?;
    brand = json["brand"] as String?;
    category = json["category"] as String?;
    thumbnail = json["thumbnail"] as String?;
    images = json["images"] == null
        ? null
        : List<String>.from(json["images"] as List<dynamic>);
  }

  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<dynamic>? images;

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        discountPercentage,
        rating,
        stock,
        brand,
        category,
        thumbnail,
        images,
      ];
}
