import '../../../naro_exporter.dart';
import '../components/auth_heading.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ExpandedScrollingColumn(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PaddedLogo(),
        VerticalSpace(of: spacing16),
        AuthHeader(
          heading: "Welcome to NARO",
          textAlign: TextAlign.center,
        ),
        VerticalSpace(of: spacing16),
        Text(
          "Enter your email and we will send you instructions on how to reset your password.",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: fontSize14,
            color: naroBlack,
          ),
        ),
      ],
    );
  }
}
