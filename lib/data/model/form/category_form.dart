import '../../../global/exporter.dart';
import 'farmer_form.dart';
import 'seed_producer_form.dart';
import 'service_provider_form.dart';

class CategoryForm {
  final int id;
  final String userId;
  final String category;
  final String levelOfEducation;
  final String maritalStatus;
  final String numberOfDependants;
  final String farmersGroup;
  final String farmingExperience;
  final String productionScale;
  final String companyInformation;
  final String ownerName;
  final String phoneNumber;
  final String registrationNumber;
  final String registrationDate;
  final String physicalAddress;
  final String certificateAndCompliance;
  final String serviceProviderName;
  final String emailAddress;
  final String postalAddress;
  final String servicesOffered;
  final String districtSubCounty;
  final String logo;
  final String certificateOfIncorporation;
  final String license;

  CategoryForm({
    this.id = 0,
    required this.userId,
    this.category = "",
    this.levelOfEducation = "",
    this.maritalStatus = "",
    this.numberOfDependants = "",
    this.farmersGroup = "",
    this.farmingExperience = "",
    this.productionScale = "",
    this.companyInformation = "",
    this.ownerName = "",
    this.phoneNumber = "",
    this.registrationNumber = "",
    this.registrationDate = "",
    this.physicalAddress = "",
    this.certificateAndCompliance = "",
    this.serviceProviderName = "",
    this.emailAddress = "",
    this.postalAddress = "",
    this.servicesOffered = "",
    this.districtSubCounty = "",
    this.logo = "",
    this.certificateOfIncorporation = "",
    this.license = "",
  });

  // is farmer form
  bool get isFarmerForm => category == "farmer";

  // is seed producer form
  bool get isSeedProducerForm => category == "seedproducer";

  // is service provider form
  bool get isServiceProviderForm => category == "serviceprovider";

  // get the form as json
  Map<String, dynamic> get asJson => toMap();


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id'.inSnakeCase: id});
    result.addAll({'userId'.inSnakeCase: userId});
    result.addAll({'category'.inSnakeCase: category});
    result.addAll({'levelOfEducation'.inSnakeCase: levelOfEducation});
    result.addAll({'maritalStatus'.inSnakeCase: maritalStatus});
    result.addAll({'numberOfDependants'.inSnakeCase: numberOfDependants});
    result.addAll({'farmersGroup'.inSnakeCase: farmersGroup});
    result.addAll({'farmingExperience'.inSnakeCase: farmingExperience});
    result.addAll({'productionScale'.inSnakeCase: productionScale});
    result.addAll({'companyInformation'.inSnakeCase: companyInformation});
    result.addAll({'ownerName'.inSnakeCase: ownerName});
    result.addAll({'phoneNumber'.inSnakeCase: phoneNumber});
    result.addAll({'registrationNumber'.inSnakeCase: registrationNumber});
    result.addAll({'registrationDate'.inSnakeCase: registrationDate});
    result.addAll({'physicalAddress'.inSnakeCase: physicalAddress});
    result.addAll({'certificateAndCompliance'.inSnakeCase: certificateAndCompliance});
    result.addAll({'serviceProviderName'.inSnakeCase: serviceProviderName});
    result.addAll({'emailAddress'.inSnakeCase: emailAddress});
    result.addAll({'postalAddress'.inSnakeCase: postalAddress});
    result.addAll({'servicesOffered'.inSnakeCase: servicesOffered});
    result.addAll({'districtSubCounty'.inSnakeCase: districtSubCounty});
    result.addAll({'logo'.inSnakeCase: logo});
    result.addAll({'certificateOfIncorporation'.inSnakeCase: certificateOfIncorporation});
    result.addAll({'license'.inSnakeCase: license});

    return result;
  }

  factory CategoryForm.fromMap(Map<String, dynamic> map) {
    return CategoryForm(
      id: map['id'.inSnakeCase]?.toInt() ?? 0,
      userId: map['userId'.inSnakeCase]?.toInt() ?? 0,
      category: map['category'.inSnakeCase] ?? '',
      levelOfEducation: map['levelOfEducation'.inSnakeCase] ?? '',
      maritalStatus: map['maritalStatus'.inSnakeCase] ?? '',
      numberOfDependants: map['numberOfDependants'.inSnakeCase] ?? '',
      farmersGroup: map['farmersGroup'.inSnakeCase] ?? '',
      farmingExperience: map['farmingExperience'.inSnakeCase] ?? '',
      productionScale: map['productionScale'.inSnakeCase] ?? '',
      companyInformation: map['companyInformation'.inSnakeCase] ?? '',
      ownerName: map['ownerName'.inSnakeCase] ?? '',
      phoneNumber: map['phoneNumber'.inSnakeCase] ?? '',
      registrationNumber: map['registrationNumber'.inSnakeCase] ?? '',
      registrationDate: map['registrationDate'.inSnakeCase] ?? '',
      physicalAddress: map['physicalAddress'.inSnakeCase] ?? '',
      certificateAndCompliance: map['certificateAndCompliance'.inSnakeCase] ?? '',
      serviceProviderName: map['serviceProviderName'.inSnakeCase] ?? '',
      emailAddress: map['emailAddress'.inSnakeCase] ?? '',
      postalAddress: map['postalAddress'.inSnakeCase] ?? '',
      servicesOffered: map['servicesOffered'.inSnakeCase] ?? '',
      districtSubCounty: map['districtSubCounty'.inSnakeCase] ?? '',
      logo: map['logo'.inSnakeCase] ?? '',
      certificateOfIncorporation: map['certificateOfIncorporation'.inSnakeCase] ?? '',
      license: map['license'.inSnakeCase] ?? '',
    );
  }

  /// from [FarmerForm]
  factory CategoryForm.fromFarmerForm({required FarmerForm farmerForm, required String userId}) {
    return CategoryForm(
      id: farmerForm.id,
      userId: userId,
      category: farmerForm.category,
      levelOfEducation: farmerForm.levelOfEducation,
      maritalStatus: farmerForm.maritalStatus,
      numberOfDependants: farmerForm.numberOfDependants,
      farmersGroup: farmerForm.farmersGroup,
      farmingExperience: farmerForm.farmingExperience,
      registrationDate: DateTime.now().toString(),
      productionScale: farmerForm.productionScale,
    );
  }

  /// from [ServiceProviderForm]
  factory CategoryForm.fromServiceProviderForm(
      {required ServiceProviderForm serviceProviderForm, required String userId}) {
    return CategoryForm(
      id: serviceProviderForm.id,
      userId: userId,
      serviceProviderName: serviceProviderForm.serviceProviderName,
      emailAddress: serviceProviderForm.emailAddress,
      postalAddress: serviceProviderForm.postalAddress,
      servicesOffered: serviceProviderForm.servicesOffered,
      districtSubCounty: serviceProviderForm.districtSubCounty,
      registrationDate: DateTime.now().toString(),
      logo: serviceProviderForm.logo,
      certificateOfIncorporation: serviceProviderForm.certificateOfIncorporation,
      license: serviceProviderForm.license,
    );
  }

  /// from [SeedProducerForm]
  factory CategoryForm.fromSeedProducerForm(
      {required SeedProducerForm seedProducerForm, required String userId}) {
    return CategoryForm(
      id: seedProducerForm.id,
      userId: userId,
      companyInformation: seedProducerForm.companyInformation,
      ownerName: seedProducerForm.ownerName,
      phoneNumber: seedProducerForm.phoneNumber,
      registrationNumber: seedProducerForm.registrationNumber,
      registrationDate: DateTime.now().toString(),
      physicalAddress: seedProducerForm.physicalAddress,
      certificateAndCompliance: seedProducerForm.certificateAndCompliance,
    );
  }

  @override
  String toString() {
    return 'CategoryForm(id: $id, userId: $userId, category: $category, levelOfEducation: $levelOfEducation, maritalStatus: $maritalStatus, numberOfDependants: $numberOfDependants, farmersGroup: $farmersGroup, farmingExperience: $farmingExperience, productionScale: $productionScale, companyInformation: $companyInformation, ownerName: $ownerName, phoneNumber: $phoneNumber, registrationNumber: $registrationNumber, registrationDate: $registrationDate, physicalAddress: $physicalAddress, certificateAndCompliance: $certificateAndCompliance, serviceProviderName: $serviceProviderName, emailAddress: $emailAddress, postalAddress: $postalAddress, servicesOffered: $servicesOffered, districtSubCounty: $districtSubCounty, logo: $logo, certificateOfIncorporation: $certificateOfIncorporation, license: $license)';
  }
}
