import 'package:porduct_owner/core/model/allocationOfEquTypes.dart';
import 'package:porduct_owner/core/model/port.dart';
import 'package:porduct_owner/core/model/product_category.dart';
import 'package:porduct_owner/core/model/ship.dart';
import 'package:porduct_owner/core/model/ship_type.dart';

class ShipsResponse {
  final List<ShipModel> ships;

  final bool isSuccess;
  final String? message;

  ShipsResponse({
    required this.ships,
    required this.isSuccess,
    this.message,
  });

  factory ShipsResponse.fromJson(dynamic json) {
    return ShipsResponse(
      isSuccess: json['isSuccess'],
      message: json['message'],
      ships: json['data'] != null
          ? List.from(json['data'])
              .map(
                (e) => ShipModel.fromJson(e),
              )
              .toList()
          : [],
    );
  }
}
