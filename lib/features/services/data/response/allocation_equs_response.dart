import '../model/allocation_equ.dart';

class AllocationEquResponse {
  final List<AllocationEquModel> allocationEqus;
  final bool moreData;

  AllocationEquResponse({
    required this.allocationEqus,
    required this.moreData,
  });

  factory AllocationEquResponse.fromJson(dynamic json) {
    return AllocationEquResponse(
      allocationEqus: json['data']['allocationEqus'] != null
          ? List.from(json['data']['allocationEqus'])
              .map(
                (e) => AllocationEquModel.fromJson(e),
              )
              .toList()
          : [],
      moreData: json['data']['moreData'],
    );
  }
}
