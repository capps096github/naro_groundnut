// Project imports:
import '../../../naro_exporter.dart';
import '../components/auth_heading.dart';
import 'signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ExpandedScrollingColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        PaddedLogo(),
        Spacer(),
        AuthHeader(heading: "Sign Up"),
        VerticalSpace(of: spacing16),
        SignUpForm(),
        Spacer(),
      ],
    );
  }
}
