class ShipModel {
  final String id;
  final String? imoNumber;

  final String shipName;

  ShipModel({
    required this.id,
    this.imoNumber,
    required this.shipName,
  });

  factory ShipModel.fromJson(dynamic json) {
    return ShipModel(
      id: json['id'],
      shipName: json['shipName'],
      imoNumber: json['imoNumber'],
    );
  }
}
