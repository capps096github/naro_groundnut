import '../../../global/extensions/string_extension.dart';

class FarmerForm {
  final int id;
  final String levelOfEducation;
  final String maritalStatus;
  final String numberOfDependants;
  final String farmersGroup;
  final String farmingExperience;
  final String productionScale;
  final String category;

  FarmerForm({
    this.id = 0,
    this.category = "farmer",
    required this.levelOfEducation,
    required this.maritalStatus,
    required this.numberOfDependants,
    required this.farmersGroup,
    required this.farmingExperience,
    required this.productionScale,
  });

  // to json
  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'id'.inSnakeCase: id});
    result.addAll({'category'.inSnakeCase: category});
    result.addAll({'levelOfEducation'.inSnakeCase: levelOfEducation});
    result.addAll({'maritalStatus'.inSnakeCase: maritalStatus});
    result.addAll({'numberOfDependants'.inSnakeCase: numberOfDependants});
    result.addAll({'farmersGroup'.inSnakeCase: farmersGroup});
    result.addAll({'farmingExperience'.inSnakeCase: farmingExperience});
    result.addAll({'productionScale'.inSnakeCase: productionScale});

    return result;
  }

  // get the form as json
  Map<String, dynamic> get asJson => toJson();

  // from json
  factory FarmerForm.fromJson(Map<String, dynamic> map) {
    return FarmerForm(
      id: map['id'.inSnakeCase]?.toInt() ?? 0,
      levelOfEducation: map['levelOfEducation'.inSnakeCase] ?? '',
      category: map['category'.inSnakeCase] ?? '',
      maritalStatus: map['maritalStatus'.inSnakeCase] ?? '',
      numberOfDependants: map['numberOfDependants'.inSnakeCase] ?? '',
      farmersGroup: map['farmersGroup'.inSnakeCase] ?? '',
      farmingExperience: map['farmingExperience'.inSnakeCase] ?? '',
      productionScale: map['productionScale'.inSnakeCase] ?? '',
    );
  }
}
