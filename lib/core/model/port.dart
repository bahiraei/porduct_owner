class PortModel {
  final String portName;
  final double lat;
  final double lng;
  final String id;

  PortModel({
    required this.portName,
    required this.lat,
    required this.lng,
    required this.id,
  });

  factory PortModel.fromJson(dynamic json) {
    return PortModel(
      portName: json['portName'],
      lat: json['latY'],
      lng: json['lonX'],
      id: json['id'],
    );
  }
}
