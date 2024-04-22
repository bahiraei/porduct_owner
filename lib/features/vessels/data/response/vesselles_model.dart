import '../model/vessel.dart';

class VessellesResponse {
  final List<Vessel> vesseles;

  VessellesResponse({
    required this.vesseles,
  });

  factory VessellesResponse.fromJson(dynamic json) {
    return VessellesResponse(
      vesseles: json['data'] != null
          ? List.from(json['data'])
              .map(
                (e) => Vessel.fromJson(e),
              )
              .toList()
          : [],
    );
  }
}
