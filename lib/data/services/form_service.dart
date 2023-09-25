import '../../naro_exporter.dart';
import '../providers/new_garden_providers.dart';
import 'api_service.dart';

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

    //  check if user is not null
    if (naroUser != null) {
      // form
      final form = ref.watch(newGardenProvider);

      return APIService.submitForm(
        naroUser: naroUser,
        formEndpoint: gardensEndPoint,
        formJson: form.asJson,
      );
    } else {
      return APIService.userNotFoundResponse();
    }
  }

  // * New Farmers Form
  Future<Response> submitFarmerForm() {
    final naroUser = ref.watch(naroUserProvider);

    // check is user is not null
    if (naroUser != null) {
      // form
      final newFarmerForm = ref.watch(newFarmerProvider);
      final form = CategoryForm.fromFarmerForm(farmerForm: newFarmerForm, userId: naroUser.userId);

      return APIService.submitForm(
        naroUser: naroUser,
        formEndpoint: completeProfileEndPoint,
        formJson: form.asJson,
      );
    } else {
      return APIService.userNotFoundResponse();
    }
  }

  // * New Seed Producer Form
  Future<Response> submitSeedProducerForm() {
    final naroUser = ref.watch(naroUserProvider);

    // check is user is not null
    if (naroUser != null) {
      // form
      final seedProducerForm = ref.watch(seedProducerFormProvider);
      final form = CategoryForm.fromSeedProducerForm(
          seedProducerForm: seedProducerForm, userId: naroUser.userId);

      return APIService.submitForm(
        naroUser: naroUser,
        formEndpoint: completeProfileEndPoint,
        formJson: form.asJson,
      );
    } else {
      return APIService.userNotFoundResponse();
    }
  }

  // * New Service Provider Form
  Future<Response> submitServiceProviderForm() {
    final naroUser = ref.watch(naroUserProvider);

    // check is user is not null
    if (naroUser != null) {
      // form
      final serviceProviderForm = ref.watch(serviceProviderFormProvider);
      final form = CategoryForm.fromServiceProviderForm(
          serviceProviderForm: serviceProviderForm, userId: naroUser.userId);

      return APIService.submitForm(
        naroUser: naroUser,
        formEndpoint: completeProfileEndPoint,
        formJson: form.asJson,
      );
    } else {
      return APIService.userNotFoundResponse();
    }
  }

  // get CategoryForm from cloud
  Future<List<CategoryForm>> getCategoryForms() {
    final naroUser = ref.watch(naroUserProvider);
    // show user category on profile is farmer seed producer etc

    return APIService.getForms(
      naroUser: naroUser,
      formEndpoint: completeProfileEndPoint,
    ).then((response) async {
      printer('getting cloud Variateies');
      // check if the response is successful
      if (response.statusCode == 200) {
        printer('Response1 = $response');

        // get the data from the response
        final List<dynamic> data = response.data;

        // check if the data is not null
        if (data.isNotEmpty) {
          // convert the data to a list of varieties
          final List<CategoryForm> categoryForms = data.map((variety) {
            return CategoryForm.fromMap(variety);
          }).toList(); //
          printer("Cloud CategoryForms $categoryForms");

          // return the varieties that belong to the user
          return categoryForms;
        }
      }
      // return an empty list
      return [];
    });
  }

  // this users complete forms
  // those who's user if is the same one as the current one for the user
  Future<List<CategoryForm>> getUserCategoryForms() async {
    final naroUser = ref.watch(naroUserProvider);

    // get the category forms
    final List<CategoryForm> categoryForms = await getCategoryForms();

    // check if the category forms is not empty
    if (categoryForms.isNotEmpty) {
      // check if the user id matches the current user id
      if (categoryForms.first.userId == naroUser?.userId.toString()) {
        // return the category forms
        return categoryForms;
      }
    }
    // return an empty list
    return [];
  }

  // is profile complete if the category form is not empty
  Future<bool> isProfileComplete() async {
    // get the user category forms
    final List<CategoryForm> categoryForms = await getUserCategoryForms();

    // check if the category forms is not empty
    if (categoryForms.isNotEmpty) {
      return true;
    }

    // return false
    return false;
  }
}
