class ProductCategoryModel {
  final String id;
  final String name;

  ProductCategoryModel({
    required this.id,
    required this.name,
  });

  factory ProductCategoryModel.fromJson(dynamic json) {
    return ProductCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
