import '../../../naro_exporter.dart';

class GardenWarning extends StatelessWidget {
  const GardenWarning({
    super.key,
    // required this.form,
    required this.isActive,
  });

  // final naroForm form;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final warningColor = isActive ? naroColor : naroRed;
    const warningTextColor = naroWhite;
    final error = isActive ? "Submitted" : "Missing";

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacing8,
        vertical: spacing2,
      ),
      decoration: BoxDecoration(
        color: warningColor,
        borderRadius: borderRadius4,
      ),
      child: Text(
        error,
        style: const TextStyle(
          color: warningTextColor,
          fontSize: fontSize10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
