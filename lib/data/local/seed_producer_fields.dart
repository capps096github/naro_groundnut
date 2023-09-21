import '../../naro_exporter.dart';

final seedProducerFormFields = [
  AppFormField(
    label: 'Company Information',
    hint: 'Enter company information',
    stateProvider: companyInformationProvider,
  ),
  AppFormField(
    label: 'Owner Name',
    hint: 'Enter owner name',
    stateProvider: ownerNameProvider,
  ),
  AppFormField(
    label: 'Phone Number',
    hint: 'Enter phone number',
    stateProvider: seedPhoneNumberProvider,
    keyboardType: TextInputType.phone,
  ),
  AppFormField(
    label: 'Registration Number',
    hint: 'Enter registration number',
    stateProvider: registrationNumberProvider,
  ),
  AppFormField(
    label: 'Registration Date',
    hint: 'Select registration date',
    stateProvider: registrationDateProvider,
    fieldType: FieldType.date,
  ),
  AppFormField(
    label: 'Physical Address',
    hint: 'Enter physical address',
    stateProvider: physicalAddressProvider,
  ),
  AppFormField(
    label: 'Certificate and Compliance',
    hint: 'Enter certificate and compliance',
    stateProvider: certificateAndComplianceProvider,
    fieldType: FieldType.file,
  ),

];
