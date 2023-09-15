import '../../../naro_exporter.dart';

import 'section_title_text.dart';

class DetailFormHints extends StatelessWidget {
  const DetailFormHints({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: horizontalPadding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitleText(
              title: "Hints:",
              bodyText: "Here are some hints to help you fill in the form.",
            ),
            VerticalSpace(of: spacing8),
            FormHint(
              labelText: "means that a given field is required and must be filled in.",
              isRequired: true,
            ),
            VerticalSpace(of: spacing8),
            FormHint(
              labelText: "means that a given field is optional and may be left blank.",
              isRequired: false,
            ),
          ],
        ),
      ),
    );
  }
}

class FormHint extends StatelessWidget {
  const FormHint({super.key, required this.labelText, required this.isRequired});

  // label text
  final String labelText;

  // is required
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // pill like chip to show required or optional
        RequiredOptionalText(isRequired: isRequired),
        const HorizontalSpace(of: spacing8),
        Expanded(
          child: Text(
            labelText,
            style: const TextStyle(
              fontSize: fontSize12,
              color:naroBlack,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
