import '../../../naro_exporter.dart';
import 'detail_form_field.dart';

class DetailForm extends ConsumerWidget {
  const DetailForm({
    super.key,
    required this.form,
  });

  final AppForm form;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.watch(form.formKeyProvider);

    return SliverToBoxAdapter(
      child: Padding(
        padding: padding16,
        child: AutofillGroup(
          key: const ValueKey('naro_form'),
          child: Form(
            key: formKey,
            child: Column(
              children: List.generate(form.formFields.length, (index) {
                final formField = form.formFields[index];
                return DetailFormField(formField: formField);
              }),
            ),
          ),
        ),
      ),
    );
  }
}
