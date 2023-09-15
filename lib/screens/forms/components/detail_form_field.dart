import '../../../naro_exporter.dart';

class DetailFormField extends ConsumerWidget {
  const DetailFormField({required this.formField, super.key});

// form field
  final AppFormField formField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    return Padding(
      padding: verticalPadding16,
      child: formFieldWidget(formField),
    );
  }

  Widget formFieldWidget(AppFormField formField) {
    switch (formField.fieldType) {
      case FieldType.date:
        return DateFormField(formField: formField);
      case FieldType.dropdown:
        return DropdownFormField(formField: formField);
      case FieldType.file:
        return FileFormField(formField: formField);
      case FieldType.gnutVarietyDropdown:
        return GnutsVarietiesField(formField: formField);
      default:
        return NaroTextFormField(formField: formField);
    }
  }
}
