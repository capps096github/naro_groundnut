import '../../../naro_exporter.dart';

class FormWarning extends StatelessWidget {
  const FormWarning({
    super.key,
    required this.form,
  });

  final AppForm form;

  @override
  Widget build(BuildContext context) {
    final warningColor = form.isActive ? naroColor : naroRed;
    const warningTextColor = naroWhite;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: spacing8,
        vertical: spacing2,
      ),
      decoration: BoxDecoration(
        color: warningColor,
        borderRadius: borderRadius4,
      ),
      child: Text(
        form.conditionToActivate ?? '',
        style: const TextStyle(
          color: warningTextColor,
          fontSize: fontSize10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
