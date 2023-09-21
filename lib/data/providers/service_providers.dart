import '../../naro_exporter.dart';

final serviceProviderNameProvider = StateProvider<String>((_) => '');
final emailAddressProvider = StateProvider<String>((_) => '');
final postalAddressProvider = StateProvider<String>((_) => '');
final servicesOfferedProvider = StateProvider<String>((_) => '');
final districtSubCountyProvider = StateProvider<String>((_) => '');
final logoProvider = StateProvider<String>((_) => '');
final certificateOfIncorporationProvider = StateProvider<String>((_) => '');
final licenseProvider = StateProvider<String>((_) => '');

final serviceProviderFormKeyProvider =
    Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

// ServiceProviderForm provider
final serviceProviderFormProvider = Provider<ServiceProviderForm>((ref) {
  final serviceProviderName = ref.watch(serviceProviderNameProvider);
  final emailAddress = ref.watch(emailAddressProvider);
  final postalAddress = ref.watch(postalAddressProvider);
  final servicesOffered = ref.watch(servicesOfferedProvider);
  final districtSubCounty = ref.watch(districtSubCountyProvider);
  final logo = ref.watch(logoProvider);
  final certificateOfIncorporation = ref.watch(certificateOfIncorporationProvider);
  final license = ref.watch(licenseProvider);

  return ServiceProviderForm(
    serviceProviderName: serviceProviderName,
    emailAddress: emailAddress,
    postalAddress: postalAddress,
    servicesOffered: servicesOffered,
    districtSubCounty: districtSubCounty,
    logo: logo,
    certificateOfIncorporation: certificateOfIncorporation,
    license: license,
  );
});
