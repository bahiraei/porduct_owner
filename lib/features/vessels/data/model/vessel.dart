class Vessel {
  final String pmoNumber;
  final String? entranceDate;
  final double gt;
  final double nt;
  final String? port;
  final String type;
  final String name;
  final String? lastLocationPersianName;
  final String? vesselFlagCountryPersianName;
  final String? voyageStatePersianName;
  final String? mooringPortId;

  Vessel({
    required this.pmoNumber,
    this.entranceDate,
    required this.gt, //وزن ناخالص
    required this.nt, // وزن خالص
    this.port,
    required this.type,
    required this.name,
    required this.lastLocationPersianName,
    required this.vesselFlagCountryPersianName,
    required this.voyageStatePersianName,
    required this.mooringPortId,
  });

  factory Vessel.fromJson(dynamic json) {
    return Vessel(
      pmoNumber: json['pmoNumber'],
      type: json['vesselType'],
      port: json['mooringPortPersianName'],
      name: json['vesselPersianName'],
      entranceDate: json['jalaliEntranceAnchorageDateTimeTitle'],
      gt: json['gt'],
      nt: json['nt'],
      lastLocationPersianName: json['lastLocationPersianNameTitle'],
      vesselFlagCountryPersianName: json['vesselFlagCountryPersianName'],
      voyageStatePersianName: json['voyageStatePersianName'],
      mooringPortId: json['mooringPortId'].toLowerCase(),
    );
  }
}
