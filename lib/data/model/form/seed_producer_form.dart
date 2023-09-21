import 'dart:convert';

import '../../../naro_exporter.dart';

class SeedProducerForm {
  final int id;
  final String companyInformation;
  final String ownerName;
  final String phoneNumber;
  final String registrationNumber;
  final DateTime registrationDate;
  final String physicalAddress;
  final String certificateAndCompliance;
  final String category;

  SeedProducerForm({
    this.id = 0,
    this.category = "seedproducer",
    required this.companyInformation,
    required this.ownerName,
    required this.phoneNumber,
    required this.registrationNumber,
    required this.registrationDate,
    required this.physicalAddress,
    required this.certificateAndCompliance,
  });

  // to json

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'id'.inSnakeCase: id});
    result.addAll({'companyInformation'.inSnakeCase: companyInformation});
    result.addAll({'ownerName'.inSnakeCase: ownerName});
    result.addAll({'phoneNumber'.inSnakeCase: phoneNumber});
    result.addAll({'registrationNumber'.inSnakeCase: registrationNumber});
    result.addAll({'registrationDate'.inSnakeCase: registrationDate.millisecondsSinceEpoch});
    result.addAll({'physicalAddress'.inSnakeCase: physicalAddress});
    result.addAll({'certificateAndCompliance'.inSnakeCase: certificateAndCompliance});
    result.addAll({'category'.inSnakeCase: category});

    return result;
  }

 // get the form as json
  Map<String, dynamic> get asJson => toJson();

  factory SeedProducerForm.fromJson(Map<String, dynamic> map) {
    return SeedProducerForm(
      id: map['id'.inSnakeCase]?.toInt() ?? 0,
      companyInformation: map['companyInformation'.inSnakeCase] ?? '',
      ownerName: map['ownerName'.inSnakeCase] ?? '',
      phoneNumber: map['phoneNumber'.inSnakeCase] ?? '',
      registrationNumber: map['registrationNumber'.inSnakeCase] ?? '',
      registrationDate: DateTime.fromMillisecondsSinceEpoch(map['registrationDate'.inSnakeCase]),
      physicalAddress: map['physicalAddress'.inSnakeCase] ?? '',
      certificateAndCompliance: map['certificateAndCompliance'.inSnakeCase] ?? '',
      category: map['category'.inSnakeCase] ?? '',
    );
  }

}
