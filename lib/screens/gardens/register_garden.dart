import '../../data/local/new_garden_fields.dart';
import '../../data/providers/new_garden_providers.dart';
import '../../naro_exporter.dart';
import '../forms/form_detail_screen.dart';

class RegisterGarden extends ConsumerWidget {
  const RegisterGarden({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // form service
  final formService = ref.watch(formServiceProvider);

    return FormDetailScreen(
        form: AppForm(
          title: "Garden Registration",
          description:
              "Register your garden to be part of the Naro community.",
          thumbnail:
              "https://images.unsplash.com/photo-1464226184884-fa280b87c399?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
          formKeyProvider: newGardenFormKeyProvider,
          formFields: newGardenFormFields,
          endpoint: gardensEndPoint,
          submit: formService.newGardenForm,
        ),
      );
  }
}
