import '../../naro_exporter.dart';
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
      sttsUser: naroUser,
      formEndpoint: gardensEndPoint,
      formJson: form.asJson,
    );
  }
}
