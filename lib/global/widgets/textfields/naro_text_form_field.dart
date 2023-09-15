import '../../../naro_exporter.dart';
import 'field_label.dart';

class NaroTextFormField extends ConsumerWidget {
  const NaroTextFormField({
    super.key,
    required this.formField,
  });

// form field
  final AppFormField formField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // formvalue
    final formValue = ref.watch(formField.stateProvider);

    //
    return CustomTextField(
      borderRadius: borderRadius8,
      customLabel: FormLabel(
        form: formField,
        labelText: formField.label,
      ),
      numLines: formField.maxLines,
      initialValue: formValue.toString(),
      hintText: formField.hint,
      fieldTextStyle: const TextStyle(
        fontSize: fontSize16,
        color: naroColor,
      ),
      restorationId: formField.label.toLowerCase(),
      onChanged: (newValue) {
        ref.read(formField.stateProvider.notifier).state = newValue;
      },
      validator: (newValue) {
        if (newValue == null || newValue.isEmpty) {
          return "Enter ${formField.hint} ";
        }

        return null;
      },
      keyboardType: formField.keyboardType,
      textInputAction: formField.textInputAction,
    );
  }
}
