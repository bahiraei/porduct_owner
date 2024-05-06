import 'package:porduct_owner/core/model/product.dart';

class ProductCategoryModel {
  final String id;
  final String name;

  final List<ProductModel> products;

  ProductCategoryModel({
    required this.id,
    required this.name,
    required this.products,
  });

  factory ProductCategoryModel.fromJson(dynamic json) {
    return ProductCategoryModel(
      id: json['id'],
      name: json['name'],
      products: json['products'] != null
          ? List.from(json['products'])
              .map(
                (e) => ProductModel.fromJson(e),
              )
              .toList()
          : [],
    );
  }
}
