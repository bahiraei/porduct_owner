import 'package:porduct_owner/core/model/allocationOfEquTypes.dart';
import 'package:porduct_owner/core/model/port.dart';
import 'package:porduct_owner/core/model/product_category.dart';
import 'package:porduct_owner/core/model/ship_type.dart';

class AllocationEquBaseInfoResponse {
  final List<ProductCategoryModel> productCategories;
  final List<PortModel> ports;
  final List<ShipTypeModel> shipTypes;
  final List<AllocationOfEquTypesModel> allocationEquTypes;
  final bool isSuccess;
  final String? message;

  AllocationEquBaseInfoResponse({
    required this.ports,
    required this.productCategories,
    required this.shipTypes,
    required this.allocationEquTypes,
    required this.isSuccess,
    this.message,
  });

  factory AllocationEquBaseInfoResponse.fromJson(dynamic json) {
    return AllocationEquBaseInfoResponse(
      isSuccess: json['isSuccess'],
      message: json['message'],
      productCategories: json['data']['productCategories'] != null
          ? List.from(json['data']['productCategories'])
              .map(
                (e) => ProductCategoryModel.fromJson(e),
              )
              .toList()
          : [],
      ports: json['data']['ports'] != null
          ? List.from(json['data']['ports'])
              .map(
                (e) => PortModel.fromJson(e),
              )
              .toList()
          : [],
      shipTypes: json['data']['shipTypes'] != null
          ? List.from(json['data']['shipTypes'])
              .map(
                (e) => ShipTypeModel.fromJson(e),
              )
              .toList()
          : [],
      allocationEquTypes: json['data']['allocationOfEquTypes'] != null
          ? List.from(json['data']['allocationOfEquTypes'])
              .map(
                (e) => AllocationOfEquTypesModel.fromJson(e),
              )
              .toList()
          : [],
    );
  }
}
