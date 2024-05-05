class AllocationEquModel {
  final String id;
  final String? manifestFilePath;
  final String? companyOwnerCompanyName;
  final String? companyOwnerId;
  final String stateTitle;
  final int state;

  final String? allocationOfEquTypeName;
  final String portPortName;

  final String portId;

  final String? description;

  final String? totalPriceCompanyTitle;

  final int totalPriceCompany;

  final String? totalPriceOrgTitle;

  final int totalPriceOrg;
  final String tonnageTitle;
  final int tonnage;

  final String enterShipFa;
  final String? pmoNumber;

  final String? productCategoryName;

  final String? productCategoryId;
  final String shipShipName;
  final String shipId;

  AllocationEquModel({
    required this.id,
    this.manifestFilePath,
    this.companyOwnerCompanyName,
    this.companyOwnerId,
    required this.stateTitle,
    required this.state,
    this.allocationOfEquTypeName,
    required this.portPortName,
    required this.portId,
    this.description,
    this.totalPriceCompanyTitle,
    required this.totalPriceCompany,
    this.totalPriceOrgTitle,
    required this.totalPriceOrg,
    required this.tonnageTitle,
    required this.tonnage,
    required this.enterShipFa,
    this.pmoNumber,
    this.productCategoryName,
    this.productCategoryId,
    required this.shipShipName,
    required this.shipId,
  });

  factory AllocationEquModel.fromJson(dynamic json) {
    return AllocationEquModel(
      id: json['id'],
      manifestFilePath: json['manifestFilePath'],
      companyOwnerCompanyName: json['companyOwnerCompanyName'],
      companyOwnerId: json['companyOwnerId'],
      stateTitle: json['stateTitle'],
      state: json['state'],
      allocationOfEquTypeName: json['allocationOfEquTypeName'],
      portPortName: json['portPortName'],
      portId: json['portId'],
      description: json['description'],
      totalPriceOrgTitle: json['totalPriceOrgTitle'],
      totalPriceOrg: json['totalPriceOrg'],
      totalPriceCompanyTitle: json['totalPriceCompanyTitle'],
      totalPriceCompany: json['totalPriceCompany'],
      tonnageTitle: json['tonnageTitle'],
      tonnage: json['tonnage'],
      enterShipFa: json['enterShipFa'],
      pmoNumber: json['pmoNumber'],
      productCategoryName: json['productCategoryName'],
      productCategoryId: json['productCategoryId'],
      shipShipName: json['shipShipName'],
      shipId: json['shipId'],
    );
  }
}
