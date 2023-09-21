import '../../naro_exporter.dart';

class AppForm {
  // title
  final String title;
  // description
  final String description;
  // form
  // final Form form;
  // form key
  final Provider<GlobalKey<FormState>> formKeyProvider;

  // thumbnail
  final String thumbnail;

  // is form submitted
  final bool isFormSubmitted;

  // list of AppFormField
  final List<AppFormField> formFields;

  // form endpoint
  final String endpoint;

  // form submit function
  final Future<Response> Function() submit;

  AppForm({
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.formKeyProvider,
    required this.formFields,
    required this.submit,
    this.endpoint = "",
    this.isFormSubmitted = false,
  });
}
