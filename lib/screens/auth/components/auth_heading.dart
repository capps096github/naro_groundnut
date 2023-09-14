import '../../../naro_exporter.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.heading,
    this.textAlign = TextAlign.start,
  });

  // text
  final String heading;

  // text align
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      textAlign: textAlign,
      style: const TextStyle(
        fontSize: fontSize32,
        fontWeight: FontWeight.w900,
        color: naroBlack,
      ),
    );
  }
}
