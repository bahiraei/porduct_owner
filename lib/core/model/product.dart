class ProductModel {
  final String id;
  final String productName;

  ProductModel({
    required this.id,
    required this.productName,
  });

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      id: json['id'],
      productName: json['productName'],
    );
  }
}
