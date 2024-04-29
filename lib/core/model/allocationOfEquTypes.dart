class AllocationOfEquTypesModel {
  final String id;
  final String name;
  final String? description;

  AllocationOfEquTypesModel({
    required this.id,
    required this.name,
    this.description,
  });

  factory AllocationOfEquTypesModel.fromJson(dynamic json) {
    return AllocationOfEquTypesModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
