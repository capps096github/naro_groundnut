

import '../../../naro_exporter.dart';

class ServiceProviderForm {
  final String serviceProviderName;
  final String emailAddress;
  final String postalAddress;
  final String servicesOffered;
  final String districtSubCounty;
  final String logo;
  final String certificateOfIncorporation;
  final String license;
  final String category;
  final int id;

  ServiceProviderForm({
    this.id = 0,
    this.category = "serviceprovider",
    required this.serviceProviderName,
    required this.emailAddress,
    required this.postalAddress,
    required this.servicesOffered,
    required this.districtSubCounty,
    required this.logo,
    required this.certificateOfIncorporation,
    required this.license,
  });

  // get the form as json
  Map<String, dynamic> get asJson => toJson();

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'serviceProviderName'.inSnakeCase: serviceProviderName});
    result.addAll({'emailAddress'.inSnakeCase: emailAddress});
    result.addAll({'postalAddress'.inSnakeCase: postalAddress});
    result.addAll({'servicesOffered'.inSnakeCase: servicesOffered});
    result.addAll({'districtSubCounty'.inSnakeCase: districtSubCounty});
    result.addAll({'logo'.inSnakeCase: logo});
    result.addAll({'certificateOfIncorporation'.inSnakeCase: certificateOfIncorporation});
    result.addAll({'license'.inSnakeCase: license});
    result.addAll({'category'.inSnakeCase: category});
    result.addAll({'id'.inSnakeCase: id});

    return result;
  }

  factory ServiceProviderForm.fromJson(Map<String, dynamic> map) {
    return ServiceProviderForm(
      serviceProviderName: map['serviceProviderName'.inSnakeCase] ?? '',
      emailAddress: map['emailAddress'.inSnakeCase] ?? '',
      postalAddress: map['postalAddress'.inSnakeCase] ?? '',
      servicesOffered: map['servicesOffered'.inSnakeCase] ?? '',
      districtSubCounty: map['districtSubCounty'.inSnakeCase] ?? '',
      logo: map['logo'.inSnakeCase] ?? '',
      certificateOfIncorporation: map['certificateOfIncorporation'.inSnakeCase] ?? '',
      license: map['license'.inSnakeCase] ?? '',
      category: map['category'.inSnakeCase] ?? '',
      id: map['id'.inSnakeCase]?.toInt() ?? 0,
    );
  }
}
