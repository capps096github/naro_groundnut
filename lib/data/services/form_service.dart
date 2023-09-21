import '../../naro_exporter.dart';
import '../providers/farmer_form_providers.dart';
import '../providers/new_garden_providers.dart';
import 'app_form_service.dart';

//* Form Service
final formServiceProvider = Provider<FormService>((ref) {
  return FormService(ref);
});

class FormService {
  final Ref ref;

  FormService(this.ref);

  // Create an instance of Dio
  final Dio dio = Dio();

  // * New Garden form
  Future<Response> newGardenForm() {
    final naroUser = ref.watch(naroUserProvider);

    // form
    final form = ref.watch(newGardenProvider);

    return AppFormService.submitForm(
      naroUser: naroUser,
      formEndpoint: gardensEndPoint,
      formJson: form.asJson,
    );
  }

  // * New Farmers Form
  Future<Response> submitFarmerForm() {
    final naroUser = ref.watch(naroUserProvider);

    // form
    final form = ref.watch(newFarmerProvider);

    return AppFormService.submitForm(
      naroUser: naroUser,
      formEndpoint: completeProfileEndPoint,
      formJson: form.asJson,
    );
  }

  // * New Seed Producer Form
  Future<Response> submitSeedProducerForm() {
    final naroUser = ref.watch(naroUserProvider);

    // form
    final form = ref.watch(seedProducerFormProvider);

    return AppFormService.submitForm(
      naroUser: naroUser,
      formEndpoint: completeProfileEndPoint,
      formJson: form.asJson,
    );
  }

  // * New Service Provider Form
  Future<Response> submitServiceProviderForm() {
    final naroUser = ref.watch(naroUserProvider);

    // form
    final form = ref.watch(serviceProviderFormProvider);

    return AppFormService.submitForm(
      naroUser: naroUser,
      formEndpoint: completeProfileEndPoint,
      formJson: form.asJson,
    );
  }
}
