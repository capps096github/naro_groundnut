import '../../../naro_exporter.dart';

class FormCardContent extends StatelessWidget {
  const FormCardContent({
    super.key,
    required this.form,
  });

  final AppForm form;

  @override
  Widget build(BuildContext context) {
    final formTextColor = form.isActive ? naroColor : naroBlack;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        Text(
          form.title,
          style: TextStyle(
            color: formTextColor,
            fontSize: fontSize16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpace(of: spacing2),
        Text(
          form.description,
          maxLines: 2,
          style: TextStyle(
            color: formTextColor,
            fontSize: fontSize12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
