class ShipTypeModel {
  final String id;
  final String name;

  ShipTypeModel({
    required this.id,
    required this.name,
  });

  factory ShipTypeModel.fromJson(dynamic json) {
    return ShipTypeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
