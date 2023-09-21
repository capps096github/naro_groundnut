import '../../naro_exporter.dart';

final serviceProviderFormFields = [
  AppFormField(
    label: 'Service Provider Name',
    hint: 'Enter service provider name',
    stateProvider: serviceProviderNameProvider,
  ),
  AppFormField(
    label: 'Email Address',
    hint: 'Enter email address',
    stateProvider: emailAddressProvider,
  ),
  AppFormField(
    label: 'Postal Address',
    hint: 'Enter postal address',
    stateProvider: postalAddressProvider,
  ),
  AppFormField(
    label: 'Services Offered',
    hint: 'Enter services offered',
    stateProvider: servicesOfferedProvider,
  ),
  AppFormField(
    label: 'District/Subcounty',
    hint: 'Enter district/subcounty',
    stateProvider: districtSubCountyProvider,
  ),
  AppFormField(
    label: 'Logo',
    hint: 'Enter logo',
    stateProvider: logoProvider,
    fieldType: FieldType.file,
  ),
  AppFormField(
    label: 'Certificate of Incorporation',
    hint: 'Enter certificate of incorporation',
    stateProvider: certificateOfIncorporationProvider,
    fieldType: FieldType.file,
  ),
  AppFormField(
    label: 'License',
    hint: 'Enter license',
    stateProvider: licenseProvider,
    fieldType: FieldType.file,
  ),
];
