
import '../../naro_exporter.dart';

final companyInformationProvider = StateProvider<String>((_) => '');
final ownerNameProvider = StateProvider<String>((_) => '');
final seedPhoneNumberProvider = StateProvider<String>((_) => '');
final registrationNumberProvider = StateProvider<String>((_) => '');
final registrationDateProvider = StateProvider<DateTime>((_) => DateTime.now());
final physicalAddressProvider = StateProvider<String>((_) => '');
final certificateAndComplianceProvider = StateProvider<String>((_) => '');
final categoryProvider = StateProvider<String>((_) => '');

// SeedProducerForm provider
final seedProducerFormProvider = Provider<SeedProducerForm>((ref) {
  final companyInformation = ref.watch(companyInformationProvider);
  final ownerName = ref.watch(ownerNameProvider);
  final phoneNumber = ref.watch(seedPhoneNumberProvider);
  final registrationNumber = ref.watch(registrationNumberProvider);
  final registrationDate = ref.watch(registrationDateProvider);
  final physicalAddress = ref.watch(physicalAddressProvider);
  final certificateAndCompliance = ref.watch(certificateAndComplianceProvider);
  final category = ref.watch(categoryProvider);

  return SeedProducerForm(
    companyInformation: companyInformation,
    ownerName: ownerName,
    phoneNumber: phoneNumber,
    registrationNumber: registrationNumber,
    registrationDate: registrationDate,
    physicalAddress: physicalAddress,
    certificateAndCompliance: certificateAndCompliance,
    category: category,
  );
});

final seedProducerFormKeyProvider = Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());
