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
      borderRadius: formField.hasFullRadius ? borderRadius120 : borderRadius8,
      restorationId: formField.label.inSnakeCase,
      customLabel: FormLabel(
        form: formField,
        labelText: formField.label,
      ),
      numLines: formField.maxLines,
      maxLength: formField.maxLength,
      initialValue: formValue.toString(),
      hintText: formField.hint,
      fieldTextStyle: const TextStyle(
        fontSize: fontSize16,
        color: naroColor,
      ),
      onChanged: (newValue) {
        if (formField.validatorRegex != null) {
          if (formField.validatorRegex!.hasMatch(newValue)) {
            ref.read(formField.stateProvider.notifier).state = newValue;
          }
        } else {
          ref.read(formField.stateProvider.notifier).state = newValue;
        }
      },
      validator: (newValue) {
        if (newValue == null || newValue.isEmpty) {
          return "Enter ${formField.hint} ";
        }

        if (formField.validatorRegex != null) {
          if (!formField.validatorRegex!.hasMatch(newValue)) {
            return " Invalid ${formField.label}";
          }
        }

        return null;
      },
      keyboardType: formField.keyboardType,
      prefixIcon: formField.prefixIcon,
      textInputAction: formField.textInputAction,
    );
  }
}
