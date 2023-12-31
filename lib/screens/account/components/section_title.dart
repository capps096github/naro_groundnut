import '../../../naro_exporter.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.sectionText,
    this.textColor = naroColor,
    this.backgroundColor = naroTransparent,
  });
  final String sectionText;
  final Color textColor, backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          sectionText.toUpperCase(),
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
